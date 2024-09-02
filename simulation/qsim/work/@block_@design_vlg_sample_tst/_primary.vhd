library verilog;
use verilog.vl_types.all;
entity Block_Design_vlg_sample_tst is
    port(
        BEEP            : in     vl_logic;
        CLK             : in     vl_logic;
        D_CTR           : in     vl_logic;
        DIN             : in     vl_logic_vector(2 downto 0);
        RST             : in     vl_logic;
        START           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Block_Design_vlg_sample_tst;
