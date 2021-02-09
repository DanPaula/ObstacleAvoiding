----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2020 10:56:38 AM
-- Design Name: 
-- Module Name: BasysToArduino - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BasysToArduino is
Port ( 
        direction: in std_logic_vector(3 downto 0);
        sw: in std_logic;
        out0: out std_logic;
        out1: out std_logic;
        out2: out std_logic;
        out3: out std_logic;
        go: out std_logic
     );
end BasysToArduino;

architecture Behavioral of BasysToArduino is

begin

go<=sw;
out0<=direction(3);
out1<=direction(2);
out2<=direction(1);
out3<=direction(0);

end Behavioral;
