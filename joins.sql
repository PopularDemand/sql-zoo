GAME
=====
 id   mdate     stadium                    team1  team2
1001  8 June 2012   National Stadium, Warsaw    POL   GRE
1002  8 June 2012   Stadion Miejski (Wroclaw)   RUS   CZE
1003 12 June 2012   Stadion Miejski (Wroclaw)   GRE   CZE
1004 12 June 2012   National Stadium, Warsaw    POL   RUS
...

GOAL
=====
matchid   teamid  player              gtime
1001       POL  Robert Lewandowski      17
1001       GRE  Dimitris Salpingidis    51
1002       RUS  Alan Dzagoev            15
1002       RUS  Roman Pavlyuchenko      82
...


ETEAM
=====
id    teamname            coach
POL   Poland           Franciszek Smuda
RUS   Russia           Dick Advocaat
CZE   Czech Republic  Michal Bilek
GRE   Greece           Fernando Santos
...

----------------------------

1

SELECT matchid, player FROM goal
  WHERE teamid = 'Ger'

----------------------------

----------------------------

2

SELECT DISTINCT id, stadium,team1,team2
  FROM goal JOIN game ON matchid = id
WHERE id = 1012


--------------------------------------------------------

3

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = "GER"


------------------------------------------------------------------------------------

4

SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'


-------------------------------------

5

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id
 WHERE gtime<=10

----------------------------
-------------------------------------

6
SELECT mdate, teamname
FROM game JOIN eteam ON (team1 = eteam.id)
WHERE eteam.coach = 'Fernando Santos'
----------------------------

7
SELECT player
FROM game JOIN goal ON game.id = goal.matchid
WHERE stadium = 'National Stadium, Warsaw'
----------------------------

8
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id
    WHERE (team1='GER' OR team2='GER') AND (goal.teamid != "GER")
----------------------------

9
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
  GROUP BY teamname
  ORDER BY teamname

----------------------------
10

SELECT stadium, COUNT(stadium)
  FROM goal JOIN game ON matchid = game.id
  GROUP BY stadium

----------------------------
11

SELECT matchid, mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

----------------------------
12

SELECT matchid, mdate, COUNT(gtime)
FROM game JOIN goal ON game.id = matchid
WHERE teamid = 'ger'
GROUP BY matchid, mdate

----------------------------
13

-- SELECT mdate,
--   team1,
--   SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
--   team2,
--   SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
--   FROM goal RIGHT JOIN game ON matchid = id
--   GROUP BY mdate, matchid, team1, team2
