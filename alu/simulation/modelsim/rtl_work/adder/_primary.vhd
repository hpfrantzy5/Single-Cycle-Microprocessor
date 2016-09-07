library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        \A\             : in     vl_logic_vector(7 downto 0);
        \B\             : in     vl_logic_vector(7 downto 0);
        Cin             : in     vl_logic;
        Sum             : out    vl_logic_vector(7 downto 0);
        a               : out    vl_logic_vector(7 downto 0);
        b               : out    vl_logic_vector(7 downto 0);
        Cout            : out    vl_logic;
        Ovr             : out    vl_logic
    );
end adder;
