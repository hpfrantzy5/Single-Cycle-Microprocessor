library verilog;
use verilog.vl_types.all;
entity sign_extend is
    port(
        EXT_SEL         : in     vl_logic;
        IMM             : in     vl_logic_vector(5 downto 0);
        IMM_new         : out    vl_logic_vector(7 downto 0)
    );
end sign_extend;
