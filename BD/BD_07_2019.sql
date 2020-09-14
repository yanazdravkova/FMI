--Да се огради буквата на заявката, която извежда име на студио и броя на филмите му, 
--за тези студия с по-малко от два филма. 
--Студиата, които нямат нито един филм, НЕтрябва да присъстват в резултата
use movies;

select studioname, count(title)
from movie
group by STUDIONAME
having count(title) < 2

-- от a b c d options -> c
select studioname, count(title)
from studio 
join movie on studio.name = movie.STUDIONAME
group by studioname
having count(title) < 2

-- Да се напише заявка, която да изведе имената на всички продуценти с минимален нетен актив.
select name, networth
from MOVIEEXEC
where NETWORTH <= ALL (select NETWORTH from MOVIEEXEC)
