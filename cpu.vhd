----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:51 08/09/2012 
-- Design Name: 
-- Module Name:    cpu - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpu is
  Generic(AddrWidth: integer := 32;
          DataWidth: integer := 32;
          StackSize: integer := 16;
          StackWidth: integer := 4;
          CodeSize: integer := 512;
          CodeMemoryWidth: integer := 9;
          DataSize: integer := 128;
          DataMemoryWidth: integer := 7);
    Port ( clk : in  STD_LOGIC;
           addr : out  STD_LOGIC_VECTOR (AddrWidth-1 downto 0);
           dout : out  STD_LOGIC_VECTOR (DataWidth-1 downto 0);
           iowr : out  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (DataWidth-1 downto 0);
           reset : in  STD_LOGIC);
end cpu;

architecture Behavioral of cpu is

constant CodeWidth: integer := 9;

constant cmdNOP: integer := 0;

constant cmdPLUS: integer := 1;
constant cmdDROP: integer := 2;

constant cmdJMP:  integer := 128;
constant cmdCALL: integer := 129;
constant cmdIF:   integer := 130;
constant cmdRET:  integer := 131;


subtype DataSignal is std_logic_vector(DataWidth-1 downto 0);
subtype AddrSignal is std_logic_vector(AddrWidth-1 downto 0);
subtype CodeSignal is std_logic_vector(CodeWidth-1 downto 0);
subtype StackAddrSignal is std_logic_vector(StackWidth-1 downto 0);
subtype CodeAddrSignal is std_logic_vector(CodeMemoryWidth-1 downto 0);
subtype DataAddrSignal is std_logic_vector(DataMemoryWidth-1 downto 0);

type TDataStack is array(0 to StackSize-1) of DataSignal;
signal DataStack: TDataStack;
signal DSAddrA, DSAddrB: StackAddrSignal;
signal DSDoutA, DSDoutB: DataSignal;
signal DSDinA: DataSignal;
signal DSWeA: std_logic;

type TRetStack is array(0 to StackSize-1) of AddrSignal;
signal RetStack: TRetStack;
signal RSAddrA, RSAddrB: StackAddrSignal;
signal RSDoutA, RSDoutB: AddrSignal;
signal RSDinA: AddrSignal;
signal RSWeA: std_logic;

type TCodeMemory is array(0 to CodeSize-1) of CodeSignal;
signal CodeMemory: TCodeMemory := (
  0  => "000000000", -- lit tests
  1  => "100000000",
  2  => "100000001",
  3  => "100000010",
  4  => "000000000",
  5  => "100001111",
  6  => "000000000",
  7  => "100010000",
  8  => "100001000",
  9  => "000000001",
  10 => "000000001",
  11 => "000000010",
  12 => "100010011",
  13 => "010000000", -- jmp to 19
  14 => "100000010",
  15 => "000000000",
  16 => "100000010",
  17 => "000000001",
  18 => "010000011", -- ret
  19 => "100001110",
  20 => "010000001", -- call to 14
  21 => "111111111",
  others => (others => '0')
);
signal CodeAddrA, CodeAddrB: AddrSignal;
signal CodeDoutA, CodeDoutB: CodeSignal;
signal CodeDinA: CodeSignal;
signal CodeWeA: std_logic;

type TDataMemory is array(0 to DataSize-1) of DataSignal;
signal DataMemory: TDataMemory;
signal DataAddrA, DataAddrB: DataAddrSignal;
signal DataDoutA, DataDoutB: DataSignal;
signal DataDinA: DataSignal;
signal DataWeA: std_logic;

signal IP: AddrSignal;
signal Cmd: CodeSignal;
signal fetching: std_logic;

signal PrevCmdIsLIT: std_logic;

signal CmdIsLit: std_logic;

begin

process(clk)
begin
  if rising_edge(clk) then
    if DSWeA = '1' then
      DataStack(conv_integer(DSAddrA)) <= DSDinA;
      DSDoutA <= DSDinA;
    else
      DSDoutA <= DataStack(conv_integer(DSAddrA));
    end if;       
    DSDoutB <= DataStack(conv_integer(DSAddrB));
  end if;
end process;

process(clk)
begin
  if rising_edge(clk) then
    if RSWeA = '1' then
      RetStack(conv_integer(RSAddrA)) <= RSDinA;
      RSDoutA <= RSDinA;
    else
      RSDoutA <= RetStack(conv_integer(RSAddrA));
    end if;    
    RSDoutB <= RetStack(conv_integer(RSAddrB));
  end if;
end process;

process(clk)
begin
  if rising_edge(clk) then
    if CodeWeA = '1' then
      CodeMemory(conv_integer(CodeAddrA)) <= CodeDinA;
    end if;
    CodeDoutA <= CodeMemory(conv_integer(CodeAddrA));
    CodeDoutB <= CodeMemory(conv_integer(CodeAddrB));
  end if;
end process;

process(clk)
begin
  if rising_edge(clk) then
    if DataWeA = '1' then
      DataMemory(conv_integer(DataAddrA)) <= DataDinA;      
    end if;
    DataDoutA <= DataMemory(conv_integer(DataAddrA));
    DataDoutB <= DataMemory(conv_integer(DataAddrB));
  end if;
end process;

-- end of stack and memory declaration

CodeAddrB <= ip;
cmd <= CodeDoutB;

CmdIsLit <= '1' when Cmd(8) = '1' else '0';

DSAddrB <= DSAddrA - 1;

process(clk)
begin
  if rising_edge(clk) then
    -- Синхронный ресет, чтобы не ловить "иголки".
    if reset = '1' then
      DSAddrA <= (others => '0');      
      
      RSAddrA <= (others => '0');
      RSAddrB <= (others => '0');
      RSWeA <= '0';
      
      CodeAddrA <= (others => '0');
      CodeWeA <= '0';
      
      DataAddrA <= (others => '0');
      DataAddrB <= (others => '0');
      DataWeA <= '0';
      
      ip <= (others => '0');
      fetching <= '1';
    else      
      if fetching = '1' then
        fetching <= '0';
        DSWeA <= '0';
        RSWeA <= '0';
      else
        fetching <= '1';
        PrevCmdIsLIT <= Cmd(CodeWidth-1);
        
        case conv_integer(cmd) is
          when 256 to 511 => -- LIT
            if PrevCmdIsLIT = '1' then
              DSDinA <= DSDoutA(DataWidth - 9 downto 0) & Cmd(7 downto 0);
            else
              DSDinA <= sxt(Cmd(7 downto 0), DataWidth);
              DSAddrA <= DSAddrA + 1;
            end if;
            DSWeA <= '1';
            
          when cmdJMP =>
            DSAddrA <= DSAddrA - 1;
            
          when cmdIF =>
            DSAddrA <= DSAddrA - 2;
            
          when cmdCALL =>
            DSAddrA <= DSAddrA - 1;
            RSAddrA <= RSAddrA + 1;
            RSDinA <= ip + 1;
            RSWeA <= '1';
            
          when cmdRET =>
            RSAddrA <= RSAddrA - 1;
            
          when cmdPLUS =>
            DSAddrA <= DSAddrA - 1;
            DSDinA <= DSDoutA + DSDoutB;
            DSWeA <= '1';
            
          when cmdDROP =>
            DSAddrA <= DSAddrA - 1;
            
          when others => null;
        end case;
        
        case conv_integer(cmd) is
          when cmdJMP => -- jmp
            ip <= DSDoutA(ip'range);
            
          when cmdIF => -- if
            if conv_integer(DSDoutB) = 0 then
              ip <= DSDoutA(ip'range);
            else
              ip <= ip + 1;
            end if;
            
          when cmdCALL => -- call
            ip <= DSDoutA(ip'range);
            
          when cmdRET => -- ret
            ip <= RSDoutA(ip'range);
        
          when others => ip <= ip + 1;
        end case;
      end if;
    end if;
  end if;
end process;

addr <= DSDoutA;
dout <= DSDoutB;

end Behavioral;