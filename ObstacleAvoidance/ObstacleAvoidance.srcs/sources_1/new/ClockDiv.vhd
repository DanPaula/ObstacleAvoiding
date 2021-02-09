----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2020 08:54:00 PM
-- Design Name: 
-- Module Name: ClockDiv - Behavioral
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
use IEEE.numeric_std.ALL;
  
entity Clock_Divider is
port ( clk,reset: in std_logic;
       clock_out: out std_logic
      );
end Clock_Divider;
  
architecture bhv of Clock_Divider is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk,reset)
    begin
        if(reset='1') then
            count<=1;
            tmp<='0';
        elsif(clk'event and clk='1') then
            count <=count+1;
            if (count = 1000) then
                tmp <= NOT tmp;
                count <= 1;
            end if;
        end if;
    clock_out <= tmp;
end process;
  
end bhv;
