----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2020 04:31:59 PM
-- Design Name: 
-- Module Name: range_sensors - Behavioral
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

entity range_sensors is
Port ( 
        fpgaclk: in std_logic;
        pulse: in std_logic;
        triggerOut: out std_logic;
        meters: out std_logic_vector(3 downto 0);
        decimeters: out std_logic_vector(3 downto 0);
        centimeters: out std_logic_vector(3 downto 0)   
     );
end range_sensors;

architecture Behavioral of range_sensors is

component distance_calculation is
Port (
        clk: in std_logic;
        calculation_reset: in std_logic;
        pulse: in std_logic;
        distance: out std_logic_vector(8 downto 0)
         );
end component distance_calculation;

component trigger_generator is
Port (
        clk: in std_logic;
        trigger: out std_logic
      );
end component trigger_generator;

component bcd_converter is
Port ( 
        distance_input: in std_logic_vector(8 downto 0);
        hundreds: out std_logic_vector(3 downto 0);
        tens: out std_logic_vector(3 downto 0);
        unit: out std_logic_vector(3 downto 0)
      );
end component bcd_converter;

signal distanceOut: std_logic_vector(8 downto 0);
signal triggOut: std_logic;

begin

trigger_gen: trigger_generator port map(fpgaclk,triggOut);
pulse_Width: distance_calculation port map(fpgaclk, triggOut, pulse,distanceOut);
BCDConv: bcd_converter port map(distanceOut, meters, decimeters, centimeters);

triggerOut<=triggOut;

end Behavioral;
