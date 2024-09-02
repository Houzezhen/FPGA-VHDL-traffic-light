LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Counter_55 IS
	PORT(
		CLK, RST, EN : IN STD_LOGIC; -- 时钟、复位和使能信号
		START : IN STD_LOGIC; -- 启动信号
		MODE : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- 模式选择
		CQ   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- 计数器输出
		COUT : OUT STD_LOGIC -- 溢出信号
	);
END Counter_55;

ARCHITECTURE BEHAV OF Counter_55 IS
BEGIN
	PROCESS(CLK, RST, EN, MODE)
	VARIABLE CQI  : STD_LOGIC_VECTOR(7 DOWNTO 0); -- 计数器寄存器
	VARIABLE temp : STD_LOGIC_VECTOR(7 DOWNTO 0); -- 临时寄存器
	VARIABLE C    : STD_LOGIC; -- 进位标志
	BEGIN
	
		IF START = '1' THEN
		IF RST = '1' OR (MODE = "000" AND C = '0') THEN			--进位的时候rst为1 
		
			CASE MODE IS
			 WHEN "000" => CQI := "00000001"; C := '1'; -- 模式0，初始化为1
			 WHEN "001" => CQI := "00000101"; C := '0'; -- 模式1，初始化为5  黄
			 WHEN "010" => CQI := "00010110"; C := '0'; -- 模式2，初始化为16 绿
			 WHEN "011" => CQI := "00100001"; C := '0'; -- 模式3，初始化为21 红
			 WHEN "100" => CQI := "01010101"; C := '0'; -- 模式4，初始化为55 绿
			 WHEN "101" => CQI := "01100000"; C := '0'; -- 模式5，初始化为60  红
			 WHEN OTHERS => CQI := "00000000"; C := '0'; -- 默认情况，初始化为0
			END CASE;
			
		ELSIF CLK'EVENT AND CLK = '0' THEN
		
			IF EN = '1' THEN   --使能了才开始倒计时
				IF CQI(3 DOWNTO 0) = "0000" THEN
				 CQI(3 DOWNTO 0) := "1001"; -- 当低4位为0时，将其设置为1001
				 CQI(7 DOWNTO 4) := CQI(7 DOWNTO 4) - 1; -- 高4位递减
				ELSE
				 CQI(3 DOWNTO 0) := CQI(3 DOWNTO 0) - 1; -- 低4位递减
				END IF;
			END IF;
			
		temp := CQI;
			
		END IF;
		
		IF CQI = "00000000" AND (temp = "00000001" OR temp = "00000000") THEN
		 COUT <= '1'; -- 如果计数器值为0且之前的值为1或0，设置溢出标志
		ELSE
			IF CLK'EVENT AND CLK = '1' THEN COUT <= '0'; END IF; -- 在时钟上升沿复位溢出标志
		END IF;
		
		CQ <= CQI; -- 输出当前计数器值
		
		END IF;
		
	END PROCESS;
END BEHAV;