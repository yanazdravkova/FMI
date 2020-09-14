-- �������� �� ������ ��� �� �������,� ����� � �������� ���� �����

use ships;
select battle
from outcomes o1
group by battle
having count(ship) = 1

-- ������� ��� �� ����� � ���� �� ���������� � ����� ������ �� ���������� ����, �� ���� ������� � ������ �� 5 ������
select class, count(distinct name)
from ships 
join outcomes on ships.name = OUTCOMES.SHIP
where result = 'sunk'
 and class in (select Classes.class from classes join ships on CLASSES.CLASS = SHIPS.CLASS group by classes.class having count(name) > 5)
 group by class
