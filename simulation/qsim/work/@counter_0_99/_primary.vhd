library verilog;
use verilog.vl_types.all;
entity Counter_0_99 is
    port(
        COUT            : out    vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        EN              : in     vl_logic;
        CQ1             : out    vl_logic_vector(3 downto 0);
        CQ2             : out    vl_logic_vector(3 downto 0)
    );
end Counter_0_99;
