LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity mod_full_adder is
port (A,B,C: in std_logic;
Sum,p,g: out std_logic);
end entity;

architecture mod_full_adder_arch of mod_full_adder is


begin
Sum <= A xor B xor C;
g <= A and B;
p <= A or B;

end architecture; 

