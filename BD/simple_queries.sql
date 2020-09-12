-- Напишете заявка, която извежда имената на актьорите мъже, участвали в ‘Terms of Endearment’
use movies;

select * 
from moviestar 
where name in (select starname from starsin where movietitle like 'Terms of Endearment')
and gender = 'M'

--Напишете заявка, която извежда имената на актьорите, участвали във филми,
--продуцирани от ‘MGM’ през 1995 г.
select * from starsin join movie on STARSIN.MOVIETITLE = movie.TITLE and starsin.MOVIEYEAR = MOVIE.YEAR
where MOVIEYEAR = 1995 and STUDIONAME = 'MGM'

-- Напишете заявка, която извежда имената на всички филми с дължина, по-голяма
-- от дължината на филма ‘Star Wars
select *, (select LENGTH from movie where TITLE = 'Star Wars') as StarWarsLength
from movie 
where LENGTH > (select LENGTH from movie where TITLE = 'Star Wars')

use pc;
-- Напишете заявка, която извежда производителя и честотата на процесора на тези
-- лаптопи с размер на диска поне 9 GB
select maker, speed
from product 
join laptop on product.model = laptop.model
	where hd > 9

-- Напишете заявка, която извежда номер на модел и цена на всички продукти,
-- произведени от производител с име ‘B’. Сортирайте резултата така, че първо да
-- се изведат най-скъпите продуктиselect p.model, pricefrom product pjoin printer pr on p.model = pr.modelwhere maker = 'B'
union 

select p.model, pricefrom product pjoin pc on p.model = pc.modelwhere maker = 'B'

union 

select p.model, pricefrom product pjoin laptop on p.model = laptop.modelwhere maker = 'B'
order by price desc

-- Напишете заявка, която извежда размерите на тези дискове, които се предлагат в
-- поне два компютъра
select distinct pc1.hd
from pc pc1
join pc pc2 on pc1.hd = pc2.hd
where pc1.code <> pc2.code

-- Напишете заявка, която извежда всички двойки модели на компютри, които имат
-- еднаква честота и памет. Двойките трябва да се показват само по веднъж,
-- например само (i, j), но не и (j, i)select distinct *from pc pc1 join pc pc2 on pc1.speed = pc2.speed and pc1.ram = pc2.ramwhere pc1.model < pc2.model
use ships;-- Напишете заявка, която извежда името на корабите, по-тежки (displacement) от 35000select namefrom ships join classes on ships.class = classes.classwhere DISPLACEMENT > 35000-- Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на
-- всички кораби, участвали в битката при ‘Guadalcanal’

select ships.name, DISPLACEMENT, NUMGUNS 
from classes join ships on ships.class = classes.class
join OUTCOMES on OUTCOMES.ship = ships.name
where outcomes.battle in (select name from BATTLES where name = 'Guadalcanal')

-- Напишете заявка, която извежда имената на тези държави, които имат класове
-- кораби от тип ‘bb’ и ‘bc’ едновременно

select distinct c1.COUNTRY
from classes c1
join classes c2 on c1.CLASS = c2.CLASS
where c1.type = 'bb' and c2.type = 'bc'

-- Напишете заявка, която извежда имената на тези кораби, които са били
-- повредени в една битка, но по-късно са участвали в друга битка.select o1.shipfrom outcomes o1
join battles b1 on o1.BATTLE = b1.name
join outcomes o2 on o1.ship = o2.ship
join battles b2 on o2.BATTLE = b2.name
where o1.result = 'damaged' and b1.DATE < b2.date

