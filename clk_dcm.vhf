--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.1
--  \   \         Application : sch2hdl
--  /   /         Filename : clk_dcm.vhf
-- /___/   /\     Timestamp : 08/17/2012 15:25:05
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl D:/XProjects/vhdl_cpu/clk_dcm.vhf -w D:/XProjects/vhdl_cpu/clk_dcm.sch
--Design Name: clk_dcm
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity clk_dcm is
   port ( clk_in : in    std_logic; 
          clk    : out   std_logic; 
          clk2x  : out   std_logic; 
          locked : out   std_logic);
end clk_dcm;

architecture BEHAVIORAL of clk_dcm is
   attribute CLK_FEEDBACK          : string ;
   attribute CLKDV_DIVIDE          : string ;
   attribute CLKFX_DIVIDE          : string ;
   attribute CLKIN_PERIOD          : string ;
   attribute CLKFX_MULTIPLY        : string ;
   attribute CLKIN_DIVIDE_BY_2     : string ;
   attribute CLKOUT_PHASE_SHIFT    : string ;
   attribute DESKEW_ADJUST         : string ;
   attribute DFS_FREQUENCY_MODE    : string ;
   attribute DLL_FREQUENCY_MODE    : string ;
   attribute DSS_MODE              : string ;
   attribute DUTY_CYCLE_CORRECTION : string ;
   attribute PHASE_SHIFT           : string ;
   attribute STARTUP_WAIT          : string ;
   attribute FACTORY_JF            : string ;
   attribute BOX_TYPE              : string ;
   signal XLXN_3                     : std_logic;
   signal XLXN_5                     : std_logic;
   signal clk_DUMMY                  : std_logic;
   signal XLXI_1_DSSEN_openSignal    : std_logic;
   signal XLXI_1_PSCLK_openSignal    : std_logic;
   signal XLXI_1_PSEN_openSignal     : std_logic;
   signal XLXI_1_PSINCDEC_openSignal : std_logic;
   component DCM
      -- synopsys translate_off
      generic( CLK_FEEDBACK : string :=  "1X";
               CLKDV_DIVIDE : real :=  2.0;
               CLKFX_DIVIDE : integer :=  1;
               CLKIN_PERIOD : real :=  10.0;
               CLKFX_MULTIPLY : integer :=  4;
               CLKIN_DIVIDE_BY_2 : boolean :=  FALSE;
               CLKOUT_PHASE_SHIFT : string :=  "NONE";
               DESKEW_ADJUST : string :=  "SYSTEM_SYNCHRONOUS";
               DFS_FREQUENCY_MODE : string :=  "LOW";
               DLL_FREQUENCY_MODE : string :=  "LOW";
               DSS_MODE : string :=  "NONE";
               DUTY_CYCLE_CORRECTION : boolean :=  TRUE;
               PHASE_SHIFT : integer :=  0;
               STARTUP_WAIT : boolean :=  FALSE;
               FACTORY_JF : bit_vector :=  x"C080");
      -- synopsys translate_on
      port ( CLKFB    : in    std_logic; 
             CLKIN    : in    std_logic; 
             DSSEN    : in    std_logic; 
             PSCLK    : in    std_logic; 
             PSEN     : in    std_logic; 
             PSINCDEC : in    std_logic; 
             RST      : in    std_logic; 
             CLK0     : out   std_logic; 
             CLK180   : out   std_logic; 
             CLK270   : out   std_logic; 
             CLK2X    : out   std_logic; 
             CLK2X180 : out   std_logic; 
             CLK90    : out   std_logic; 
             CLKDV    : out   std_logic; 
             CLKFX    : out   std_logic; 
             CLKFX180 : out   std_logic; 
             LOCKED   : out   std_logic; 
             PSDONE   : out   std_logic; 
             STATUS   : out   std_logic_vector (7 downto 0));
   end component;
   attribute CLK_FEEDBACK of DCM : component is "1X";
   attribute CLKDV_DIVIDE of DCM : component is "2.0";
   attribute CLKFX_DIVIDE of DCM : component is "1";
   attribute CLKIN_PERIOD of DCM : component is "10.0";
   attribute CLKFX_MULTIPLY of DCM : component is "4";
   attribute CLKIN_DIVIDE_BY_2 of DCM : component is "FALSE";
   attribute CLKOUT_PHASE_SHIFT of DCM : component is "NONE";
   attribute DESKEW_ADJUST of DCM : component is "SYSTEM_SYNCHRONOUS";
   attribute DFS_FREQUENCY_MODE of DCM : component is "LOW";
   attribute DLL_FREQUENCY_MODE of DCM : component is "LOW";
   attribute DSS_MODE of DCM : component is "NONE";
   attribute DUTY_CYCLE_CORRECTION of DCM : component is "TRUE";
   attribute PHASE_SHIFT of DCM : component is "0";
   attribute STARTUP_WAIT of DCM : component is "FALSE";
   attribute FACTORY_JF of DCM : component is "C080";
   attribute BOX_TYPE of DCM : component is "BLACK_BOX";
   
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   clk <= clk_DUMMY;
   XLXI_1 : DCM
      port map (CLKFB=>XLXN_3,
                CLKIN=>clk_in,
                DSSEN=>XLXI_1_DSSEN_openSignal,
                PSCLK=>XLXI_1_PSCLK_openSignal,
                PSEN=>XLXI_1_PSEN_openSignal,
                PSINCDEC=>XLXI_1_PSINCDEC_openSignal,
                RST=>XLXN_5,
                CLKDV=>open,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>clk_DUMMY,
                CLK2X=>clk2x,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>locked,
                PSDONE=>open,
                STATUS=>open);
   
   XLXI_2 : BUFG
      port map (I=>clk_DUMMY,
                O=>XLXN_3);
   
   XLXI_3 : GND
      port map (G=>XLXN_5);
   
end BEHAVIORAL;


