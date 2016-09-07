library verilog;
use verilog.vl_types.all;
entity control is
    port(
        OP              : in     vl_logic_vector(2 downto 0);
        CISEL           : out    vl_logic;
        BSEL            : out    vl_logic_vector(1 downto 0);
        OSEL            : out    vl_logic_vector(1 downto 0);
        LA              : out    vl_logic;
        LR              : out    vl_logic;
        LOP             : out    vl_logic
    );
end control;
