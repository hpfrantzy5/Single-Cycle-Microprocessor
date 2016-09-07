library verilog;
use verilog.vl_types.all;
entity muxBneg is
    port(
        B               : in     vl_logic_vector(7 downto 0);
        BSEL            : in     vl_logic_vector(1 downto 0);
        \Out\           : out    vl_logic_vector(7 downto 0)
    );
end muxBneg;
