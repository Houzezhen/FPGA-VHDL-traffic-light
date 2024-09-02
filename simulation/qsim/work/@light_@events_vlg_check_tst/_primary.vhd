library verilog;
use verilog.vl_types.all;
entity Light_Events_vlg_check_tst is
    port(
        CTRL0           : in     vl_logic;
        CTRL1           : in     vl_logic;
        MODE0           : in     vl_logic_vector(2 downto 0);
        MODE1           : in     vl_logic_vector(2 downto 0);
        Q0              : in     vl_logic_vector(2 downto 0);
        Q1              : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end Light_Events_vlg_check_tst;
