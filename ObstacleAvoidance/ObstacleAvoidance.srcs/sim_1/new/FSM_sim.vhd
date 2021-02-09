----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 05:19:01 PM
-- Design Name: 
-- Module Name: FSM_sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_sim is
--  Port ( );
end FSM_sim;

architecture Behavioral of FSM_sim is

signal sw: std_logic:='0';
signal Clk: std_logic:='0';
signal obstacle6: std_logic:='0';
signal direction: std_logic_vector(1 downto 0):="00";
signal motorData: std_logic_vector(3 downto 0):="0000";
signal led: std_logic_vector(7 downto 0):="00000000";
constant CLK_PERIOD : TIME := 10 ns; 
constant waitPeriod : TIME := 200 ns;
signal test : std_logic :='1';

begin
    sim: entity WORK.FSM port map(
            sw=>sw,
            Clk=>Clk,
            obstacle6=>obstacle6,
            direction=>direction,
            led=>led,
            motorData=>motorData
            );
   
   
     gen_clk: process
        begin
            clk <= '0';
            wait for (CLK_PERIOD/2);
            clk <= '1';
            wait for (CLK_PERIOD/2);
        end process gen_clk;       
            
     process
        begin
            
            sw<='0';
            wait for 10 ns;
            sw<='1';
            obstacle6<='0';
            direction<="00";
            wait for 50 ns;
 
            
            obstacle6<='1';
            direction<="01";
            wait for 40 ns;
            direction<="00";
            obstacle6<='0';
            wait for 50 ns;
            
            obstacle6<='1';
            direction<="10";
            wait for 40 ns;
            direction<="00";
            obstacle6<='0';
            wait for 50 ns;
            
            obstacle6<='1';
            direction<="11";
            wait for 40 ns;
            direction<="00";
            obstacle6<='0';
            wait for 50 ns;
            
            sw<='0';            
            wait;
        end process;


end Behavioral;
