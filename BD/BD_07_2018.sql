--�� �� ������ ������, ����� �� ������ ��� �� ������, �������� �� ������ ���� �� ���� ������, 
--�������� �� ��������� ���� �� ���� ������ 
--� ���� �� ������ ����� �� ���� ������, ���� �� ���� ������ ��������� � ������� �M�

use movies;

select studio.name, min(year), max(year), count(title)
from studio
join movie on studio.name = movie.STUDIONAME
where studio.name like 'M%'
group by studio.name
