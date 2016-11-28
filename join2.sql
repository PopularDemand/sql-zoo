
movie actor casting
id     id  movieid
title name  actorid
yr           ord
director
budget
gross



--------------------
1.

SELECT id, title
 FROM movie
 WHERE yr=1962

 --------------------------------------------
2.

SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane'

  --------------------------------------------
3.


SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'

  --------------------------------------------
4.


SELECT TITLE
from movie
WHERE id IN (11768, 11955, 21191)

  --------------------------------------------
5.


SELECT ID
from actor
WHERE name =  'Glenn Close'


  --------------------------------------------
6.


SELECT ID
from movie
WHERE title =  'Casablanca'


  --------------------------------------------
7.


SELECT name
from movie JOIN casting ON movieid = movie.id JOIN actor ON actor.id = actorid
WHERE movieid = 11768


  --------------------------------------------
8.


SELECT name
from movie JOIN casting ON movieid = movie.id JOIN actor ON actor.id = actorid
WHERE title = 'Alien'


  --------------------------------------------
9.


SELECT title
from movie JOIN casting ON movieid = movie.id JOIN actor ON actor.id = actorid
WHERE name = 'Harrison Ford'


  --------------------------------------------
10.

SELECT title
from movie JOIN casting ON movieid = movie.id JOIN actor ON actor.id = actorid
WHERE name = 'Harrison Ford' AND ord != 1


  --------------------------------------------
11.


SELECT title, name
from movie JOIN casting ON movieid = movie.id JOIN actor ON actor.id = actorid
WHERE yr = 1962 AND ord = 1


  --------------------------------------------
12.


SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 WHERE name='John Travolta'
 GROUP BY yr) AS t
)

  --------------------------------------------
13.


GO BACK TO!

  --------------------------------------------
14.


SELECT ID
from movie
WHERE title =  'Casablanca'








movie actor casting
id     id  movieid
title name  actorid
yr           ord
director
budget
gross


