LIBRARY IEEE;  -- 导入IEEE标准库，其中包含了标准逻辑类型定义
USE IEEE.STD_LOGIC_1164.ALL;  -- 使用IEEE标准库中的所有标准逻辑定义

ENTITY Road_Events IS
	PORT(DIN : IN STD_LOGIC_VECTOR(2 DOWNTO 0);  -- 输入端口DIN，是一个3位的标准逻辑向量
		  CLK : IN STD_LOGIC;  -- 输入端口CLK，是一个标准逻辑信号
		  Q   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));  -- 输出端口Q，是一个2位的标准逻辑向量
END Road_Events;

ARCHITECTURE BEHAV OF Road_Events IS
BEGIN
	PROCESS(CLK)
	BEGIN
        -- 在时钟信号CLK的上升沿进行处理
        IF CLK'EVENT AND CLK = '1' THEN
            -- 根据输入DIN的值进行条件判断
            IF    DIN = "000" THEN Q <= "00";  -- 如果DIN为"000"，则输出"00"
            ELSIF DIN = "001" THEN Q <= "01";  -- 如果DIN为"001"，则输出"01"
            ELSIF DIN = "010" THEN Q <= "00";  -- 如果DIN为"010"，则输出"00"
            ELSIF DIN = "011" THEN Q <= "10";  -- 如果DIN为"011"，则输出"10"
             ELSIF DIN = "111" THEN Q <= "11";  -- 对于其他情况，输出"11"
            END IF;
        END IF;
    END PROCESS;
END BEHAV;