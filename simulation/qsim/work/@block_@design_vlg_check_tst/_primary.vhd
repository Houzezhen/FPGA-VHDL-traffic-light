library verilog;
use verilog.vl_types.all;
entity Block_Design_vlg_check_tst is
    port(
        BEEP_OUT        : in     vl_logic;
        cout0           : in     vl_logic;
        cout1           : in     vl_logic;
        CQ0             : in     vl_logic_vector(7 downto 0);
        CQ1             : in     vl_logic_vector(7 downto 0);
        MODE0           : in     vl_logic_vector(2 downto 0);
        MODE1           : in     vl_logic_vector(2 downto 0);
        Q0              : in     vl_logic_vector(2 downto 0);
        Q1              : in     vl_logic_vector(2 downto 0);
        Q2              : in     vl_logic_vector(2 downto 0);
        Q3              : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end Block_Design_vlg_check_tst;
