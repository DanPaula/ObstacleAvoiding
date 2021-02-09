----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 04:15:19 PM
-- Design Name: 
-- Module Name: FSM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
Port (  sw: in std_logic;
        Clk: in std_logic;
        obstacle6: in std_logic;
        direction: in std_logic_vector(1 downto 0);
        led: out std_logic_vector(7 downto 0);
        count: out std_logic_vector(15 downto 0);
        stare: out std_logic_vector(3 downto 0);
        motorData: out std_logic_vector(3 downto 0));
end FSM;


architecture Behavioral of FSM is


type state is(stop, start, selectDirection, forword, right, left, back,decelerate, continueAction);
signal currentState, nextState: state := stop;
signal AdressRom: std_logic_vector(3 downto 0);

constant wait_select : TIME := 200 ns; 
signal waitVerif: std_logic:='0';
signal waitChange: std_logic:='0';
signal counter: integer:=0;
begin

stateRom: entity WORK.Rom port map(
                                    Adress=>AdressRom,
                                    Data=>motorData
                                   );


process(currentState)
begin
--aici dam semnale la motoare daca sa se intoarca, sa mearga inainte, sa schimbe directia sau sa se opreasca
    case currentState is
        when stop => AdressRom<="0100";
                     led<="00000001";
                     stare<="0001";
        when start=> AdressRom<="0100";
                     led<="00000010"; 
                     stare<="0010";
        when selectDirection=>AdressRom<="0100";
                              led<="00000100";
                              stare<="0011";
        when forword => AdressRom<="0101"; --accelerate
                        led<="00001000";
                        stare<="0100";
        when right => AdressRom<="0010";
                      led<="00010000";
                      stare<="0101";
        when left => AdressRom<="0001";
                     led<="00100000";
                     stare<="0110";
        when back => AdressRom<="0011";
                     led<="01000000";
                     stare<="0111";
        when decelerate => AdressRom<="0110"; --decelerate
                           stare<="1000";
        when continueAction => AdressRom<="0000";
                               led<="10000000";
                               stare<="1001";
    end case;
end process;

process(clk)
begin
    case currentState is
        when stop => if sw='0' then
                        nextState<=stop;
                     else 
                        nextState<=start; 
                     end if;
        when start => if sw='0' then
                            nextState<=stop;
                        else 
                            nextState<=selectDirection;
                      end if;
        when selectDirection =>     if sw='0' then
                                        nextState<=stop;
                                    else
                                        if direction="00" then
                                            nextState<=forword;
                                        elsif direction="01" then
                                            nextState<=right;
                                        elsif direction="10" then
                                            nextState<=left;
                                        elsif direction="11" then
                                            nextState<=back; 
                                        end if;
                                    end if;
        when forword => if sw='0' then
                            nextState<=stop;
                        else 
                            nextState<=continueAction;
                        end if;
       
        when right =>  if sw='0' then
                            nextState<=stop;
                        else 
                            nextState<=selectDirection;
                      end if;
                       
        when left =>     if sw='0' then
                            nextState<=stop;
                        else 
                            nextState<=selectDirection;
                      end if;
                        
        when back =>     if sw='0' then
                            nextState<=stop;
                        else 
                            nextState<=selectDirection;
                      end if;
                        
        when continueAction => if sw = '0' then
                                    nextState<=stop;
                               elsif obstacle6 = '1' then
                                    nextState<=decelerate;
                               else 
                                    nextState<=continueAction;
                               end if;
        when decelerate =>     nextState<=selectDirection;
       end case;
end process;  

process(Clk)
      begin
        if Clk'event and Clk='1' then
            if sw='0' then
                currentState<=stop;
             else
                currentState<=nextState;
             end if;
         end if;
       end process;

end Behavioral;
