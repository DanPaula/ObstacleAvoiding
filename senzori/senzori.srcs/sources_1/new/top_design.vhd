----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2020 04:48:16 PM
-- Design Name: 
-- Module Name: top_design - Behavioral
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
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_design is
Port (
       trigger1: in std_logic;--trigger
       echo1: out std_logic;--echo
       trigger2: in std_logic;--trigger
       echo2: out std_logic;--echo
       trigger3: in std_logic;--trigger
       echo3: out std_logic;--echo
       clk: in std_logic;
       an : out STD_LOGIC_VECTOR (3 downto 0);
       cat : out STD_LOGIC_VECTOR (6 downto 0)
        );
end top_design;

architecture Behavioral of top_design is

signal signal_meters: std_logic_vector(3 downto 0);
signal signal_decimeters: std_logic_vector(3 downto 0);
signal signal_centimeters: std_logic_vector(3 downto 0);

signal signal_meters2: std_logic_vector(3 downto 0);
signal signal_decimeters2: std_logic_vector(3 downto 0);
signal signal_centimeters2: std_logic_vector(3 downto 0);

signal signal_meters3: std_logic_vector(3 downto 0);
signal signal_decimeters3: std_logic_vector(3 downto 0);
signal signal_centimeters3: std_logic_vector(3 downto 0);
signal number: std_logic_vector(15 downto 0):=(others=>'0');

begin
        
rangFata: entity WORK.range_sensors port map(  
                                          fpgaclk=>clk,
                                          pulse=>trigger1,
                                          triggerOut=>echo1,
                                          meters=>signal_meters,
                                          decimeters=>signal_decimeters,
                                          centimeters=>signal_centimeters
                                       );
                                       
rangStanga: entity WORK.range_sensors port map(  
                                          fpgaclk=>clk,
                                          pulse=>trigger2,
                                          triggerOut=>echo2,
                                          meters=>signal_meters2,
                                          decimeters=>signal_decimeters2,
                                          centimeters=>signal_centimeters2
                                       ); 
                                       
rangDreapta: entity WORK.range_sensors port map(  
                                          fpgaclk=>clk,
                                          pulse=>trigger3,
                                          triggerOut=>echo3,
                                          meters=>signal_meters3,
                                          decimeters=>signal_decimeters3,
                                          centimeters=>signal_centimeters3
                                       );  
 
Disp: entity WORK.Display_ctr port map(
                                        clk=>clk,
                                        an=>an,
                                        cat=>cat,
                                        nr=>number
                                       );                                            

end Behavioral;
