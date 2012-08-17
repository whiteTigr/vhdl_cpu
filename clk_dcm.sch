<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk_in" />
        <signal name="clk" />
        <signal name="XLXN_3" />
        <signal name="clk2x" />
        <signal name="XLXN_5" />
        <signal name="locked" />
        <signal name="XLXN_7" />
        <port polarity="Input" name="clk_in" />
        <port polarity="Output" name="clk" />
        <port polarity="Output" name="clk2x" />
        <port polarity="Output" name="locked" />
        <blockdef name="dcm">
            <timestamp>2007-4-11T22:46:4</timestamp>
            <line x2="0" y1="-832" y2="-832" x1="64" />
            <rect width="256" x="64" y="-1024" height="960" />
            <line x2="320" y1="-960" y2="-960" x1="384" />
            <line x2="320" y1="-896" y2="-896" x1="384" />
            <line x2="320" y1="-832" y2="-832" x1="384" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-768" y2="-768" x1="384" />
            <line x2="320" y1="-640" y2="-640" x1="384" />
            <line x2="320" y1="-704" y2="-704" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <rect width="64" x="320" y="-336" height="32" />
            <line x2="80" y1="-944" y2="-960" x1="64" />
            <line x2="64" y1="-960" y2="-976" x1="80" />
            <line x2="64" y1="-288" y2="-288" x1="320" />
            <line x2="80" y1="-880" y2="-896" x1="64" />
            <line x2="64" y1="-896" y2="-912" x1="80" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="dcm" name="XLXI_1">
            <blockpin signalname="XLXN_3" name="CLKFB" />
            <blockpin signalname="clk_in" name="CLKIN" />
            <blockpin name="DSSEN" />
            <blockpin name="PSCLK" />
            <blockpin name="PSEN" />
            <blockpin name="PSINCDEC" />
            <blockpin signalname="XLXN_5" name="RST" />
            <blockpin signalname="clk" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin signalname="clk2x" name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin name="CLKDV" />
            <blockpin name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin signalname="locked" name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_2">
            <blockpin signalname="clk" name="I" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_3">
            <blockpin signalname="XLXN_5" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="clk_in">
            <wire x2="496" y1="560" y2="560" x1="480" />
            <wire x2="496" y1="560" y2="576" x1="496" />
            <wire x2="608" y1="576" y2="576" x1="496" />
        </branch>
        <branch name="clk">
            <wire x2="1040" y1="400" y2="400" x1="880" />
            <wire x2="1040" y1="400" y2="560" x1="1040" />
            <wire x2="1200" y1="560" y2="560" x1="1040" />
            <wire x2="1040" y1="560" y2="576" x1="1040" />
            <wire x2="1040" y1="576" y2="576" x1="992" />
        </branch>
        <instance x="880" y="368" name="XLXI_2" orien="R180" />
        <branch name="clk2x">
            <wire x2="1184" y1="832" y2="832" x1="992" />
            <wire x2="1200" y1="816" y2="816" x1="1184" />
            <wire x2="1184" y1="816" y2="832" x1="1184" />
        </branch>
        <iomarker fontsize="28" x="1200" y="560" name="clk" orien="R0" />
        <iomarker fontsize="28" x="480" y="560" name="clk_in" orien="R180" />
        <iomarker fontsize="28" x="1200" y="816" name="clk2x" orien="R0" />
        <instance x="432" y="1584" name="XLXI_3" orien="R0" />
        <branch name="locked">
            <wire x2="1184" y1="1152" y2="1152" x1="992" />
            <wire x2="1200" y1="1136" y2="1136" x1="1184" />
            <wire x2="1184" y1="1136" y2="1152" x1="1184" />
        </branch>
        <iomarker fontsize="28" x="1200" y="1136" name="locked" orien="R0" />
        <instance x="608" y="1536" name="XLXI_1" orien="R0" />
        <branch name="XLXN_3">
            <wire x2="592" y1="400" y2="640" x1="592" />
            <wire x2="608" y1="640" y2="640" x1="592" />
            <wire x2="656" y1="400" y2="400" x1="592" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="608" y1="1152" y2="1152" x1="496" />
            <wire x2="496" y1="1152" y2="1456" x1="496" />
        </branch>
    </sheet>
</drawing>