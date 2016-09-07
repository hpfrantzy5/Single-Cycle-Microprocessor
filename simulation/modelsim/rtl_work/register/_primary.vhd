library verilog;
use verilog.vl_types.all;
entity \register\ is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        D               : in     vl_logic_vector(7 downto 0);
        LD              : in     vl_logic;
        Q               : out    vl_logic_vector(7 downto 0)
    );
end \register\;
