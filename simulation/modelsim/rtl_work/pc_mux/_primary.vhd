library verilog;
use verilog.vl_types.all;
entity pc_mux is
    port(
        H               : in     vl_logic;
        MP              : in     vl_logic;
        plus_2          : in     vl_logic_vector(7 downto 0);
        branch_ins      : in     vl_logic_vector(7 downto 0);
        curr_pc         : in     vl_logic_vector(7 downto 0);
        NextPC          : out    vl_logic_vector(7 downto 0)
    );
end pc_mux;
