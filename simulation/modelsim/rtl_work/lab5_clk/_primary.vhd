library verilog;
use verilog.vl_types.all;
entity lab5_clk is
    port(
        CLK_50          : in     vl_logic;
        CLK_SEL         : in     vl_logic;
        VAR_CLK         : out    vl_logic
    );
end lab5_clk;
