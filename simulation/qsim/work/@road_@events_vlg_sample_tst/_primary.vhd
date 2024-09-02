library verilog;
use verilog.vl_types.all;
entity Road_Events_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        DIN             : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end Road_Events_vlg_sample_tst;
