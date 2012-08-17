----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:49 08/17/2012 
-- Design Name: 
-- Module Name:    uart - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart is
 Generic ( ClkFreq: integer := 50_000_000;
           Baudrate: integer := 115_200);
    Port ( clk : in  STD_LOGIC;
           rxd : in  STD_LOGIC;
           txd : out  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (7 downto 0);           
           received : out std_logic;
           receivedCount: out std_logic_vector(7 downto 0);
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           transmit : in  STD_LOGIC;
           transmitCount : out std_logic_vector(7 downto 0));
end uart;

architecture Behavioral of uart is

constant BitTime: integer := ClkFreq / Baudrate;

signal din_buf, dout_buf: std_logic_vector(7 downto 0);
signal rxstate, txstate : integer range 0 to BitTime * 12 := 0;

begin

process(clk)
begin
  if clk'event and clk = '1' then
    if rxstate = 19 * BitTime / 2 then
      dout <= dout_buf;
      received <= '1';      
    else
      received <= '0';
    end if;
  
    case rxstate is
      when 0 to BitTime / 2 => if rxd = '0' then rxstate <= rxstate + 1; end if;
      when  3 * BitTime / 2 => dout_buf(0) <= rxd; rxstate <= rxstate + 1;
      when  5 * BitTime / 2 => dout_buf(1) <= rxd; rxstate <= rxstate + 1;
      when  7 * BitTime / 2 => dout_buf(2) <= rxd; rxstate <= rxstate + 1;
      when  9 * BitTime / 2 => dout_buf(3) <= rxd; rxstate <= rxstate + 1;
      when 11 * BitTime / 2 => dout_buf(4) <= rxd; rxstate <= rxstate + 1;
      when 13 * BitTime / 2 => dout_buf(5) <= rxd; rxstate <= rxstate + 1;
      when 15 * BitTime / 2 => dout_buf(6) <= rxd; rxstate <= rxstate + 1;
      when 17 * BitTime / 2 => dout_buf(7) <= rxd; rxstate <= rxstate + 1;
      when 19 * BitTime / 2 => rxstate <= 0;
      when others => rxstate <= rxstate + 1;
    end case;
  end if;
end process;

process(clk)
begin
  if clk'event and clk = '1' then
    case txstate is
      when 0 =>
        if transmit = '1' then 
          txstate <= 1; 
          din_buf <= Din;
          txd <= '0';
        else
          txd <= '1';
        end if;      
      when 1 * BitTime => txd <= din_buf(0); txstate <= txstate + 1;
      when 2 * BitTime => txd <= din_buf(1); txstate <= txstate + 1;
      when 3 * BitTime => txd <= din_buf(2); txstate <= txstate + 1;
      when 4 * BitTime => txd <= din_buf(3); txstate <= txstate + 1;
      when 5 * BitTime => txd <= din_buf(4); txstate <= txstate + 1;
      when 6 * BitTime => txd <= din_buf(5); txstate <= txstate + 1;
      when 7 * BitTime => txd <= din_buf(6); txstate <= txstate + 1;
      when 8 * BitTime => txd <= din_buf(7); txstate <= txstate + 1;
      when 9 * BitTime => txd <= '1'; txstate <= txstate + 1;
      when 11 * BitTime => txstate <= 0;
      when others => txstate <= txstate + 1;
    end case;
  end if;
end process;

end Behavioral;