library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        Iin             : in     vl_logic_vector(15 downto 0);
        DR              : out    vl_logic_vector(2 downto 0);
        SA              : out    vl_logic_vector(2 downto 0);
        SB              : out    vl_logic_vector(2 downto 0);
        FS              : out    vl_logic_vector(2 downto 0);
        BS              : out    vl_logic_vector(2 downto 0);
        IMM             : out    vl_logic_vector(5 downto 0);
        OFF             : out    vl_logic_vector(5 downto 0);
        MB              : out    vl_logic;
        MD              : out    vl_logic;
        LD              : out    vl_logic;
        MW              : out    vl_logic;
        EXT_SEL         : out    vl_logic;
        HALT            : out    vl_logic
    );
end decoder;
