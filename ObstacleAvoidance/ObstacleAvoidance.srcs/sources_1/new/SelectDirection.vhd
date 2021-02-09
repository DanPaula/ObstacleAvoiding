----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 06:54:17 PM
-- Design Name: 
-- Module Name: SelectDirection - Behavioral
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

entity SelectDirection is
Port (
        distForward: in integer;
        distRight: in integer;
        distLeft: in integer;
        obstacle6: out std_logic;
        direction: out std_logic_vector(1 downto 0) );
end SelectDirection;

architecture Behavioral of SelectDirection is

begin

    obstacle6 <='1' when distForward < 40 else '0';
    
    process
        begin
            if distForward<20 and distLeft<20 and distRight<20 then
                direction<="11"; --back
            else
                if distForward<20 then
                    if distLeft>distRight then
                        direction<="10"; --left
                     else 
                        direction<="01"; --right
                     end if;
                else 
                    direction<="00"; --forward
                end if;
            end if; 
      end process;    
    

end Behavioral;
