library verilog;
use verilog.vl_types.all;
entity COUNTER4B_vlg_check_tst is
    port(
        COUT            : in     vl_logic;
        CQ              : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end COUNTER4B_vlg_check_tst;
