library verilog;
use verilog.vl_types.all;
entity Block_Design is
    port(
        BEEP_OUT        : out    vl_logic;
        Q1              : out    vl_logic_vector(2 downto 0);
        CLK             : in     vl_logic;
        START           : in     vl_logic;
        RST             : in     vl_logic;
        D_CTR           : in     vl_logic;
        DIN             : in     vl_logic_vector(2 downto 0);
        Q0              : out    vl_logic_vector(2 downto 0);
        BEEP            : in     vl_logic;
        cout0           : out    vl_logic;
        cout1           : out    vl_logic;
        CQ0             : out    vl_logic_vector(7 downto 0);
        CQ1             : out    vl_logic_vector(7 downto 0);
        MODE0           : out    vl_logic_vector(2 downto 0);
        MODE1           : out    vl_logic_vector(2 downto 0);
        Q2              : out    vl_logic_vector(2 downto 0);
        Q3              : out    vl_logic_vector(2 downto 0)
    );
end Block_Design;
