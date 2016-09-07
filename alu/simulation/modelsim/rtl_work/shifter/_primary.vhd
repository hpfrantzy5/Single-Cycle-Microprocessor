library verilog;
use verilog.vl_types.all;
entity shifter is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        LA              : in     vl_logic;
        LR              : in     vl_logic;
        Y               : out    vl_logic_vector(7 downto 0);
        SO              : out    vl_logic;
        OVR             : out    vl_logic;
        CO              : out    vl_logic
    );
end shifter;
