library verilog;
use verilog.vl_types.all;
entity imm_mux is
    port(
        Data_B          : in     vl_logic_vector(7 downto 0);
        IMM_extended    : in     vl_logic_vector(7 downto 0);
        MB              : in     vl_logic;
        new_Data_B      : out    vl_logic_vector(7 downto 0)
    );
end imm_mux;
