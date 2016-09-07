library verilog;
use verilog.vl_types.all;
entity mux_out is
    port(
        adder           : in     vl_logic_vector(7 downto 0);
        shifter         : in     vl_logic_vector(7 downto 0);
        logical         : in     vl_logic_vector(7 downto 0);
        OSEL            : in     vl_logic_vector(1 downto 0);
        Y               : out    vl_logic_vector(7 downto 0)
    );
end mux_out;
