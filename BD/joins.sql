use movies;
-- �������� ������, ����� �� ����� ����, ��-����� �� 120 ������, �������
-- ��������, ������, ��� � ����� �� ������.select *from movie join studio on movie.STUDIONAME = studio.NAMEwhere LENGTH > 120--� �������� ������, ����� ������� ����� �� �������� � ������� �� ���������,
-- ��������� ��� �����, ����������� �� ���� ������, ��������� �� ��� �� ������.
select distinct STUDIONAME, STARNAME
from movie
join STARSIN on MOVIE.TITLE = STARSIN.MOVIETITLE and MOVIE.YEAR = STARSIN.MOVIEYEAR
order by STUDIONAME

--�������� ������, ����� ������� ������� �� ������������ �� �������, � ����� �
--����� Harrison Ford.

select *
from STARSIN 
join MOVIE on MOVIE.TITLE = STARSIN.MOVIETITLE and MOVIE.YEAR = STARSIN.MOVIEYEAR
join MOVIEEXEC on MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
where STARNAME = 'Harrison Ford'

--�������� ������, ����� ������� ������� �� ��������� �� ��������� � ���� ����
--����.
select *
from MOVIESTAR
where name not in (select starname from STARSIN)

use pc;
--�������� ������, ����� ������� ������������, ����� � ��� �� ������� �� ����
--�������������, �� ����� ���������� ������� �� �� ������� (���� �� � ���������
--PC, ������ ��� �������).
select *
from product
where model not in (select model from printer union all select model from pc union all select model from laptop)

use ships;
--�������� ������, ����� �� ����� ����� ������� ����� ��, ���������, ����
--������ � �������� �� ������� (launched).select name, COUNTRY, NUMGUNS, LAUNCHEDfrom shipsjoin CLASSES on ships.CLASS = CLASSES.CLASS--�������� ������, ����� ������� ������� �� ��������, ��������� � ����� �� 1942�. select distinct ship fromOUTCOMESjoin BATTLES on OUTCOMES.BATTLE = BATTLES.NAMEwhere YEAR(DATE) = '1942'--�� ����� ������ �������� ������� �� ��������, ����� ������ �� �� ��������� �
--�����.select country, namefrom classesjoin ships on CLASSES.CLASS = SHIPS.CLASSwhere name not in (Select ship from OUTCOMES)