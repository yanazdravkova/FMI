-- �� �� ������ ������� �� ��������, ����� ������� �� ����� ��������� ����� �� � 
-- ���� �� ���-���� �� �� ������. 
-- ����������, ����� ����� ���� ���� ����, �� ������ �� ���������� � ���������������������
use movies;

select MOVIEEXEC.NAME, MOVIE.YEAR, COUNT(*) as CNT
from movieexec
join movie on MOVIEEXEC.CERT# = MOVIE.PRODUCERC#
GROUP BY MOVIEEXEC.CERT#, MOVIEEXEC.NAME, MOVIE.YEAR

-- �� �� ������ ������, ����� �� ������ ����� �� ���-������� ������ (����� � ��� ��������).
select *
from MOVIESTAR
where BIRTHDATE >= all(select BIRTHDATE from MOVIESTAR)