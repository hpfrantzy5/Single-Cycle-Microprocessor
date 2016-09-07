library verilog;
use verilog.vl_types.all;
entity logical is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        OP              : in     vl_logic;
        Y               : out    vl_logic_vector(7 downto 0)
    );
end logical;
