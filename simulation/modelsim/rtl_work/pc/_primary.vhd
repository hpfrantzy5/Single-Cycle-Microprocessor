library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        EN_L            : in     vl_logic;
        NextPC          : in     vl_logic_vector(7 downto 0);
        PC              : out    vl_logic_vector(7 downto 0);
        EN_L_curr       : out    vl_logic
    );
end pc;
