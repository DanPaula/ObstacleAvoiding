----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2020 03:47:36 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is generic(n :positive:=10);
Port (
        clk: in std_logic;
        enable: in std_logic;
        reset: in std_logic;
        counter_out: out std_logic_vector(n-1 downto 0) );
end counter;

architecture Behavioral of counter is
signal count: std_logic_vector(n-1 downto 0);

begin

    process(clk,reset)
        begin
            if reset='0' then
                count<=(others=>'0');
            elsif clk'event and clk='1' then
                if enable='1' then
                    count<=count+1;
                end if;
            end if;
        end process;
 
    counter_out<=count;
        


end Behavioral;
