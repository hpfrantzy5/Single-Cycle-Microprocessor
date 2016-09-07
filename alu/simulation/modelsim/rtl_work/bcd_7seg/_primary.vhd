library verilog;
use verilog.vl_types.all;
entity bcd_7seg is
    port(
        DATA            : in     vl_logic_vector(3 downto 0);
        SEGMENTS        : out    vl_logic_vector(6 downto 0)
    );
end bcd_7seg;
