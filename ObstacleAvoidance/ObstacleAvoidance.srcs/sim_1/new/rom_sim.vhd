----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 04:03:56 PM
-- Design Name: 
-- Module Name: rom_sim - Behavioral
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

entity rom_sim is
--  Port ( );
end rom_sim;

architecture Behavioral of rom_sim is

signal Adress: std_logic_vector(1 downto 0):="00";
signal Data: std_logic_vector(3 downto 0):="0000";
constant CLK_PERIOD : TIME := 10 ns; 

begin

sim: entity WORK.Rom port map(
            Adress=>Adress,
            Data=>Data);
            
process
    begin
    Adress<="00";
    wait for (CLK_PERIOD);
    Adress<="01";
    wait for (CLK_PERIOD);
    Adress<="10";
    wait for (CLK_PERIOD);
    Adress<="11";
    wait for (CLK_PERIOD);
    end process;

end Behavioral;
