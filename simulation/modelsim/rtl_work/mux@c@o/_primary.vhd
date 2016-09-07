library verilog;
use verilog.vl_types.all;
entity muxCO is
    port(
        OSEL            : in     vl_logic_vector(1 downto 0);
        CO_adder        : in     vl_logic;
        CO_shifter      : in     vl_logic;
        CO              : out    vl_logic
    );
end muxCO;
