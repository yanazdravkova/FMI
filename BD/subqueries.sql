USE movies;

-- Напишете заявка, която извежда имената на актрисите, които са също и
-- продуценти с нетна стойност по-голяма от 10 милиона.

  (SELECT NAME
   FROM MOVIESTAR
   WHERE GENDER = 'F') INTERSECT
  (SELECT NAME
   FROM MOVIEEXEC
   WHERE NETWORTH > 10000000)-- Напишете заявка, която извежда имената на тези актьори (мъже и жени), които
-- не са продуценти.

SELECT NAME
FROM MOVIESTAR
WHERE NAME NOT IN
    (SELECT NAME
     FROM MOVIEEXEC)-- Напишете заявка, която извежда имената на продуцентите и имената на
-- продукциите за които стойността им е по-голяма от продукциите на продуценти
-- ‘Merv Griffin’

  SELECT *
  FROM MOVIEEXEC -- join MOVIE on MOVIEEXEC.CERT# = MOVIE.PRODUCERC#
WHERE NETWORTH > ALL
    (SELECT NETWORTH
     FROM MOVIEEXEC
     WHERE NAME = 'Merv Griffin') USE pc;

--Напишете заявка, която извежда производителите на персонални компютри с
--честота поне 500.

SELECT DISTINCT maker
FROM product
WHERE Model IN
    (SELECT model
     FROM pc
     WHERE speed >= 500)--Напишете заявка, която извежда принтерите с най-висока цена.

  SELECT *
  FROM printer WHERE price >= ALL
    (SELECT price
     FROM printer)--Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от
--честотата на който и да е персонален компютър.

  SELECT *
  FROM laptop WHERE laptop.speed < ALL
    (SELECT speed
     FROM pc)--Напишете заявка, която извежда модела на продукта (PC, лап топ или принтер) с
--най-висока цена.

  SELECT DISTINCT model
  FROM
    (SELECT model,
            price
     FROM laptop
     UNION ALL SELECT model,
                      price
     FROM pc
     UNION ALL SELECT model,
                      price
     FROM printer) AllProducts WHERE price >= ALL
    (SELECT price
     FROM pc
     UNION ALL SELECT price
     FROM laptop
     UNION ALL SELECT price
     FROM printer);

-- Напишете заявка, която извежда производителя на цветния принтер с най-ниска цена.

SELECT DISTINCT maker
FROM product
WHERE model IN
    (SELECT model
     FROM printer
     WHERE color='y'
       AND price <= ALL
         (SELECT price
          FROM printer
          WHERE color='y'))-- Напишете заявка, която извежда производителите на тези персонални компютри
-- с най-малко RAM памет, които имат най-бързи процесори.

  SELECT maker
  FROM product WHERE model IN
    (SELECT model
     FROM pc
     WHERE ram <= ALL
         (SELECT ram
          FROM pc) )
  AND model IN
    (SELECT model
     FROM pc
     WHERE speed >= ALL
         (SELECT speed
          FROM pc
          WHERE ram <= ALL
              (SELECT ram
               FROM pc))) USE ships;

-- Напишете заявка, която извежда страните, чиито кораби са с най-голям брой оръжия.

SELECT DISTINCT country
FROM classes
WHERE NUMGUNS >= ALL
    (SELECT NUMGUNS
     FROM classes)--Напишете заявка, която извежда класовете, за които поне един от корабите им е
--потънал в битка.

  SELECT *
  FROM ships WHERE name IN
    (SELECT name
     FROM outcomes
     WHERE RESULT = 'sunk')-- Напишете заявка, която извежда имената на корабите с 16 инчови оръдия (bore).

  SELECT name
  FROM ships WHERE CLASS IN
    (SELECT CLASS
     FROM classes
     WHERE bore = 16)-- Напишете заявка, която извежда имената на битките, в които са участвали
-- кораби от клас ‘Kongo’.

  SELECT name
  FROM battles -- по-лесно решение - може директно от outcomes без да минаваме през battles
WHERE name IN
    (SELECT name
     FROM battles
     JOIN outcomes ON battles.NAME = OUTCOMES.battle
     AND ship IN
       (SELECT name
        FROM ships
        WHERE CLASS = 'Kongo'))-- Напишете заявка, която извежда иманата на корабите,
-- чиито брой оръдия е найголям в сравнение с корабите със същия калибър оръдия (bore).

  SELECT name
  FROM ships s1
  JOIN classes c1 ON s1.CLASS = c1.CLASS WHERE NUMGUNS >= ALL
    (SELECT NUMGUNS
     FROM classes c2
     WHERE c1.BORE = c2.BORE)