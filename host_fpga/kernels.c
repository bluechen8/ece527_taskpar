#define _POSIX_C_SOURCE 199309L
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include "util_old.h"
#include "assert.h"

#define REPETITIONS 100

int main() {
    struct timespec start, end;
    cl_ulong time_start, time_end;
    cl_ulong gau_total_time = 0;
    cl_ulong sob_total_time = 0;
    cl_ulong nonmax_total_time = 0;
    cl_ulong hyst_total_time = 0;
    cl_ulong total_time = 0;
    // Get Platform and Device Info
    cl_uint numPlatforms;
    cl_platform_id platform_id = NULL;
    cl_int status = clGetPlatformIDs(1, NULL, &numPlatforms);
    if (status != CL_SUCCESS) {
        printf("Error: Getting Platforms. (clGetPlatformsIDs)\n");
        return 1;
    }
    printf("[+] Platform: numPlatforms -> %d\n", \
        numPlatforms);
    assert(numPlatforms > 0);
    cl_platform_id* platforms = (cl_platform_id*)malloc(numPlatforms*sizeof(cl_platform_id));
    status = clGetPlatformIDs(numPlatforms, platforms, NULL);
    // dump platform info
    char vendor[100] = {0};
    char name[100] = {0};
    for (int i = 0; i < numPlatforms; i++) {
        clGetPlatformInfo(platforms[i], CL_PLATFORM_VENDOR, sizeof(vendor), vendor, NULL);
        clGetPlatformInfo(platforms[i], CL_PLATFORM_NAME, sizeof(name), name, NULL);
        printf("[++] Platform: %d -> vendor: %s, name: %s\n", \
            i, vendor, name);
    }
    platform_id = platforms[0];  // 0 xilinx
    free(platforms);

    cl_uint numDevices;
    cl_device_id device_id = NULL;
    status = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ACCELERATOR, 1, &device_id, &numDevices);
    if(status != CL_SUCCESS) {
        printf("Error: Getting CPU device. (clGetDeviceIDs)\n");
        return 1;
    }
    printf("[+] Device: numDevices -> %d\n", \
        numDevices);
    // dump device info
    cl_char vendor_name[100] = {0};
    cl_char device_name[100] = {0};
    cl_char driver_version[100] = {0};
    status = clGetDeviceInfo(device_id, CL_DEVICE_VENDOR, sizeof(vendor_name), vendor_name, NULL);
    status |= clGetDeviceInfo(device_id, CL_DEVICE_NAME, sizeof(device_name), device_name, NULL);
    status |= clGetDeviceInfo(device_id, CL_DEVICE_VERSION, sizeof(driver_version), driver_version, NULL);
    assert(status == CL_SUCCESS);
    printf("[++] vendor_name -> %s; device_name -> %s; driver_version -> %s\n", \
        vendor_name, device_name, driver_version);

    // Create an OpenCL context
    cl_context context = clCreateContext(NULL, 1, &device_id, NULL, NULL, &status);
    assert(status == CL_SUCCESS);
    printf("[+] context created\n");
    // Create a command queue
    cl_command_queue queue = clCreateCommandQueue(context, device_id, CL_QUEUE_PROFILING_ENABLE, &status);
    assert(status == CL_SUCCESS);
    printf("[+] command queue created\n");

    // Load bitstream
    unsigned char *kernelbinary;
    int size = load_file_to_memory("../kernel/ced_kernels.xclbin", (char **) &kernelbinary);
    // int size = load_file_to_memory("../fpga_kernels/build_dir.hw.xilinx_u250_xdma_201830_2/ced_kernels.xclbin", (char **) &kernelbinary);
    size_t size_var = size; 
    cl_program program = clCreateProgramWithBinary(context, 1, &device_id, 
                            &size_var,(const unsigned char **) &kernelbinary, 
                            NULL, &status);
    assert(status == CL_SUCCESS);
    cl_kernel gau_kernel = clCreateKernel(program, "gau", &status);
    assert(status == CL_SUCCESS);
    cl_kernel sob_kernel = clCreateKernel(program, "sobel", &status);
    assert(status == CL_SUCCESS);
    cl_kernel nonmax_kernel = clCreateKernel(program, "nms", &status);
    assert(status == CL_SUCCESS);
    cl_kernel hyst_kernel = clCreateKernel(program, "hyst", &status);
    assert(status == CL_SUCCESS);
    printf("[+] kernel loaded\n");

    // allocate input image (4KB aligned)
    uint8_t *input_img = (uint8_t*)malloc(ROWS*COLS*sizeof(uint8_t));
    uint8_t *output_img = (uint8_t*)malloc(ROWS*COLS*sizeof(uint8_t));
    posix_memalign((void**)&input_img, 4096, ROWS*COLS*sizeof(uint8_t));
    posix_memalign((void**)&output_img, 4096, ROWS*COLS*sizeof(uint8_t));
    printf("[+] input / ouput pages address: %p / %p\n", input_img, output_img);
    srand(527);

    // allocate buffers
    int cols = COLS;
    int rows = ROWS;
    for(int i = 0; i < rows; i++) {
        for(int j=0; j<cols; j++) {
            input_img[j + i * cols] = rand();
            // printf("%u ", input_img[j + i * cols]);
        }
        // printf("\n");
    }
    size_t img_buffer_size = cols * rows * sizeof(char);
    size_t grad_buffer_size = cols * rows * sizeof(GradPix);
    // buffer interact with host
    cl_mem input_buf = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_USE_HOST_PTR, img_buffer_size, input_img, &status);
    assert(status == CL_SUCCESS);
    cl_mem output_buf = clCreateBuffer(context, CL_MEM_WRITE_ONLY | CL_MEM_USE_HOST_PTR, img_buffer_size, output_img, &status);
    assert(status == CL_SUCCESS);
    // input/output buffer
    cl_mem in_out_buf[2];
    in_out_buf[0] = clCreateBuffer(context, CL_MEM_READ_WRITE, img_buffer_size, NULL, &status);
    assert(status == CL_SUCCESS);
    in_out_buf[1] = clCreateBuffer(context, CL_MEM_READ_WRITE, img_buffer_size, NULL, &status);
    assert(status == CL_SUCCESS);
    // theta buffer
    cl_mem theta_buf = clCreateBuffer(context, CL_MEM_READ_WRITE, grad_buffer_size, NULL, &status);
    assert(status == CL_SUCCESS);
    printf("[+] buffer created\n");

    // Create events
    cl_event kernel_events[4];

    // Set the arguments of the kernel
    /* Only Gaussian */
    // status = clSetKernelArg(gau_kernel, 0, sizeof(cl_mem), (void *)&input_buf);
    // status |= clSetKernelArg(gau_kernel, 1, sizeof(cl_mem), (void *)&output_buf);
    // assert(status == CL_SUCCESS);
    /* Gaussian + Sobel */
    // status = clSetKernelArg(gau_kernel, 0, sizeof(cl_mem), (void *)&input_buf);
    // status |= clSetKernelArg(gau_kernel, 1, sizeof(cl_mem), (void *)&in_out_buf[0]);
    // assert(status == CL_SUCCESS);
    // status = clSetKernelArg(sob_kernel, 0, sizeof(cl_mem), (void *)&input_buf);
    // status |= clSetKernelArg(sob_kernel, 1, sizeof(cl_mem), (void *)&theta_buf);
    // status |= clSetKernelArg(sob_kernel, 2, sizeof(cl_mem), (void *)&output_buf);
    // assert(status == CL_SUCCESS);
    status = clSetKernelArg(gau_kernel, 0, sizeof(cl_mem), (void *)&input_buf);
    status |= clSetKernelArg(gau_kernel, 1, sizeof(cl_mem), (void *)&in_out_buf[0]);
    assert(status == CL_SUCCESS);
    status = clSetKernelArg(sob_kernel, 0, sizeof(cl_mem), (void *)&in_out_buf[0]);
    status |= clSetKernelArg(sob_kernel, 1, sizeof(cl_mem), (void *)&theta_buf);
    assert(status == CL_SUCCESS);
    status = clSetKernelArg(nonmax_kernel, 0, sizeof(cl_mem), (void *)&theta_buf);
    status |= clSetKernelArg(nonmax_kernel, 1, sizeof(cl_mem), (void *)&in_out_buf[1]);
    assert(status == CL_SUCCESS);
    status = clSetKernelArg(hyst_kernel, 0, sizeof(cl_mem), (void *)&in_out_buf[1]);
    status |= clSetKernelArg(hyst_kernel, 1, sizeof(cl_mem), (void *)&output_buf);
    assert(status == CL_SUCCESS);

    for (int test_id = 0; test_id < REPETITIONS; test_id++) {
        // Start
        assert(clock_gettime(CLOCK_MONOTONIC_RAW, &start) != -1);

        // Migrate
        cl_mem mems[5] = {input_buf, output_buf, in_out_buf[0], in_out_buf[1], theta_buf};
        status = clEnqueueMigrateMemObjects(queue, 5, mems, 0, 0, NULL, NULL);
        assert(status == CL_SUCCESS);
        // printf("[+] host->device migrate done\n");

        // Enque kernels
        status = clEnqueueTask(queue, gau_kernel, 0, NULL, &kernel_events[0]);
        assert(status == CL_SUCCESS);
        status = clEnqueueTask(queue, sob_kernel, 0, NULL, &kernel_events[1]);
        assert(status == CL_SUCCESS);
        status = clEnqueueTask(queue, nonmax_kernel, 0, NULL, &kernel_events[2]);
        assert(status == CL_SUCCESS);
        status = clEnqueueTask(queue, hyst_kernel, 0, NULL, &kernel_events[3]);
        assert(status == CL_SUCCESS);
        // printf("[+] kernel enqueued done\n");

        // Migrate
        status = clEnqueueMigrateMemObjects(queue, 1, &output_buf, CL_MIGRATE_MEM_OBJECT_HOST, 0, NULL, NULL);
        assert(status == CL_SUCCESS);
        // printf("[+] device->host migrate done\n");

        // Finish
        clFinish(queue);
        assert(clock_gettime(CLOCK_MONOTONIC_RAW, &end) != -1);

        // Read Profiling
        total_time += BILLION * (end.tv_sec - start.tv_sec) + end.tv_nsec - start.tv_nsec;
        status = clGetEventProfilingInfo(kernel_events[0], CL_PROFILING_COMMAND_START, sizeof(time_start), &time_start, NULL);
        status |= clGetEventProfilingInfo(kernel_events[0], CL_PROFILING_COMMAND_END, sizeof(time_end), &time_end, NULL);
        assert(status == CL_SUCCESS);
        gau_total_time += time_end - time_start;
        status = clGetEventProfilingInfo(kernel_events[1], CL_PROFILING_COMMAND_START, sizeof(time_start), &time_start, NULL);
        status |= clGetEventProfilingInfo(kernel_events[1], CL_PROFILING_COMMAND_END, sizeof(time_end), &time_end, NULL);
        assert(status == CL_SUCCESS);
        sob_total_time += time_end - time_start;
        status = clGetEventProfilingInfo(kernel_events[2], CL_PROFILING_COMMAND_START, sizeof(time_start), &time_start, NULL);
        status |= clGetEventProfilingInfo(kernel_events[2], CL_PROFILING_COMMAND_END, sizeof(time_end), &time_end, NULL);
        assert(status == CL_SUCCESS);
        nonmax_total_time += time_end - time_start;
        status = clGetEventProfilingInfo(kernel_events[3], CL_PROFILING_COMMAND_START, sizeof(time_start), &time_start, NULL);
        status |= clGetEventProfilingInfo(kernel_events[3], CL_PROFILING_COMMAND_END, sizeof(time_end), &time_end, NULL);
        assert(status == CL_SUCCESS);
        hyst_total_time += time_end - time_start;

        if (test_id == 0) {
            // Output image to file
            FILE *fp = fopen("fpga_cal.txt", "w");
            for(int i = 0; i < rows; i++) {
                for(int j = 0; j < cols; j++) {
                    fprintf(fp, "%u ", output_img[j + i * cols]);
                }
                fprintf(fp, "\n");
            }
            fclose(fp);
        }
    }

    // Print Profiling
    printf("Gaussian kernel latency: %lu ns\n", gau_total_time / REPETITIONS);
    printf("Sobel kernel latency: %lu ns\n", sob_total_time / REPETITIONS);
    printf("NonMaxSuppression kernel latency: %lu ns\n", nonmax_total_time / REPETITIONS);
    printf("Hysteresis kernel latency: %lu ns\n", hyst_total_time / REPETITIONS);
    printf("Whole Canny Edge Detection latency: %lu ns\n", total_time / REPETITIONS);

    // Release
    clReleaseKernel(gau_kernel);
    clReleaseKernel(sob_kernel);
    clReleaseKernel(nonmax_kernel);
    clReleaseKernel(hyst_kernel);
    clReleaseProgram(program);
    clReleaseCommandQueue(queue);
    clReleaseContext(context);
    clReleaseMemObject(input_buf);
    clReleaseMemObject(output_buf);
    clReleaseMemObject(in_out_buf[0]);
    clReleaseMemObject(in_out_buf[1]);
    clReleaseMemObject(theta_buf);
    return 0;
}