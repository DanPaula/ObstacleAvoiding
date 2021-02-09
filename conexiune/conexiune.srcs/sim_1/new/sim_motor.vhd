----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2020 11:06:05 AM
-- Design Name: 
-- Module Name: sim_motor - Behavioral
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

entity sim_motor is
--  Port ( );
end sim_motor;

architecture Behavioral of sim_motor is

signal direction: std_logic_vector(1 downto 0):="00";
signal out0: std_logic:='0';
signal out1: std_logic:='0';

begin

motor: entity WORK.BasysToArduino port map
            (
                direction=>direction,
                out0=>out0,
                out1=>out1
              );

process
    begin
    direction<="00";
    wait for 1000000000 ns;
    direction<="01";
    wait for 1000000000 ns;
    direction<="10";
    wait for 1000000000 ns;
    direction<="11";
    wait for 1000000000 ns;
end process;


end Behavioral;
