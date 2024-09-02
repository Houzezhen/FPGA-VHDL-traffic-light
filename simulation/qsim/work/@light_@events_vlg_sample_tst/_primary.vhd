library verilog;
use verilog.vl_types.all;
entity Light_Events_vlg_sample_tst is
    port(
        DIN             : in     vl_logic_vector(1 downto 0);
        EN0             : in     vl_logic;
        EN1             : in     vl_logic;
        RST             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Light_Events_vlg_sample_tst;
