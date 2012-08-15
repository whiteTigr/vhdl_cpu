----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:41:39 08/09/2012 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
    Port ( clk : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC;
           CpuReset: in std_logic);
end top;

architecture Behavioral of top is

subtype DataSignal is std_logic_vector(31 downto 0);
subtype AddrSignal is std_logic_vector(31 downto 0);

signal BusAddr: AddrSignal;
signal BusDout: DataSignal;
signal BusDin: DataSignal;
signal BusIowr: std_logic;

begin

unit_cpu: entity cpu
  port map( 
    clk => clk,
    addr => BusAddr,
    dout => BusDout,
    iowr => BusIowr,
    din => BusDin,
    reset => CpuReset);

process(clk)
begin
  if rising_edge(clk) then
    if conv_integer(BusAddr) = 1000 and BusIowr = '1' then
      q <= BusDout(0);
    end if;
  end if;
end process;

end Behavioral;

