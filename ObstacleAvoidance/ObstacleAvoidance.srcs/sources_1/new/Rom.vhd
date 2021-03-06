----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 02:47:36 PM
-- Design Name: 
-- Module Name: Rom - Behavioral
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

entity Rom is
port(
      Adress: in std_logic_vector(3 downto 0);
      Data: out std_logic_vector(3 downto 0)
     );

end Rom;

architecture Behavioral of Rom is


type ROM is array (0 to 6) of std_logic_vector(3 downto 0);
signal Rom_array: ROM:=(
"1000", --forward
"0100", --left
"0010", --right
"0001", --back
"0000", --stop
"0011", --accelerate
"0000", --decelerate
others=>"0000"
);

begin

Data<=Rom_array(conv_integer(Adress));
            
end Behavioral;


