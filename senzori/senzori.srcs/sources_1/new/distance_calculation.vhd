----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2020 03:55:42 PM
-- Design Name: 
-- Module Name: distance_calculation - Behavioral
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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity distance_calculation is
Port (
        clk: in std_logic;
        calculation_reset: in std_logic;
        pulse: in std_logic;
        distance: out std_logic_vector(8 downto 0)
         );
end distance_calculation;

architecture Behavioral of distance_calculation is
component counter is
    generic(n: positive:=10);
    Port (
        clk: in std_logic;
        enable: in std_logic;
        reset: in std_logic;
        counter_out: out std_logic_vector(n-1 downto 0)
         );
end component;

signal pulse_width: std_logic_vector(21 downto 0);
signal aux: std_logic;

begin
aux<=not(calculation_reset);
counterPulse: counter generic map(22) port map(clk, pulse, aux, pulse_width);

process(pulse)
    variable result: integer;
    variable multiplier: std_logic_vector(23 downto 0);
    
    begin
        if pulse='0' then
            multiplier:=pulse_width*"11";
            result:= to_integer(unsigned(multiplier(23 downto 13)));
            if result>458 then
                distance<="111111111";
            else 
                distance<=std_logic_vector(to_unsigned(result,9));
            end if;
        end if;
end process;


end Behavioral;
