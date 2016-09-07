library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        SA              : in     vl_logic_vector(2 downto 0);
        SB              : in     vl_logic_vector(2 downto 0);
        LD              : in     vl_logic;
        DR              : in     vl_logic_vector(2 downto 0);
        Din             : in     vl_logic_vector(7 downto 0);
        Data_A          : out    vl_logic_vector(7 downto 0);
        Data_B          : out    vl_logic_vector(7 downto 0)
    );
end register_file;
