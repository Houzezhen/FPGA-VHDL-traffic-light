LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Light_Events IS
	PORT(DIN          : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		  EN1, EN0     : IN STD_LOGIC;
		  RST          : IN STD_LOGIC;--使能信号
		  CTRL1, CTRL0 : OUT STD_LOGIC;
		  MODE1, MODE0 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);--主干道和支干道的3个灯倒计时模式
		  Q1, Q0       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)--主干道和支干道的3个灯
		 );--主干道和支干道的3个灯
END Light_Events;

ARCHITECTURE BEHAV OF Light_Events IS
BEGIN

	COM1 : PROCESS(EN1, EN0, DIN, RST)
		VARIABLE CQI1 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";     	--主干道中间信号 绿 黄 红
		VARIABLE CQI0 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";		--支干道中间信号
		VARIABLE D_tmp : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
		VARIABLE C_tmp1, C_tmp0 : STD_LOGIC;--计数器使能
	BEGIN
		IF RST = '1' THEN												--复位时中间变量全为1 且计时模式为0（1秒） 
			CQI1 := "111"; MODE1 <= "000"; C_tmp1 := '1';    
			CQI0 := "111"; MODE0 <= "000"; C_tmp0 := '1';
		ELSIF DIN = "11" THEN					--发生车祸   红灯闪烁  间隔1秒
			IF EN1 = '1' OR EN0 = '1' THEN   
				CQI1 := "000";
				CQI0 := "000";
			ELSE
				CQI1 := "111";
				CQI0 := "111";
			END IF;
			MODE1 <= "000"; C_tmp1 := '1';      -- 模式0是1秒  c_temp是计数器使能   EN是计数一轮结束的标志位
			MODE0 <= "000"; C_tmp0 := '1';
		ELSE
			IF EN1'EVENT AND EN1 = '1' THEN   --倒计时结束进行判断
				IF DIN = "00" THEN
					IF    CQI1 = "100" THEN CQI1 := "010"; MODE1 <= "001"; C_tmp1 := '0';-- 所有情况都转黄灯 黄灯模式下面代码秒切绿灯  
					ELSIF CQI1 = "010" THEN CQI1 := "100"; MODE1 <= "000"; C_tmp1 := '1';-- 黄灯秒切绿灯
					ELSIF CQI1 = "001" THEN CQI1 := "010"; MODE1 <= "001"; C_tmp1 := '0';
					ELSIF CQI1 = "000" THEN CQI1 := "010"; MODE1 <= "001"; C_tmp1 := '0';  
					ELSIF CQI1 = "111" THEN CQI1 := "010"; MODE1 <= "001"; C_tmp1 := '0';
					END IF;
				ELSIF DIN = "01" THEN
					IF    CQI1 = "100" THEN CQI1 := "010"; MODE1 <= "001"; C_tmp1 := '1';--
					ELSIF CQI1 = "010" THEN CQI1 := "001"; MODE1 <= "001"; C_tmp1 := '0';
					ELSIF CQI1 = "001" THEN CQI1 := "001"; MODE1 <= "001"; C_tmp1 := '0';
					ELSIF CQI1 = "000" THEN CQI1 := "001"; MODE1 <= "001"; C_tmp1 := '0';
					ELSIF CQI1 = "111" THEN CQI1 := "001"; MODE1 <= "001"; C_tmp1 := '0';
					END IF;
				ELSIF DIN = "10" THEN
					IF    CQI1 = "100" THEN CQI1 := "010"; MODE1 <= "001"; C_tmp1 := '1';--绿灯切黄灯
					ELSIF CQI1 = "010" THEN CQI1 := "001"; MODE1 <= "011"; C_tmp1 := '1';--黄灯切红灯
					ELSIF CQI1 = "001" THEN CQI1 := "100"; MODE1 <= "100"; C_tmp1 := '1';--红灯直接切绿灯没有黄灯过渡，所以比支干道黄灯切红灯多5s
					ELSIF CQI1 = "000" THEN CQI1 := "100"; MODE1 <= "100"; C_tmp1 := '1';--车祸红灯闪烁时  切换10模式到到绿灯
					ELSIF CQI1 = "111" THEN CQI1 := "100"; MODE1 <= "100"; C_tmp1 := '1';--车祸红灯闪烁时  切换10模式到到绿灯
					END IF;
				END IF;
			END IF;
			
			IF EN0'EVENT AND EN0 = '1' THEN
				IF DIN = "00" THEN
					IF    CQI0 = "100" THEN CQI0 := "010"; MODE0 <= "001"; C_tmp0 := '1';--
					ELSIF CQI0 = "010" THEN CQI0 := "001"; MODE0 <= "001"; C_tmp0 := '0';
					ELSIF CQI0 = "001" THEN CQI0 := "001"; MODE0 <= "001"; C_tmp0 := '0';
					ELSIF CQI0 = "000" THEN CQI0 := "001"; MODE0 <= "001"; C_tmp0 := '0';
					ELSIF CQI0 = "111" THEN CQI0 := "001"; MODE0 <= "001"; C_tmp0 := '0';
					END IF;
				ELSIF DIN = "01" THEN
					IF    CQI0 = "100" THEN CQI0 := "010"; MODE0 <= "001"; C_tmp0 := '0';
					ELSIF CQI0 = "010" THEN CQI0 := "100"; MODE0 <= "000"; C_tmp0 := '1';  --绿灯外的所有情况都到黄灯，黄灯切换时才进行计时，其他不计时
					ELSIF CQI0 = "001" THEN CQI0 := "010"; MODE0 <= "001"; C_tmp0 := '0';
					ELSIF CQI0 = "000" THEN CQI0 := "010"; MODE0 <= "001"; C_tmp0 := '0';
					ELSIF CQI0 = "111" THEN CQI0 := "010"; MODE0 <= "001"; C_tmp0 := '0';
					END IF;
				ELSIF DIN = "10" THEN																		--双车道都有车
					IF    CQI0 = "100" THEN CQI0 := "010"; MODE0 <= "001"; C_tmp0 := '1';--绿灯切黄灯
					ELSIF CQI0 = "010" THEN CQI0 := "001"; MODE0 <= "101"; C_tmp0 := '1';--黄灯切红灯
					ELSIF CQI0 = "001" THEN CQI0 := "100"; MODE0 <= "010"; C_tmp0 := '1';--红灯直接切绿灯没有黄灯过渡，所以比主干道黄灯切红灯多5s
					ELSIF CQI0 = "000" THEN CQI0 := "001"; MODE0 <= "101"; C_tmp0 := '1';
					ELSIF CQI0 = "111" THEN CQI0 := "001"; MODE0 <= "101"; C_tmp0 := '1';
					END IF;
				END IF;
			END IF;
			
		END IF;
		
		IF C_tmp1 /= '0' AND C_tmp0 /= '0' THEN--都为一上次数据才更新
			D_tmp := DIN;								--
		END IF;
		
		IF D_tmp /= DIN THEN--上次与当前进行比较  输入模式不一样直接开启计数器倒计时使能
			C_tmp1 := '1';
			C_tmp0 := '1';
		END IF;
		
		CTRL1 <= C_tmp1;				--输入使能信号
		CTRL0 <= C_tmp0;
		
		IF CQI1 = "111" THEN Q1 <= "001";			--111就是前面出现车祸该亮红灯，输出为001
		ELSE
			IF DIN = "00" AND CQI1 = "010" AND C_tmp1 = '0' THEN Q1 <= "100";		--00主干道，计数器关闭，直接常绿
			ELSE Q1 <= CQI1; END IF;
		END IF;
		IF CQI0 = "111" THEN Q0 <= "001";
		ELSE
			IF DIN = "01" AND CQI0 = "010" AND C_tmp0 = '0' THEN Q0 <= "100";			--00支干道，计数器关闭，直接常绿
			ELSE Q0 <= CQI0; END IF;
		END IF;
	END PROCESS COM1;
	
END ARCHITECTURE BEHAV;

