-- заявката да изведе име на битките,в които е участвал един кораб

use ships;
select battle
from outcomes o1
group by battle
having count(ship) = 1

-- извежда име на класа и брой на потъналите в битка кораби за съответния клас, за тези класове с повече от 5 кораба
select class, count(distinct name)
from ships 
join outcomes on ships.name = OUTCOMES.SHIP
where result = 'sunk'
 and class in (select Classes.class from classes join ships on CLASSES.CLASS = SHIPS.CLASS group by classes.class having count(name) > 5)
 group by class
