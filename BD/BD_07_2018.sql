--Да се напише заявка, която да изведе име на студио, годината на първия филм за това студио, 
--годината на последния филм за това студио 
--и броя на всички филми за това студио, само за тези студиа започващи с буквата ‘M’

use movies;

select studio.name, min(year), max(year), count(title)
from studio
join movie on studio.name = movie.STUDIONAME
where studio.name like 'M%'
group by studio.name
