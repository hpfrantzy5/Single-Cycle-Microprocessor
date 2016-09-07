library verilog;
use verilog.vl_types.all;
entity mem_mux is
    port(
        dram_output     : in     vl_logic_vector(7 downto 0);
        Data_D          : in     vl_logic_vector(7 downto 0);
        MD              : in     vl_logic;
        Data_C          : out    vl_logic_vector(7 downto 0)
    );
end mem_mux;
