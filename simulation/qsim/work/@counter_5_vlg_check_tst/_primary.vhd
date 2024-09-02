library verilog;
use verilog.vl_types.all;
entity Counter_5_vlg_check_tst is
    port(
        COUT            : in     vl_logic;
        CQ              : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Counter_5_vlg_check_tst;
