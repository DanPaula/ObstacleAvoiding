----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 02:03:30 PM
-- Design Name: 
-- Module Name: Counter - Behavioral
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
Port (  rst: in std_logic;
        enable: in std_logic;
        clk: in std_logic;
        counter_out: out std_logic_vector(7 downto 0) );
end Counter;

architecture Behavioral of Counter is
signal count: std_logic_vector(7 downto 0):="00000000";
begin

    
    process(clk,rst,enable)
    begin
        if rst='1' then
            count<="00000000";
        elsif enable='1' and rising_edge(clk) then
            count<=count + 1;
       end if;       
    end  process;
     
counter_out<=count;

end Behavioral;
