library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity UART is
--generic(SIZE: integer := 8);
generic (
    N       : integer := 6   ;
    M       : integer := 54  ; -- 115200
    DBIT    : integer := 8   ;
    SB_TICK : integer := 16  ;
    FIFO_DEPTH : integer := 256;
    W       : integer := 8    
);
    port(
    rx: in std_logic;
    clk,reset: in std_logic;
    tx: out std_logic--;
    
 --   empty,full : out std_logic
        );
end UART;

architecture behavior of UART is


component uart_tx is
--   generic(
--               DBIT: integer := 8;
--               SB_TICK: integer := 16
--          );

    port(
    clk, reset: in std_logic;
    tx_start: in std_logic;
    s_tick: in std_logic;
    din: inout std_logic_vector(7 downto 0);
    tx_done_tick: out std_logic;
    tx: out std_logic
        );
end component;


component uart_rx is
--    generic(
--               DBIT: integer := 8;
--               SB_TICK: integer := 16
--           );
    port(
    clk, reset: in std_logic;
    rx: in std_logic;
    s_tick: in std_logic;
    rx_done_tick: out std_logic;
    dout: out std_logic_vector(7 downto 0)
        );
end component;

component baud_Gen is
--    genieric(
--                N: integer := 6;
--                M: integer := 54;
--            );
    port(
    clk, reset: in std_logic;
    max_tick: out std_logic;
    q: out std_logic_vector (N-1 downto 0)
        );
end component;

component STD_FIFO is
--    generic(W: integer := 8);
	Port ( 
        CLK		: in  STD_LOGIC;
		RST		: in  STD_LOGIC;
		WriteEn	: in  STD_LOGIC;
		DataIn	: in  STD_LOGIC_VECTOR (W - 1 downto 0);
		ReadEn	: in  STD_LOGIC;
		DataOut	: out STD_LOGIC_VECTOR (W - 1 downto 0);
		Empty	: out STD_LOGIC;
		Full	: out STD_LOGIC
	);
end component;


component FSM is

--	generic(
--		DBIT	:	integer	:=8);
	port(
		din	    :	in		std_logic_vector(DBIT-1 downto 0);
        reset   :   in      std_logic;
        Clk     :   in      std_logic;
        empty   :   in      std_logic;
        full    :   in      std_logic; 
        ReadEn  :   out      std_logic;
        tx_done_tick : in   std_logic;
        tx_start :  out     std_logic;
        dout	:	out	std_logic_vector(DBIT-1 downto 0)
    );
end component ;

signal tick,tick1,rd_uart,rx_empty,empty1,full1,ReadEn1: std_logic;
signal q: std_logic_vector(N-1 downto 0);
signal din, dout,dout1: std_logic_vector (7 downto 0);

begin
baud_gen1: baud_Gen 
    port map( 
             clk=> clk, 
             reset=>reset, 
             max_tick=>tick, 
             q=>q
            );

trans1: uart_rx 
    port map(
             clk=>clk,
             reset=>reset,
             rx=>rx,
             s_tick=>tick, 
             rx_done_tick=>tick1,
             dout=> din
            );
reg: STD_FIFO
	port map ( 
        CLK => clk,			
        RST => reset,	
        WriteEn	=> tick1,
        DataIn => din,
        ReadEn => ReadEn1,
        DataOut => dout,
		Empty =>empty1,
        Full =>full1
    );

FSM1: FSM
    port map(
        din	=> dout,
        reset => reset,
        Clk  => clk,
        empty => empty1,
        full => full1,
        ReadEn => ReadEn1,
        tx_done_tick => rd_uart,
        tx_start => rx_empty,
        dout => dout1
    );


trans2: uart_tx 
    port map(
            clk=>clk, 
            reset=>reset, 
            tx_start=> rx_empty, 
            s_tick=>tick, 
            din=>dout1,
            tx_done_tick=>rd_uart,
            tx=> tx
            );
            
end behavior;
