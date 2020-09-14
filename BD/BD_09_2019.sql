-- Да се огради буквата на заявката, която извежда за всеки продуцент името му и 
-- броя на фил-мите му по години. 
-- Продуценти, които нямат нито един филм, НЕ трябва да присъстват в резултатнотомножество
use movies;

select MOVIEEXEC.NAME, MOVIE.YEAR, COUNT(*) as CNT
from movieexec
join movie on MOVIEEXEC.CERT# = MOVIE.PRODUCERC#
GROUP BY MOVIEEXEC.CERT#, MOVIEEXEC.NAME, MOVIE.YEAR

-- Да се напише заявка, която да изведе името на най-младата звезда (полът е без значение).
select *
from MOVIESTAR
where BIRTHDATE >= all(select BIRTHDATE from MOVIESTAR)