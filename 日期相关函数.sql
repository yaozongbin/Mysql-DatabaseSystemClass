-- 日期时间相关函数

-- CURRENT_DATE() 当前日期
SELECT CURRENT_DATE() FROM DUAL;

-- CURRENT_TIME 当前时间
SELECT CURRENT_TIME() FROM DUAL;

-- CURRENT_TIMESTAMP 当前时间戳
SELECT CURRENT_TIMESTAMP() FROM DUAL;

CREATE TABLE mes(
	id INT,
	content VARCHAR(30),
	send_time DATETIME);
)

INSERT INTO mes 
VALUES
(1,'广西新闻',CURRENT_TIMESTAMP());

INSERT INTO mes 
VALUES
(2,'广东新闻',NOW());


INSERT INTO mes 
VALUES
(3,'湖南新闻',NOW());

SELECT * FROM mes;

-- 操作
-- 显示所有新闻，发布日期只显示日期，不用显示时间
SELECT id AS 序号,content AS 新闻,DATE(send_time) AS 日期
FROM mes;

-- 请查询在10分钟内发布的新闻
SELECT * 
FROM mes 
WHERE DATE_ADD(send_time,INTERVAL 10 MINUTE) >= NOW()

SELECT * 
FROM mes 
WHERE send_time >=DATE_SUB(NOW(),INTERVAL 10 MINUTE)

-- 请在mysql的sql语句中求出2011-11-11和1990-1-1相差多少天？
SELECT DATEDIFF('2011-11-11','1990-01-01')FROM DUAL;
SELECT DATEDIFF('2011-11-11','1990-01-01')/365 FROM DUAL;

-- 请在mysql的sql语句求出你活了多少天？2001-8-28
SELECT DATEDIFF(NOW(),'2001-08-28') FROM DUAL;
 
-- 如果能活80岁，求出还能活多少天？
SELECT DATEDIFF(DATE_ADD('2001-08-28',INTERVAL 80 YEAR),NOW())FROM DUAL;

-- YEAR|Month|DAY|DATE (datatime)
SELECT YEAR(NOW()) FROM DUAL;
SELECT MONTH(NOW()) FROM DUAL;
SELECT DAY(NOW()) FROM DUAL;
SELECT MONTH('2013-11-10')FROM DUAL;

-- (unix_timestamp) 返回值是1970-1-1 到现在的秒数
SELECT UNIX_TIMESTAMP()/(24*3600*365) FROM DUAL;

-- FROM_UNIXTIME() 可以把unix_timestamp
SELECT FROM_UNIXTIME(1618483484,'%Y-%m-%d')FROM DUAL;
SELECT FROM_UNIXTIME(1618483484,'%Y-%m-%d %H:%i:%s')FROM DUAL;
