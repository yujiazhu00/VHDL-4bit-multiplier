LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity multiplier_4_bit is
port(A,B: in std_logic_vector(3 downto 0);
Results: out std_logic_vector(7 downto 0));
end entity;

architecture multiplier_4_bit_arch of multiplier_4_bit is

component full_adder
port(A,B: in std_logic_vector(6 downto 0);
Sum: out std_logic_vector(6 downto 0);
Cout: out std_logic_vector(0 downto 0));
end component;

signal product_0: std_logic_vector(6 downto 0) := (others => '0'); 
signal product_1: std_logic_vector(6 downto 0) := (others => '0');
signal product_2: std_logic_vector(6 downto 0) := (others => '0');
signal product_3: std_logic_vector(6 downto 0) := (others => '0');
signal partial_sum_1: std_logic_vector(6 downto 0);
signal partial_sum_2: std_logic_vector(6 downto 0);
signal partial_sum_3: std_logic_vector(6 downto 0);
signal carry1: std_logic_vector(0 downto 0);
signal carry2: std_logic_vector(0 downto 0);
signal carry3: std_logic_vector(0 downto 0);

begin

-- create the products first

products0:
for K in 0 to 3 GENERATE
	product_0(K) <= B(0) and A(K);
end GENERATE;

products1:
for L in 0 to 3 GENERATE
	product_1(L+1) <= B(1) and A(L);
end GENERATE;

products2:
for M in 0 to 3 GENERATE
	product_2(M+2) <= B(2) and A(M);
end GENERATE;

products3:
for N in 0 to 3 GENERATE
	product_3(N+3) <= B(3) and A(N);
end GENERATE;

--to put the numbers into the adder

adder1: full_adder port map(product_0, product_1,partial_sum_1,carry1);
adder2: full_adder port map(partial_sum_1, product_2,partial_sum_2,carry2);
adder3: full_adder port map(partial_sum_2, product_3,partial_sum_3,carry3);

Results <= carry3 & partial_sum_3;

end architecture;
