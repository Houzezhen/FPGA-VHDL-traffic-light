library verilog;
use verilog.vl_types.all;
entity Counter_55 is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        EN              : in     vl_logic;
        START           : in     vl_logic;
        MODE            : in     vl_logic_vector(2 downto 0);
        CQ              : out    vl_logic_vector(7 downto 0);
        COUT            : out    vl_logic
    );
end Counter_55;
