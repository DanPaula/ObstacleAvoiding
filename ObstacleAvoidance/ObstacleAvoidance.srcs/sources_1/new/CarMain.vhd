----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 04:16:24 PM
-- Design Name: 
-- Module Name: CarMain - Behavioral
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CarMain is
Port ( 
       sw: in std_logic; --pornire
       sw1: in std_logic; --senzor stanga
       sw2: in std_logic; --senzor mijloc
       sw3: in std_logic; --senzor dreapta
       sw4: in std_logic; --counter
       sw5: in std_logic; --direction
       trigger1: in std_logic;--trigger
       echo1: out std_logic;--echo
       trigger2: in std_logic;--trigger
       echo2: out std_logic;--echo
       trigger3: in std_logic;--trigger
       echo3: out std_logic;--echo
       clk: in std_logic;
       out0: out std_logic; --N2
       out1: out std_logic; --M2
       out2: out std_logic; --L3
       out3: out std_logic; --J3
       go: out std_logic; --K3
       an: out std_logic_vector(3 downto 0);
       cat: out std_logic_vector(6 downto 0);
       led: out std_logic_vector(15 downto 0)
      );
end CarMain;

Architecture Behavioral of CarMain is

signal signal_meters: std_logic_vector(3 downto 0);
signal signal_decimeters: std_logic_vector(3 downto 0);
signal signal_centimeters: std_logic_vector(3 downto 0);

signal signal_meters2: std_logic_vector(3 downto 0);
signal signal_decimeters2: std_logic_vector(3 downto 0);
signal signal_centimeters2: std_logic_vector(3 downto 0);

signal signal_meters3: std_logic_vector(3 downto 0);
signal signal_decimeters3: std_logic_vector(3 downto 0);
signal signal_centimeters3: std_logic_vector(3 downto 0);
signal numberForward: std_logic_vector(15 downto 0):=(others=>'0');
signal numberLeft: std_logic_vector(15 downto 0):=(others=>'0');
signal numberRight: std_logic_vector(15 downto 0):=(others=>'0');

signal distForward: integer;
signal distRight: integer;
signal distLeft: integer;
signal direction: std_logic_vector(1 downto 0);
signal obstacle6: std_logic;

signal motorData: std_logic_vector(3 downto 0);
signal stare: std_logic_vector(3 downto 0);

signal afisare: std_logic_vector(15 downto 0);
signal counter: std_logic_vector(15 downto 0);
signal clkDiv: std_logic;
signal none: std_logic;


begin

div: entity WORK.Clock_Divider port map(
                                    clk=>clk,
                                    reset=>'0',
                                    clock_out=>clkDiv
                                 );
                                 
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

selectDir: entity WORK.SelectDirection port map(
                                           distForward=>distForward,
                                           distRight=>distRight,
                                           distLeft=>distLeft,
                                           obstacle6=>obstacle6,
                                           direction=>direction
                                         );

FSM: entity WORK.FSM port map(
                                sw=>sw,
                                Clk=>clkDiv,
                                obstacle6=>obstacle6,
                                direction=>direction,
                                led=>led(11 downto 4),
                                count=>counter,
                                stare=>stare,
                                motorData=>motorData
                              );
                                

connection: entity WORK.BasysToArduino port map(
                                                   direction=>motorData,
                                                   sw=>sw,
                                                   out0=>out0,
                                                   out1=>out1,
                                                   out2=>out2,
                                                   out3=>out3,
                                                   go=>go
                                                );

connectionTest: entity WORK.BasysToArduino port map(
                                                   direction=>motorData,
                                                   sw=>sw,
                                                   out0=>led(0),
                                                   out1=>led(1),
                                                   out2=>led(2),
                                                   out3=>led(3),
                                                   go=>none
                                                );

Disp: entity WORK.Display_ctr port map(
                                        clk=>clk,
                                        an=>an,
                                        cat=>cat,
                                        nr=>afisare
                                       );


led(15)<=obstacle6;

numberForward(3 downto 0)<=signal_centimeters;
numberForward(7 downto 4)<=signal_decimeters;
numberForward(11 downto 8)<=signal_meters;
numberForward(15 downto 12)<="0000";

numberRight(3 downto 0)<=signal_centimeters3;
numberRight(7 downto 4)<=signal_decimeters3;
numberRight(11 downto 8)<=signal_meters3;
numberRight(15 downto 12)<="0000";

numberLeft(3 downto 0)<=signal_centimeters2;
numberLeft(7 downto 4)<=signal_decimeters2;
numberLeft(11 downto 8)<=signal_meters2;
numberLeft(15 downto 12)<="0000";

distForward<=to_integer(unsigned(numberForward));
distLeft<=to_integer(unsigned(numberLeft));
distRight<=to_integer(unsigned(numberRight));

go<=sw;

process
    begin
        if sw1='1' then
            afisare<=numberRight;
        elsif sw2='1' then
            afisare<=numberLeft;
        elsif sw3='1' then
            afisare<=numberForward;
        elsif sw4='1' then
            afisare<=counter;
        elsif sw5='1' then
            afisare<="000000000000"&stare;        
        else
            afisare<=(others=>'0');
        end if;
end process;
end Behavioral;
