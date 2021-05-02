LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity full_adder is
port(A,B: in std_logic_vector(6 downto 0);
Sum: out std_logic_vector(6 downto 0);
Cout: out std_logic_vector(0 downto 0));
end entity;

architecture full_adder_arch of full_adder is

component mod_full_adder 
port (A,B,C: in std_logic;
Sum,p,g: out std_logic);
end component;

signal C: std_logic_vector(7 downto 0);
signal g,p: std_logic_vector(6 downto 0); 

begin

C(0) <= '0';
adders:
for M in 0 to 6 GENERATE
	adder: mod_full_adder port map(A(M),B(M),C(M),Sum(M),p(M),g(M));
	C(M+1) <= g(M) or (p(M) and C(M));
end GENERATE;

Cout(0) <= C(7);


end architecture;
