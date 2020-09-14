--�� �� ������ ������� �� ��������, ����� ������� ��� �� ������ � ���� �� ������� ��, 
--�� ���� ������ � ��-����� �� ��� �����. 
--��������, ����� ����� ���� ���� ����, �������� �� ���������� � ���������
use movies;

select studioname, count(title)
from movie
group by STUDIONAME
having count(title) < 2

-- �� a b c d options -> c
select studioname, count(title)
from studio 
join movie on studio.name = movie.STUDIONAME
group by studioname
having count(title) < 2

-- �� �� ������ ������, ����� �� ������ ������� �� ������ ���������� � ��������� ����� �����.
select name, networth
from MOVIEEXEC
where NETWORTH <= ALL (select NETWORTH from MOVIEEXEC)
