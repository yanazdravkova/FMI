use pc;
-- �������� ������, ����� ������� �������� ������� �� ����������
select avg(speed) 
from pc

--�������� ������, ����� ������� ������� ������ �� �������� �� ��������� ��
--����� ������������
--������������ �A
select avg(price)
from pc
join product on pc.model = product.model
where maker = 'A'

--�������� ������, ����� ������� �������� ���� �� ���������� � ��������� ��
--������������ �B�
select avg(price)
from (select price 
		from pc join product on pc.model = product.model
		where maker = 'B'
	union all 
		select price 
		from laptop join product on laptop.model = product.model
		where maker = 'B') AllPrices

--�������� ������, ����� ������� �������� ���� �� ���������� ������
--���������� �� �������
select speed, avg(price)
from pc
group by speed

--� �������� ������, ����� ������� ���������������, ����� �� ��������� ���� �� 3
--�������� ������ ���������
--��-������ �� 300
--���-������ � ���-������� ������ ��� ����� ������
--������� �� ����
select avg(numguns)
from CLASSES
where class in (select class from ships where launched is not null)

--�������� ������, ����� ������� �� ����� ���� ������� � ���������� ������, �
--����� ����� �� ���������� ���� � ������ �� ����
select class, min(launched) as minYear, max(launched) as maxYear
from ships
group by class

--� �������� ������, ����� ������� ���� �� �������� �������� � ����� ������ �����
select class, count(*)
from ships 
where name in (select ship from OUTCOMES where RESULT = 'sunk')
group by class

--� �������� ������, ����� ������� ���� �� �������� �������� � ����� ������
--�����, �� ���� ������� � ������ �� 4 ������� �� ���� ������
select class, count(*)
from ships 
where name in (select ship from OUTCOMES where RESULT = 'sunk') 
and 
class in (select class 
			from ships 
			group by class 
			having count(*) > 4)
group by class

--�������� ������, ����� ������� �������� ����� �� ��������, �� ����� ������. 
select country, avg(bore)
from classes
group by country