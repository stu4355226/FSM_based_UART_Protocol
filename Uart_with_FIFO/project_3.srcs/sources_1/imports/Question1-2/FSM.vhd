
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity FSM is

	generic(
		DBIT	:	integer	:=8);
	port(
		din	    :	in		std_logic_vector(DBIT-1 downto 0);
        reset   :   in      std_logic;
        Clk     :   in      std_logic;
        empty   :   in      std_logic;
        full    :   in      std_logic; 
        ReadEn  :   out      std_logic;
        tx_done_tick : in   std_logic;
        tx_start :  out     std_logic;
        dout	:	out	std_logic_vector(DBIT-1 downto 0));
end entity FSM;

architecture RTL of FSM is
    type  state_type is (idle,send,waitACK);
	signal state_reg, state_next : state_type;
	begin
        --clock
        process (clk, reset)
        begin
            if (reset='1')then
                state_reg <= idle; -- (others => '0');
            elsif (clk'event and clk = '1') then
                state_reg <= state_next;
            end if;
        end process;


        SEQUENTIAL: process(state_reg, empty, din, tx_done_tick)
		begin
            state_next <= state_reg;
            ReadEn <= '0';
            tx_start <= '0';
            dout <= (others => '0');

            case state_reg is
                when idle =>
                    if (empty = '0') then
                        ReadEn <= '1';
                        state_next <= send;
                    end if;
                when send =>
                    tx_start <= '1';
                    dout <= din;
                    state_next <= waitACK;
                when waitACK =>
                    if(tx_done_tick = '1') then
                        state_next <= idle;
                    end if;
            end case;
        end process SEQUENTIAL;
        
end architecture RTL;
