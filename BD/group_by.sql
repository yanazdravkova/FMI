use pc;
-- Напишете заявка, която извежда средната честота на компютрите
select avg(speed) 
from pc

--Напишете заявка, която извежда средния размер на екраните на лаптопите за
--всеки производителselect maker, avg(screen)from laptopjoin product on laptop.model = product.modelgroup by maker-- Напишете заявка, която извежда средната честота на лаптопите с цена над 1000select avg(speed)from laptopwhere price > 1000--Напишете заявка, която извежда средната цена на компютрите произведени от
--производител ‘A
select avg(price)
from pc
join product on pc.model = product.model
where maker = 'A'

--Напишете заявка, която извежда средната цена на компютрите и лаптопите за
--производител ‘B’
select avg(price)
from (select price 
		from pc join product on pc.model = product.model
		where maker = 'B'
	union all 
		select price 
		from laptop join product on laptop.model = product.model
		where maker = 'B') AllPrices

--Напишете заявка, която извежда средната цена на компютрите според
--различните им честоти
select speed, avg(price)
from pc
group by speed

--• Напишете заявка, която извежда производителите, които са произвели поне по 3
--различни модела компютъраselect makerfrom productwhere type = 'PC'group by makerhaving count(*) >= 3-- • Напишете заявка, която извежда производителите на компютрите с най-висока ценаselect distinct makerfrom productjoin pc on pc.model = product.modelwhere price = (select max(price) from pc)--Напишете заявка, която извежда средната цена на компютрите за всяка честота
--по-голяма от 300select avg(price) as average, speed from pcwhere speed > 300group by speed--Напишете заявка, която за всеки размер на лаптоп намира разликата в цената на
--най-скъпия и най-евтиния лаптоп със същия размерselect screen, max(price) - min(price) as difffrom laptopgroup by screenuse ships;--• Напишете заявка, която извежда броя на класовете корабиselect count(class)from classes--Напишете заявка, която извежда средния брой на оръжия за всички кораби,
--пуснати на вода
select avg(numguns)
from CLASSES
where class in (select class from ships where launched is not null)

--Напишете заявка, която извежда за всеки клас първата и последната година, в
--която кораб от съответния клас е пуснат на вода
select class, min(launched) as minYear, max(launched) as maxYear
from ships
group by class

--• Напишете заявка, която извежда броя на корабите потънали в битка според класа
select class, count(*)
from ships 
where name in (select ship from OUTCOMES where RESULT = 'sunk')
group by class

--• Напишете заявка, която извежда броя на корабите потънали в битка според
--класа, за тези класове с повече от 4 пуснати на вода кораба
select class, count(*)
from ships 
where name in (select ship from OUTCOMES where RESULT = 'sunk') 
and 
class in (select class 
			from ships 
			group by class 
			having count(*) > 4)
group by class

--Напишете заявка, която извежда средното тегло на корабите, за всяка страна. 
select country, avg(bore)
from classes
group by country