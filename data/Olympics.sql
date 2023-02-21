SELECT * FROM Olympic_Athlete_Event_Results oaer 
SELECT * FROM Olympics_Games og 
SELECT * FROM Olympic_Athlete_Bio oab 
SELECT * FROM Olympics_Country oc 

--Who has won the most gold medals in your sport? 
SELECT *
FROM Olympic_Athlete_Event_Results oaer
WHERE event = 'Football, Men' -- AND medal = 'Gold' 






--number participating country in each Olympics Women Football
WITH womenfootball 
AS 
(
SELECT edition_id, country_noc, edition, sport, event 
FROM Olympic_Athlete_Event_Results oaer
WHERE event = 'Football, Women' 
order BY edition  
)
SELECT *, 
COUNT(DISTINCT country_noc) AS Num_country
FROM womenfootball
GROUP BY edition 
ORDER BY country_noc 


--number of participating country in each Olympics Men Football
WITH menfootball 
AS 
(
SELECT edition_id, country_noc, edition, sport, event 
FROM Olympic_Athlete_Event_Results oaer
WHERE event = 'Football, Men' 
order BY edition  
)
SELECT *, 
COUNT(DISTINCT country_noc) AS num_country
FROM menfootball
GROUP BY edition_id
ORDER BY country_noc 



--DISTINCT female athlete for each olympic games
WITH womenfootball 
AS 
(
SELECT edition_id, edition, sport, event, athlete_id 
FROM Olympic_Athlete_Event_Results oaer
WHERE event = 'Football, Women' 
order BY edition  
)
SELECT *, 
COUNT(DISTINCT athlete_id) AS Particapating_players_female
FROM womenfootball
GROUP BY edition 
ORDER BY athlete_id  


----DISTINCT male athlete for each olympic games
WITH menfootball 
AS 
(
SELECT edition_id, edition, sport, event, athlete_id 
FROM Olympic_Athlete_Event_Results oaer
WHERE event = 'Football, Men' 
order BY edition  
)
SELECT *, 
COUNT(DISTINCT athlete_id) AS Particapating_players_male
FROM menfootball
GROUP BY edition 
ORDER BY athlete_id  
