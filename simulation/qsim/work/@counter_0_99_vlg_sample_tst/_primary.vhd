library verilog;
use verilog.vl_types.all;
entity Counter_0_99_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        EN              : in     vl_logic;
        RST             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Counter_0_99_vlg_sample_tst;