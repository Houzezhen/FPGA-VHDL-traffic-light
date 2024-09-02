library verilog;
use verilog.vl_types.all;
entity COUNTER4B is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        EN              : in     vl_logic;
        CQ              : out    vl_logic_vector(3 downto 0);
        COUT            : out    vl_logic
    );
end COUNTER4B;
