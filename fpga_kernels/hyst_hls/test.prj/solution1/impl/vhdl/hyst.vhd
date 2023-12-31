-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hyst is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    data_address0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    data_ce0 : OUT STD_LOGIC;
    data_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
    out_r_address0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    out_r_ce0 : OUT STD_LOGIC;
    out_r_we0 : OUT STD_LOGIC;
    out_r_d0 : OUT STD_LOGIC_VECTOR (7 downto 0) );
end;


architecture behav of hyst is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "hyst_hyst,hls_ip_2020_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu250-figd2104-2L-e,HLS_INPUT_CLOCK=2.500000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.739000,HLS_SYN_LAT=66817,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=157,HLS_SYN_LUT=193,HLS_VERSION=2020_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv9_100 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv8_32 : STD_LOGIC_VECTOR (7 downto 0) := "00110010";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal xi_reg_87 : STD_LOGIC_VECTOR (8 downto 0);
    signal icmp_ln26_fu_98_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal add_ln26_fu_104_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln26_reg_165 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_1_fu_114_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_1_reg_170 : STD_LOGIC_VECTOR (15 downto 0);
    signal icmp_ln27_fu_126_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln27_reg_175 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln27_reg_175_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln27_reg_175_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln27_fu_132_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal add_ln34_fu_138_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln34_reg_184 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln34_fu_143_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln34_reg_189 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln34_reg_189_pp0_iter2_reg : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln39_fu_147_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln39_reg_199 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal yi_reg_76 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal empty_6_fu_110_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln27_fu_122_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((icmp_ln26_fu_98_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then
                    if ((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3)) then 
                        ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state3);
                    elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                        ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                elsif (((icmp_ln26_fu_98_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    xi_reg_87_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln27_fu_126_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                xi_reg_87 <= add_ln27_fu_132_p2;
            elsif (((icmp_ln26_fu_98_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                xi_reg_87 <= ap_const_lv9_0;
            end if; 
        end if;
    end process;

    yi_reg_76_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                yi_reg_76 <= ap_const_lv9_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                yi_reg_76 <= add_ln26_reg_165;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                add_ln26_reg_165 <= add_ln26_fu_104_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln27_fu_126_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                add_ln34_reg_184 <= add_ln34_fu_138_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln27_reg_175 <= icmp_ln27_fu_126_p2;
                icmp_ln27_reg_175_pp0_iter1_reg <= icmp_ln27_reg_175;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                icmp_ln27_reg_175_pp0_iter2_reg <= icmp_ln27_reg_175_pp0_iter1_reg;
                    zext_ln34_reg_189_pp0_iter2_reg(15 downto 0) <= zext_ln34_reg_189(15 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln27_reg_175_pp0_iter1_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln39_reg_199 <= icmp_ln39_fu_147_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln26_fu_98_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    tmp_1_reg_170(15 downto 8) <= tmp_1_fu_114_p3(15 downto 8);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln27_reg_175 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    zext_ln34_reg_189(15 downto 0) <= zext_ln34_fu_143_p1(15 downto 0);
            end if;
        end if;
    end process;
    tmp_1_reg_170(7 downto 0) <= "00000000";
    zext_ln34_reg_189(63 downto 16) <= "000000000000000000000000000000000000000000000000";
    zext_ln34_reg_189_pp0_iter2_reg(63 downto 16) <= "000000000000000000000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln26_fu_98_p2, ap_CS_fsm_state2, icmp_ln27_fu_126_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln26_fu_98_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln27_fu_126_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) and not(((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0))))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln27_fu_126_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0)))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    add_ln26_fu_104_p2 <= std_logic_vector(unsigned(yi_reg_76) + unsigned(ap_const_lv9_1));
    add_ln27_fu_132_p2 <= std_logic_vector(unsigned(xi_reg_87) + unsigned(ap_const_lv9_1));
    add_ln34_fu_138_p2 <= std_logic_vector(unsigned(tmp_1_reg_170) + unsigned(zext_ln27_fu_122_p1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state7 <= ap_CS_fsm(3);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_exit_iter0_state3_assign_proc : process(icmp_ln27_fu_126_p2)
    begin
        if ((icmp_ln27_fu_126_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(icmp_ln26_fu_98_p2, ap_CS_fsm_state2)
    begin
        if (((icmp_ln26_fu_98_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(icmp_ln26_fu_98_p2, ap_CS_fsm_state2)
    begin
        if (((icmp_ln26_fu_98_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    data_address0 <= zext_ln34_fu_143_p1(16 - 1 downto 0);

    data_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
            data_ce0 <= ap_const_logic_1;
        else 
            data_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    empty_6_fu_110_p1 <= yi_reg_76(8 - 1 downto 0);
    icmp_ln26_fu_98_p2 <= "1" when (yi_reg_76 = ap_const_lv9_100) else "0";
    icmp_ln27_fu_126_p2 <= "1" when (xi_reg_87 = ap_const_lv9_100) else "0";
    icmp_ln39_fu_147_p2 <= "1" when (unsigned(data_q0) > unsigned(ap_const_lv8_32)) else "0";
    out_r_address0 <= zext_ln34_reg_189_pp0_iter2_reg(16 - 1 downto 0);

    out_r_ce0_assign_proc : process(ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            out_r_ce0 <= ap_const_logic_1;
        else 
            out_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    out_r_d0 <= 
        ap_const_lv8_FF when (icmp_ln39_reg_199(0) = '1') else 
        ap_const_lv8_0;

    out_r_we0_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln27_reg_175_pp0_iter2_reg, ap_enable_reg_pp0_iter3)
    begin
        if (((icmp_ln27_reg_175_pp0_iter2_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            out_r_we0 <= ap_const_logic_1;
        else 
            out_r_we0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_1_fu_114_p3 <= (empty_6_fu_110_p1 & ap_const_lv8_0);
    zext_ln27_fu_122_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(xi_reg_87),16));
    zext_ln34_fu_143_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln34_reg_184),64));
end behav;
