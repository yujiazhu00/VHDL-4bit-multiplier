LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity multiplier_tb is
end entity;

architecture multiplier_tb_arch of multiplier_tb is

component multiplier_4_bit
port(A,B: in std_logic_vector(3 downto 0);
Results: out std_logic_vector(7 downto 0));
end component;

signal A_TB, B_TB: std_logic_vector(3 downto 0);
signal Results_TB: std_logic_vector(7 downto 0);

begin

DUT1:  multiplier_4_bit port map(A => A_TB,
B => B_TB,
Results => Results_TB);

STIM: process
variable num1 : unsigned(3 downto 0);
variable num2 : unsigned(3 downto 0);
variable t : std_logic_vector(7 downto 0);

begin

for I in 0 to 15 loop
	for K in 0 to 15 loop
		A_TB <= std_logic_vector(to_unsigned(I, 4));
		B_TB <= std_logic_vector(to_unsigned(K, 4));
		wait for 30 ns;
		num1 := to_unsigned(I, 4);
		num2 := to_unsigned(K, 4);
		t := std_logic_vector(num1*num2);
		if (t(7 downto 0) = Results_TB(7 downto 0)) then
			assert false report "multiply successful" severity NOTE;
		else
			assert false report "error" severity FAILURE;
		end if;
	end loop;
end loop;
end process;
end architecture;


