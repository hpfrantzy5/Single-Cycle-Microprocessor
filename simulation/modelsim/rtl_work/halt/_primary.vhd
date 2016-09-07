library verilog;
use verilog.vl_types.all;
entity halt is
    port(
        EN_L_prev       : in     vl_logic;
        EN_L            : in     vl_logic;
        HALT            : in     vl_logic;
        H               : out    vl_logic
    );
end halt;
