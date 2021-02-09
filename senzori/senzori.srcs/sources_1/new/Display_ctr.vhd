---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2020 08:12:18 AM
-- Design Name: 
-- Module Name: SSD - Behavioral
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Display_ctr is
    port(clk: in std_logic;
    an: out std_logic_vector(3 downto 0);
    cat: out std_logic_vector(6 downto 0);
    nr: in std_logic_vector(15 downto 0));
end Display_ctr;

architecture Behavioral of Display_ctr is
signal count : std_logic_vector(15 downto 0);
signal afis : std_logic_vector(3 downto 0);
begin
process(clk)
begin
    if rising_edge(clk) then
        count <= count + 1;
    end if;
end process;        
process(nr)
begin

end process;
process(count(15 downto 14))
begin
    case(count(15 downto 14)) is
    when"00" => afis <= nr(3 downto 0);
    when"01" => afis <= nr(7 downto 4);
    when"10" => afis <= nr(11 downto 8);
    when others => afis <= nr(15 downto 12);
    end case;
end process;

process(count(15 downto 14))
begin
    case(count(15 downto 14)) is
    when"00" => an <= "1110";
    when"01" => an <= "1101";
    when"10" => an <= "1011";
    when"11" => an <= "0111";
    end case;
end process;

process(afis)
begin
    case afis is
   when "0001" => cat<= "1111001" ;  --1
   when "0010"=> cat<="0100100" ;   --2
   when "0011"=> cat<="0110000" ;  --3
   when "0100" => cat<="0011001" ;   --4
    when "0101"=> cat<="0010010" ;   --5
   when "0110"=> cat<="0000010" ;   --6
   when "0111" => cat<="1111000";   --7
   when "1000" =>cat<="0000000" ;  --8
    when "1001" =>cat<= "0010000" ;   --9
   when "1010" => cat<= "0001000" ;   --A
   when "1011"=> cat<= "0000011";   --b
   when "1100"=>cat<= "1000110" ;  --C
   when "1101" =>cat<= "0100001" ; --d
   when "1110"=> cat<="0000110" ;   --E
   when "1111"=> cat<= "0001110" ;   --F
   when others=> cat<= "1000000";  --0
end case;
end process;

end Behavioral;