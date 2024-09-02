library verilog;
use verilog.vl_types.all;
entity Light_Events is
    port(
        DIN             : in     vl_logic_vector(1 downto 0);
        EN1             : in     vl_logic;
        EN0             : in     vl_logic;
        RST             : in     vl_logic;
        CTRL1           : out    vl_logic;
        CTRL0           : out    vl_logic;
        MODE1           : out    vl_logic_vector(2 downto 0);
        MODE0           : out    vl_logic_vector(2 downto 0);
        Q1              : out    vl_logic_vector(2 downto 0);
        Q0              : out    vl_logic_vector(2 downto 0)
    );
end Light_Events;
