library ieee;
use ieee.std_logic_1164.all;
entity ALU is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           l : out  STD_LOGIC_VECTOR (0 downto 0);
           g : out  STD_LOGIC_VECTOR (0 downto 0);
           e : out  STD_LOGIC_VECTOR (0 downto 0));
end ALU;
 
architecture Behavioral of ALU is
 
begin
 
process (a,b,sel) is
 
begin
 
case sel is
 
when "0000" =>
 
z<= a and b;
 
when "0001" =>
 
z<= a or b;
 
when "0010" =>
 
z<= a xor b;
 
when "0011" =>
 
z<= a nand b;
 
when "0100" =>
 
z<= a nor b;
 
when "0101" =>
 
z<=a+b;
 
when "0110" =>
 
z<=a-b;
 
when "0111" =>
 
z(3)<=a(2);
z(2)<=a(1);
z(1)<=a(0);
z(0)<= '0';
 
when "1000" =>
 
z(0)<=a(1);
Z(1)<=a(2);
z(2)<=a(3);
z(3)<='0';
 
when "1001" =>
 
z(0)<=a(3);
z(3)<=a(2);
z(2)<=a(1);
z(1)<=a(0);
 
when "1010" =>
 
z(3)<=a(0);
z(2)<=a(3);
z(1)<=a(2);
z(0)<=a(1);
 
when "1011" =>
 
z(0)<=a(0);
z(1)<=a(1);
z(2)<=a(2);
z(3)<='0';
 
when "1100" =>
 
z(0)<=a(0);
z(1)<=a(1);
z(2)<=b(2);
z(3)<=b(3);
 
when "1101" =>
 
if(a>b) then
 
l(0)<='0';
g(0)<='1';
e(0)<='0';
 
elsif(a<b) then
 
l(0)<='1';
g(0)<='0';
e(0)<='0';
 
elsif(a=b) then
 
l(0)<='0';
g(0)<='0';
e(0)<='1';
 
end if;
 
when "1110" =>
 
if(a(3)='0' and b(3)='1') then
l(0)<='0';
g(0)<='1';
e(0)<='0';
 
elsif(a(3)='1' and b(3)='0') then
l(0)<='1';
g(0)<='0';
e(0)<='0';
 
elsif(a(3)='1' and b(3)='1') then
 
if(a<b) then
l(0)<='0';
g(0)<='1';
e(0)<='0';
elsif(a>b) then
l(0)<='1';
g(0)<='0';
e(0)<='0';
elsif(a=b) then
l(0)<='0';
g(0)<='0';
e(0)<='1';
end if;
 
elsif(a(3)='0' and b(3)='0') then
 
if(a<b) then
l(0)<='1';
g(0)<='0';
e(0)<='0';
elsif(a>b) then
l(0)<='0';
g(0)<='1';
e(0)<='0';
elsif(a=b) then
l(0)<='0';
g(0)<='0';
e(0)<='1';
end if;
end if;
 
when others =>
z<=a;
 
end case;
end process;
 
 
end Behavioral;
