library verilog;
use verilog.vl_types.all;
entity branch_mux is
    port(
        Z               : in     vl_logic;
        N               : in     vl_logic;
        BS              : in     vl_logic_vector(2 downto 0);
        MP              : out    vl_logic
    );
end branch_mux;
