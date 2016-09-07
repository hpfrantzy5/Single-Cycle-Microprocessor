library verilog;
use verilog.vl_types.all;
entity pclock is
    generic(
        NCYCLES         : integer := 10
    );
    port(
        CLK             : in     vl_logic;
        EN              : in     vl_logic;
        CLK_OUT         : out    vl_logic;
        RCO_OUT         : out    vl_logic
    );
end pclock;
