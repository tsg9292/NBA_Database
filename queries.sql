#SELECT FORM WHERE
SELECT * FROM `Player` WHERE `College`=1000001;

#SELECT FORM WHERE ORDER BY
SELECT * FROM `Team` WHERE `Seasons`>=50 ORDER BY `Win Pct` DESC;

#SELECT FROM WHERE ORDER BY LIMIT
SELECT * FROM `Team` WHERE `Seasons`<=30 ORDER BY `Win Pct` DESC LIMIT 3;

#SELECT FROM WHERE with implied join
SELECT * FROM `Player`,`Player Career Stats` WHERE `Player`.`Player ID`=`Player Career Stats`.`Player ID`;

#SELECT FROM WHERE GROUP BY
SELECT * FROM `Player`,`Player Career Stats` WHERE `Player`.`Player ID`=`Player Career Stats`.`Player ID` GROUP BY `Player`.`Last Name`;

#SELECT FROM WHERE GROUP BY HAVING
SELECT *
FROM `Player`,`Player Career Stats`
WHERE `Player`.`Player ID`=`Player Career Stats`.`Player ID`
GROUP BY `Player Career Stats`.`Games Played` DESC
HAVING `Player Career Stats`.`Points` >=20000;

#SELECT FROM WHERE with two implied joins, MAX funciton, AVG function, two levels of parenthesis embedding
SELECT `First Name`, `Last Name`, `Team`, `Most points in a game`,  `Points`/`Games Played` AS `PPG`, `League Wide PPG`
FROM `Player Career Stats`, (
    SELECT `First Name`, `Last Name`, `Team`, `Points` AS `Most points in a game`, `Player`.`Player ID`
	FROM `Player`,( 
    	SELECT `Player ID`, `Points`
    	FROM `Player Game Stats`, ( 
        	SELECT MAX(Points) AS `maxpts` 
        	FROM `Player Game Stats`
        	) MaxPointsInGame 
    	WHERE `Player Game Stats`.`Points` = MaxPointsInGame.`maxpts` 
    	) CareerStats
	WHERE `Player`.`Player ID` = CareerStats.`Player ID`
    ) PersonStats, (
    SELECT AVG(`Points`) / AVG(`Games Played`) AS `League Wide PPG`
    FROM `Player Career Stats`
    ) LeagueStats
WHERE `Player Career Stats`.`Player ID` = PersonStats.`Player ID`

#SELECT FROM WHERE with a NOT operator and an IN operator (nested)
SELECT `First Name`, `Last Name`, `College`, `Games Played`, `Points`, `Assists`, `Rebounds`, `Steals`, `Blocks`, `Championships`
FROM `Player Career Stats`, (
    SELECT `Player ID`, `First Name`, `Last Name`, `Name` AS `College`
	FROM `Player`,`College`
	WHERE `Player`.`College` IN (`College`.`College ID`)
    AND NOT `College`.`Championships`=0
    )CollegePlayers
WHERE CollegePlayers.`Player ID` = `Player Career Stats`.`Player ID`

#OTHER QUERIES I'm interested in
SELECT `First Name`, `Last Name`, `PPG` FROM `Player`, (
    SELECT `Player ID`, `Points`/`Games Played` AS `PPG` FROM `Player Career Stats`
    ) PPG
WHERE PPG.`Player ID` = `Player`.`Player ID`

#UPDATE WHERE
UPDATE `Player Season Stats` 
SET `Games Played`=`Games Played`+1,`Points`=`Points`+24,`Assists`=`Assists`+4,`Rebounds`=`Rebounds`+7,`Steals`=`Steals`+1,`Blocks`=`Blocks`+1 
WHERE `Player ID` = 100003 AND `Year`=2015

#CREATE USER
CREATE USER 'TAYLOR'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'TAYLOR'@'%' IDENTIFIED BY 'password' WITH 
	GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT ALL PRIVILEGES ON `NBA Database`.* TO 'TAYLOR'@'%';

#DROP USER
DROP USER 'TAYLOR'

#START TRANSACTION ... and a ROLLBACK
SET AUTOCOMMIT=0;
START TRANSACTION;
INSERT INTO `NBA Database`.`Player` (`Player ID`, `First Name`, `Last Name`, `Age`, `Experience`, `Team`, `College`) VALUES (100009, 'Tristan', 'Thompson', '23', '3', 'CLE', 1000002);
ROLLBACK;
INSERT INTO `NBA Database`.`Player` (`Player ID`, `First Name`, `Last Name`, `Age`, `Experience`, `Team`, `College`) VALUES (100008, 'Tristan', 'Thompson', '23', '3', 'CLE', 1000002);
COMMIT;