----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 02:31:56 PM
-- Design Name: 
-- Module Name: counter_sim - Behavioral
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

entity counter_sim is
--  Port ( );
end counter_sim;

architecture Behavioral of counter_sim is

constant CLK_PERIOD : TIME := 10 ns; 
signal rst: std_logic:='0';
signal enable: std_logic:='0';
signal clk: std_logic:='0';
signal counter_out: std_logic_vector(7 downto 0):="00000000";

begin

sim: entity WORK.Counter port map(
                rst=>rst,
                enable=>enable,
                clk=>clk,
                counter_out=>counter_out
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
        enable<='0';
        rst<='1';
        wait for 20 ns;
        rst<='0';
        enable<='1';
        wait for 100 ns;
        enable<='0';
        wait for 20 ns;
        rst<='1';
    end process;         

end Behavioral;
