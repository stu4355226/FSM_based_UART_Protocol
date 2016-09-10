-- include library
library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

-- define entity testbench1
entity testbench is
generic (
    N       : integer := 6   ;
    M       : integer := 54  ; -- 115200
    DBIT    : integer := 8   ;
    SB_TICK : integer := 16  ;
    W       : integer := 8    
);
end testbench;

-- architecture of testbench1
architecture arch of testbench is
component UART is
generic (
    N       : integer := 6   ;
    M       : integer := 54  ; -- 115200
    DBIT    : integer := 8   ;
    SB_TICK : integer := 16  ;
    W       : integer := 8    
);
port (
    rx : in std_logic;
    clk,reset: in std_logic;
    tx : out std_logic--;
 --   empty,full : out std_logic --;
    --test       : out std_logic_vector(7 downto 0)  
);
end component;
 
signal clk_sig   : std_logic ;
signal reset_sig : std_logic ;
signal rx_sig    : std_logic ;
signal tx_sig    : std_logic ;
signal test_sig  : std_logic_vector(7 downto 0);

type data_mem_type is ARRAY(integer range 0 to 1) of std_logic_vector(7 downto 0);
signal data_mem : data_mem_type ;
signal rd_ptr, wr_ptr : unsigned(0 downto 0) ;

signal data_tx   : std_logic_vector(7 downto 0) ;
signal data_rx   : std_logic_vector(7 downto 0) ;
signal tx_valid  : std_logic ;
signal tx_ack    : std_logic ;
signal rx_valid  : std_logic ;

begin

-- instantiate four_bits_counter
u_uart: uart generic map (
    N       => N       ,
    M       => M       ,
    DBIT    => DBIT    ,
    SB_TICK => SB_TICK ,
    W       => W        
) port map (
    clk   =>  clk_sig   ,
    reset =>  reset_sig ,
    rx    =>  tx_sig    ,
    tx    =>  rx_sig    --,
    --test  =>  test_sig   
);

-- generate clock
process 
variable i : integer;
begin
    clk_sig <= '0';
    wait for 5 ns;
    clk_sig <= '1';
    wait for 5 ns;
end process;

-- reset
process 
variable i : integer;
begin
    -- reset the uut
    reset_sig <= '0';
    wait for 30 ns;

    reset_sig <= '1';
    for i in 0 to 10 loop
        wait until rising_edge(clk_sig);
    end loop;
    wait for 30 ns;

    reset_sig <= '0';
    wait;
end process;

-- generator
process 
variable seed1, seed2: positive := 1;
variable rand: real;
variable int_rand: integer;
variable i, j, k : integer;
variable loop_cnt : integer := 10;

begin

    data_tx <= (others => '0');
    tx_valid <= '0';

    wait until falling_edge(reset_sig);
    wait until rising_edge(clk_sig);

    for i in 0 to loop_cnt loop
        uniform(seed1, seed2, rand);
        int_rand := integer(trunc(rand * 100.0 + 55.0));
        data_tx <= std_logic_vector(to_unsigned(int_rand, data_tx'length));

        wait until rising_edge(clk_sig);
        tx_valid <= '1';
        wait until rising_edge(clk_sig);
        tx_valid <= '0';

        wait until rising_edge(tx_ack);
        for j in 0 to 10 loop
            wait until rising_edge(clk_sig);
        end loop;
    end loop;

     -- wait for 16 uart data cycle
    for k in 0 to 50 loop
        for j in 0 to 15 loop
            for i in 0 to M-1 loop
                wait until rising_edge(clk_sig);
            end loop;
        end loop;
    end loop;
end process;

---- driver
process 
variable i : integer;
variable j : integer;
variable k : integer;
variable data_tmp : std_logic_vector(7 downto 0) ;
begin
    tx_sig <= '1' ;
    tx_ack <= '0';
    wr_ptr <= (others => '0');

    while true loop
        wait until rising_edge(tx_valid);

        -- start bit
        wait until rising_edge(clk_sig);
        data_tmp := data_tx;
        data_mem(to_integer(wr_ptr)) <= data_tx;
        if(wr_ptr = 1) then
            wr_ptr <= (others => '0');
        else
            wr_ptr <= wr_ptr + 1;
        end if;
        tx_sig <= '0' ;

        -- wait for one uart data cycle
        for j in 0 to 15 loop
            for i in 0 to M-1 loop
                wait until rising_edge(clk_sig);
            end loop;
        end loop;
		--ReadEn <= '1';
        -- send data
        for k in 0 to 7 loop
            tx_sig <= data_tmp(0);
            data_tmp := '0' & data_tmp(7 downto 1);

            -- wait for one uart data cycle
            for j in 0 to 15 loop
                for i in 0 to M-1 loop
                    wait until rising_edge(clk_sig);
                end loop;
            end loop;
        end loop;

        -- stop bit
        tx_sig <= '1' ;

        -- wait for one uart data cycle
        for j in 0 to 15 loop
            for i in 0 to M-1 loop
                wait until rising_edge(clk_sig);
            end loop;
        end loop;

        wait until rising_edge(clk_sig);
        tx_ack <= '1';
        wait until rising_edge(clk_sig);
        tx_ack <= '0';

    end loop;
end process;

-- monitor
process 
variable i : integer;
variable j : integer;
variable k : integer;
begin
    data_rx <= (others => '0');
    rx_valid <= '0';
    wait until falling_edge(reset_sig);

    while true loop
        wait until falling_edge(rx_sig);
        data_rx <= (others => '0');

        -- wait for half uart data cycle
        for j in 0 to 7 loop
            for i in 0 to M-1 loop
                wait until rising_edge(clk_sig);
            end loop;
        end loop;

        -- check start bit
        next when(rx_sig = '1');

        -- store data
        for k in 0 to 7 loop
            -- wait for one uart data cycle
            for j in 0 to 15 loop
                for i in 0 to M-1 loop
                    wait until rising_edge(clk_sig);
                end loop;
            end loop;

            data_rx <= rx_sig & data_rx(7 downto 1);
        end loop;

        -- wait for one uart data cycle
        for j in 0 to 15 loop
            for i in 0 to M-1 loop
                wait until rising_edge(clk_sig);
            end loop;
        end loop;

        -- stop bit
        next when(rx_sig = '0');

        wait until rising_edge(clk_sig);
        rx_valid <= '1';
        wait until rising_edge(clk_sig);
        rx_valid <= '0';
    end loop;
end process;

--verifier
process
variable error_status: boolean;
variable i : integer;
begin
    rd_ptr <= (others => '0');

    while true loop
        wait until rising_edge(rx_valid);
        -- check data
        if(data_mem(to_integer(rd_ptr)) /= data_rx) then
            error_status := true;
        else
            error_status := false;
        end if;

        -- error reporting
        assert not error_status
        report "test failed."
        severity note; -- note, warning, error, failure. Failure aborts the simulation

        if(rd_ptr = 1) then
            rd_ptr <= (others => '0');
        else
            rd_ptr <= rd_ptr + 1;
        end if;

    end loop;
end process;

end arch;

