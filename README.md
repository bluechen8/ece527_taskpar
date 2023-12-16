# Run HLS
`make run DEVICE="/opt/xilinx/platforms/xilinx_u250_xdma_201830_2/xilinx_u250_xdma_201830_2.xpfm" CSIM=1 CSYNTH=1 COSIM=1`

# Build Host program
- as a reference
`g++ -o concurrent_kernel_execution /home/luoyanl2/FPGA_test/Vitis_Accel_Examples/common/includes/xcl2/xcl2.cpp src/host.cpp -I/opt/xilinx/xrt/include -I/opt/xilinx/Vivado/2020.1/include -Wall -O0 -g -std=c++1y -I/home/luoyanl2/FPGA_test/Vitis_Accel_Examples/common/includes/xcl2 -fmessage-length=0 -L/opt/xilinx/xrt/lib -pthread -lOpenCL -lrt -lstdc++`
