library verilog;
use verilog.vl_types.all;
entity Counter_55_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        EN              : in     vl_logic;
        MODE            : in     vl_logic_vector(2 downto 0);
        RST             : in     vl_logic;
        START           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Counter_55_vlg_sample_tst;
