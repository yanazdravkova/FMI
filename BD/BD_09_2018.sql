--Да се напише заявка, която извежда име на клас, годината на първата битка, в която кораб на този клас е участвал, 
--годината на последната битка, в която кораб на този клас е участвал, 
--и броя на всички различни битки, в които кораби на този клас са участвали, само за тези класове, започващи с буквата N. 
--Ако за даден клас няма кораб, който да е участвал в битка, за съответните години да се върне стойност null

use ships;

select min(year(date)) as minYear, max(year(date)) as maxYear, count(distinct battle)
from ships
left join OUTCOMES on ships.NAME = OUTCOMES.SHIP
left join BATTLES on BATTLES.NAME = BATTLE
where class like 'N%'
group by class


--Да се напише заявка, която да изведе имената на тези битки, за които броят на корабите от тип 'bb',
--участвали в тази битка, е по-голям от броя на корабите от тип 'bc', участвали в същата битка. 
--Битки, в които не е участвал нито един кораб, да не се извеждат в резултата.

select battle
from OUTCOMES 
join ships on OUTCOMES.ship = ships.name
left join classes bb on bb.CLASS = ships.CLASS and bb.type = 'bb'
left join classes bc on bc.CLASS = ships.CLASS and bc.type = 'bc'
group by battle
having count(bb.CLASS) > count (bc.CLASS) and count(bb.class) + count(bc.class) > 0