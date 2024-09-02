library verilog;
use verilog.vl_types.all;
entity Counter_0_99_vlg_check_tst is
    port(
        COUT            : in     vl_logic;
        CQ1             : in     vl_logic_vector(3 downto 0);
        CQ2             : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end Counter_0_99_vlg_check_tst;
