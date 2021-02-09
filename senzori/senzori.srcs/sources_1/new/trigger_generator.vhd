----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2020 04:09:42 PM
-- Design Name: 
-- Module Name: trigger_generator - Behavioral
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

entity trigger_generator is
Port (
        clk: in std_logic;
        trigger: out std_logic
      );
end trigger_generator;

architecture Behavioral of trigger_generator is

component counter is
    generic(n: positive:=10);
    Port (
        clk: in std_logic;
        enable: in std_logic;
        reset: in std_logic;
        counter_out: out std_logic_vector(n-1 downto 0)
         );
end component;

signal resetCounter: std_logic;
signal outputCounter: std_logic_vector(23 downto 0);

begin


    trigg: counter generic map(24) port map(clk,'1',resetCounter,outputCounter);
    process(clk)
        constant ms250: std_logic_vector(23 downto 0):="101111101011110000100000";
        constant ms250And100us: std_logic_vector(23 downto 0):="101111101100111110101000";
           
        begin
            if outputCounter>ms250 and outputCounter<ms250And100us then
                trigger<='1';
            else
                trigger<='0';
            end if;
            if outputCounter=ms250And100us or outputCounter="XXXXXXXXXXXXXXXXXXXXXXXX" then
                resetCounter<='0';
            else
                resetCounter<='1';
             end if;
    end process;


end Behavioral;
