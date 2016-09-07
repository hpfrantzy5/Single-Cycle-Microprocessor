library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        OP              : in     vl_logic_vector(2 downto 0);
        Y               : out    vl_logic_vector(7 downto 0);
        Y1_SEGMENTS     : out    vl_logic_vector(6 downto 0);
        Y0_SEGMENTS     : out    vl_logic_vector(6 downto 0);
        ZRO             : out    vl_logic;
        NEG             : out    vl_logic;
        SO              : out    vl_logic;
        CO              : out    vl_logic;
        OVR             : out    vl_logic
    );
end alu;
