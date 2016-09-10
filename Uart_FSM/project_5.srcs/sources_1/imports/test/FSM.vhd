library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity FSM is

	generic(
	         	DBIT	:	integer	:=8
	       	);
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
end entity FSM;

architecture RTL of FSM is
    type  state_type is (idle,send,waitACK, sendequal, waitACK1 ,sendclass, waitACK2, sendequal2,waitACK3 ,sendequal3, waitACK4 );
	signal state_reg, state_next : state_type;
--    signal din1 : std_logic_vector(DBIT-1 downto 0);
    
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


        SEQUENTIAL: process(state_reg, empty, din, tx_done_tick,din)
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
                        state_next <= sendequal;
                    end if;
                when sendequal =>
                    tx_start <= '1';
                    --  dout <= "061"; -- 061 is = or x"3D"
                    dout <= x"3D";
                    state_next <= waitACK1;
                when waitACK1 =>
                    if(tx_done_tick = '1') then
                        state_next <= sendclass;
                    end if;
                when sendclass =>  -- class1-3
                    tx_start <= '1';
                    if(unsigned (din) >= x"41" and unsigned (din) <= x"49") then -- class1
                        --dout <= "1";
                       dout <= x"31";
                    elsif(unsigned (din) >= x"4A" and unsigned (din) <= x"52") then  -- class2
                        --dout <= "2";
                        dout <= x"32";
                    elsif(unsigned (din) >= x"53" and unsigned (din) <= x"5A") then  -- class3
                        --dout <= "3";
                        dout <= x"33";
                    else
                        --dout <= "4"; -- class4
                       dout <= x"34";
                    end if;
                    state_next <= waitACK2;
                when waitACK2 =>
                    if(tx_done_tick = '1') then
                        state_next <= sendequal2;
                    end if;
                when sendequal2 => -- 013
                    tx_start <= '1';
                    --dout <=  "013"; D
                    dout <= x"0D";
                    state_next <= waitACK3;
                when waitACK3 =>
                    if(tx_done_tick = '1') then
                        state_next <= sendequal3;
                    end if;
                when sendequal3 => -- 013
                    tx_start <= '1';
                    --dout <=  "013"; D
                    dout <= x"0D";
                    state_next <= waitACK4;
                when waitACK4 =>
                    if(tx_done_tick = '1') then
                        state_next <= idle;
                    end if;

           end case;
        end process SEQUENTIAL;
        
end architecture RTL;
