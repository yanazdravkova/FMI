use movies;
-- Напишете заявка, която за всеки филм, по-дълъг от 120 минути, извежда
-- заглавие, година, име и адрес на студио.select *from movie join studio on movie.STUDIONAME = studio.NAMEwhere LENGTH > 120--• Напишете заявка, която извежда името на студиото и имената на актьорите,
-- участвали във филми, произведени от това студио, подредени по име на студио.
select distinct STUDIONAME, STARNAME
from movie
join STARSIN on MOVIE.TITLE = STARSIN.MOVIETITLE and MOVIE.YEAR = STARSIN.MOVIEYEAR
order by STUDIONAME

--Напишете заявка, която извежда имената на продуцентите на филмите, в които е
--играл Harrison Ford.

select *
from STARSIN 
join MOVIE on MOVIE.TITLE = STARSIN.MOVIETITLE and MOVIE.YEAR = STARSIN.MOVIEYEAR
join MOVIEEXEC on MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
where STARNAME = 'Harrison Ford'

--Напишете заявка, която извежда имената на актьорите не участвали в нито един
--филм.
select *
from MOVIESTAR
where name not in (select starname from STARSIN)

use pc;
--Напишете заявка, която извежда производител, модел и тип на продукт за тези
--производители, за които съответния продукт не се продава (няма го в таблиците
--PC, лаптоп или принтер).
select *
from product
where model not in (select model from printer union all select model from pc union all select model from laptop)

use ships;
--Напишете заявка, която за всеки кораб извежда името му, държавата, броя
--оръдия и годината на пускане (launched).select name, COUNTRY, NUMGUNS, LAUNCHEDfrom shipsjoin CLASSES on ships.CLASS = CLASSES.CLASS--Напишете заявка, която извежда имената на корабите, участвали в битка от 1942г. select distinct ship fromOUTCOMESjoin BATTLES on OUTCOMES.BATTLE = BATTLES.NAMEwhere YEAR(DATE) = '1942'--За всяка страна изведете имената на корабите, които никога не са участвали в
--битка.select country, namefrom classesjoin ships on CLASSES.CLASS = SHIPS.CLASSwhere name not in (Select ship from OUTCOMES)