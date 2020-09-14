--�� �� ������ ������, ����� ������� ��� �� ����, �������� �� ������� �����, � ����� ����� �� ���� ���� � ��������, 
--�������� �� ���������� �����, � ����� ����� �� ���� ���� � ��������, 
--� ���� �� ������ �������� �����, � ����� ������ �� ���� ���� �� ���������, ���� �� ���� �������, ��������� � ������� N. 
--��� �� ����� ���� ���� �����, ����� �� � �������� � �����, �� ����������� ������ �� �� ����� �������� null

use ships;

select min(year(date)) as minYear, max(year(date)) as maxYear, count(distinct battle)
from ships
left join OUTCOMES on ships.NAME = OUTCOMES.SHIP
left join BATTLES on BATTLES.NAME = BATTLE
where class like 'N%'
group by class


--�� �� ������ ������, ����� �� ������ ������� �� ���� �����, �� ����� ����� �� �������� �� ��� 'bb',
--��������� � ���� �����, � ��-����� �� ���� �� �������� �� ��� 'bc', ��������� � ������ �����. 
--�����, � ����� �� � �������� ���� ���� �����, �� �� �� �������� � ���������.

select battle
from OUTCOMES 
join ships on OUTCOMES.ship = ships.name
left join classes bb on bb.CLASS = ships.CLASS and bb.type = 'bb'
left join classes bc on bc.CLASS = ships.CLASS and bc.type = 'bc'
group by battle
having count(bb.CLASS) > count (bc.CLASS) and count(bb.class) + count(bc.class) > 0