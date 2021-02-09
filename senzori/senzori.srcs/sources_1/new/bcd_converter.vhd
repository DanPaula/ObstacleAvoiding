----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2020 04:22:45 PM
-- Design Name: 
-- Module Name: bcd_converter - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_converter is
Port ( 
        distance_input: in std_logic_vector(8 downto 0);
        hundreds: out std_logic_vector(3 downto 0);
        tens: out std_logic_vector(3 downto 0);
        unit: out std_logic_vector(3 downto 0)
      );
end bcd_converter;

architecture Behavioral of bcd_converter is

begin

    process(distance_input)
        variable i: integer:=0;
        variable bcd: std_logic_vector(20 downto 0);
        
        begin
            bcd:=(others=>'0');
            bcd(8 downto 0):=distance_input;
            
            for i in 0 to 8 loop
                bcd(19 downto 0):=bcd(18 downto 0) & '0';
                if(i<8 and bcd(12 downto 9)>"0100") then
                    bcd(12 downto 9):=bcd(12 downto 9)+"0011";
                end if;
                
                if(i<8 and bcd(16 downto 13)>"0100") then
                    bcd(12 downto 9):=bcd(12 downto 9)+"0011";
                end if;
                
                if(i<8 and bcd(20 downto 17)>"0100") then
                    bcd(12 downto 9):=bcd(12 downto 9)+"0011";
                end if;
                
             end loop;
             
         hundreds<=bcd(20 downto 17);
         tens<=bcd(16 downto 13);
         unit<=bcd(12 downto 9);
      end process;
         
               
end Behavioral;
