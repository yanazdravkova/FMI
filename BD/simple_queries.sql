-- �������� ������, ����� ������� ������� �� ��������� ����, ��������� � �Terms of Endearment�
use movies;

select * 
from moviestar 
where name in (select starname from starsin where movietitle like 'Terms of Endearment')
and gender = 'M'

--�������� ������, ����� ������� ������� �� ���������, ��������� ��� �����,
--����������� �� �MGM� ���� 1995 �.
select * from starsin join movie on STARSIN.MOVIETITLE = movie.TITLE and starsin.MOVIEYEAR = MOVIE.YEAR
where MOVIEYEAR = 1995 and STUDIONAME = 'MGM'

-- �������� ������, ����� ������� ������� �� ������ ����� � �������, ��-������
-- �� ��������� �� ����� �Star Wars
select *, (select LENGTH from movie where TITLE = 'Star Wars') as StarWarsLength
from movie 
where LENGTH > (select LENGTH from movie where TITLE = 'Star Wars')

use pc;
-- �������� ������, ����� ������� ������������� � ��������� �� ��������� �� ����
-- ������� � ������ �� ����� ���� 9 GB
select maker, speed
from product 
join laptop on product.model = laptop.model
	where hd > 9

-- �������� ������, ����� ������� ����� �� ����� � ���� �� ������ ��������,
-- ����������� �� ������������ � ��� �B�. ���������� ��������� ����, �� ����� ��
-- �� ������� ���-������� ��������select p.model, pricefrom product pjoin printer pr on p.model = pr.modelwhere maker = 'B'
union 

select p.model, pricefrom product pjoin pc on p.model = pc.modelwhere maker = 'B'

union 

select p.model, pricefrom product pjoin laptop on p.model = laptop.modelwhere maker = 'B'
order by price desc

-- �������� ������, ����� ������� ��������� �� ���� �������, ����� �� ��������� �
-- ���� ��� ���������
select distinct pc1.hd
from pc pc1
join pc pc2 on pc1.hd = pc2.hd
where pc1.code <> pc2.code

-- �������� ������, ����� ������� ������ ������ ������ �� ��������, ����� ����
-- ������� ������� � �����. �������� ������ �� �� �������� ���� �� ������,
-- �������� ���� (i, j), �� �� � (j, i)select distinct *from pc pc1 join pc pc2 on pc1.speed = pc2.speed and pc1.ram = pc2.ramwhere pc1.model < pc2.model
use ships;-- �������� ������, ����� ������� ����� �� ��������, ��-����� (displacement) �� 35000select namefrom ships join classes on ships.class = classes.classwhere DISPLACEMENT > 35000-- �������� ������, ����� ������� �������, ����������������� � ���� ������ ��
-- ������ ������, ��������� � ������� ��� �Guadalcanal�

select ships.name, DISPLACEMENT, NUMGUNS 
from classes join ships on ships.class = classes.class
join OUTCOMES on OUTCOMES.ship = ships.name
where outcomes.battle in (select name from BATTLES where name = 'Guadalcanal')

-- �������� ������, ����� ������� ������� �� ���� �������, ����� ���� �������
-- ������ �� ��� �bb� � �bc� ������������

select distinct c1.COUNTRY
from classes c1
join classes c2 on c1.CLASS = c2.CLASS
where c1.type = 'bb' and c2.type = 'bc'

-- �������� ������, ����� ������� ������� �� ���� ������, ����� �� ����
-- ��������� � ���� �����, �� ��-����� �� ��������� � ����� �����.select o1.shipfrom outcomes o1
join battles b1 on o1.BATTLE = b1.name
join outcomes o2 on o1.ship = o2.ship
join battles b2 on o2.BATTLE = b2.name
where o1.result = 'damaged' and b1.DATE < b2.date

