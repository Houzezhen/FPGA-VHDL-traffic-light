library verilog;
use verilog.vl_types.all;
entity Road_Events_vlg_check_tst is
    port(
        Q               : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end Road_Events_vlg_check_tst;
