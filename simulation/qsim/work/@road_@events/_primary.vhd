library verilog;
use verilog.vl_types.all;
entity Road_Events is
    port(
        DIN             : in     vl_logic_vector(2 downto 0);
        CLK             : in     vl_logic;
        Q               : out    vl_logic_vector(1 downto 0)
    );
end Road_Events;
