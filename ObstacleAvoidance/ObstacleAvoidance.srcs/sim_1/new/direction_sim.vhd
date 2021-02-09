----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 07:01:06 PM
-- Design Name: 
-- Module Name: direction_sim - Behavioral
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

entity direction_sim is
--  Port ( );
end direction_sim;

architecture Behavioral of direction_sim is

signal distForward: integer:=0;
signal distRight: integer:=0;
signal distLeft: integer:=0;
signal direction: std_logic_vector(1 downto 0):="00";


begin

sim: entity WORK.SelectDirection port map(
            distForward=> distForward,
            distRight=>distRight,
            distLeft=>distLeft,
            direction=>direction
            );
            
    process
        begin
            distForward<=5;
            distRight<=5;
            distLeft<=6;
            wait for 10 ns;
            
            distForward<=5;
            distRight<=5;
            distLeft<=21;
            wait for 10 ns;
            
            distForward<=5;
            distRight<=23;
            distLeft<=6;
            wait for 10 ns;
            
            distForward<=25;
            distRight<=5;
            distLeft<=6;
            wait for 10 ns;
            
            distForward<=5;
            distRight<=15;
            distLeft<=16;
            wait for 10 ns;
       end process;

end Behavioral;
