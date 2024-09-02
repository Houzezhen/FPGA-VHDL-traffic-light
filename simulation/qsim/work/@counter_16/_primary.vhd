library verilog;
use verilog.vl_types.all;
entity Counter_16 is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        EN              : in     vl_logic;
        CQ              : out    vl_logic_vector(7 downto 0);
        COUT            : out    vl_logic
    );
end Counter_16;
