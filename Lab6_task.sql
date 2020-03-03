Quesiton Number 1 


Select EMP_FNAME ,EMP_LNAME 
from 
EMPLOYEE  NATURAL join  HOURS 
GROUP by EMP_FNAME ,EMP_LNAME 
HAVING SUM(HOURS_RATE ) > 
(select AVG(HOURS_RATE) from HOURS
WHERE  DATE_WORKED LIKE "%2007-05%")

+-----------+------------+
| EMP_FNAME | EMP_LNAME  |
+-----------+------------+
| Arif      | Arshad     |
| Emma      | Calderdale |
| Enrica    | Denver     |
| Mirrelle  | Namowa     |
+-----------+------------+





Quesiton nUMBER 2:

select PARK_CODE, PARK_NAME
FROM THEMEPARK NATURAL join TICKET
GROUP BY PARK_NAME ,PARK_CODE
HAVING SUM(TICKET_PRICE) > (Select AVG(TICKET_PRICE) FROM TICKET)

+-----------+---------------+
| PARK_CODE | PARK_NAME     |
+-----------+---------------+
| SP4533    | AdventurePort |
| FR1001    | FairyLand     |
| ZA1342    | GoldTown      |
| UK3452    | PleasureLand  |
+-----------+---------------+


Quesiton Number_4

SELECT  DISTINCT PARK_NAME
 FROM SALES NATURAL JOIN SALES_LINE NATURAL JOIN THEMEPARK 
 WHERE SALES.TRANSACTION_NO= SALES_LINE.TRANSACTION_NO;

 +--------------+
| PARK_NAME    |
+--------------+
| FairyLand    |
| PleasureLand |
| GoldTown     |
+--------------+

mysql> SELECT PARK_CODE ,PARK_NAME
    -> FROM THEMEPARK
    -> WHERE EXISTS ( SELECT PARK_CODE FROM SALES
    -> WHERE SALES.PARK_CODE != THEMEPARK.PARK_CODE);
+-----------+--------------+
| PARK_CODE | PARK_NAME    |
+-----------+--------------+
| FR1001    | FairyLand    |
| UK3452    | PleasureLand |
| ZA1342    | GoldTown     |
+-----------+--------------+



Quesiton nUMBER_05
SELECT PARK_CODE ,PARK_NAME
FROM THEMEPARK
WHERE EXISTS ( SELECT PARK_CODE FROM SALES
WHERE SALES.PARK_CODE != THEMEPARK.PARK_CODE)

mysql> SELECT PARK_CODE ,PARK_NAME
    -> FROM THEMEPARK
    -> WHERE EXISTS ( SELECT PARK_CODE FROM SALES
    -> WHERE SALES.PARK_CODE != THEMEPARK.PARK_CODE);
+-----------+---------------+
| PARK_CODE | PARK_NAME     |
+-----------+---------------+
| FR1001    | FairyLand     |
| NL1202    | Efling        |
| SP4533    | AdventurePort |
| SW2323    | Labyrinthe    |
| UK2622    | MiniLand      |
| UK3452    | PleasureLand  |
| ZA1342    | GoldTown      |
+-----------+---------------+
7 rows in set (0.00 sec)


Quesiton NUMBER_3

mysql>  SELECT DISTINCT EMP_FNAME,EMP_LNAME,DATE_WORKED,(SELECT AVG(HOURS_PER_ATTRACT) FROM HOURS)
    ->  

    AS AVERAGE
    ->         ,
    ->  (SELECT AVG(HOURS_PER_ATTRACT) FROM HOURS)- (SELECT SUM(HOURS_PER_ATTRACT) FROM HOURS) AS DIFFERENCE
    ->   FROM EMPLOYEE
    ->   NATURAL JOIN HOURS;
+-----------+------------+-------------+---------+------------+
| EMP_FNAME | EMP_LNAME  | DATE_WORKED | AVERAGE | DIFFERENCE |
+-----------+------------+-------------+---------+------------+
| Emma      | Calderdale | 2007-05-18  |  4.9091 |   -49.0909 |
| Emma      | Calderdale | 2007-05-20  |  4.9091 |   -49.0909 |
| Marshel   | Ricardo    | 2007-05-18  |  4.9091 |   -49.0909 |
| Arif      | Arshad     | 2007-05-23  |  4.9091 |   -49.0909 |
| Arif      | Arshad     | 2007-05-21  |  4.9091 |   -49.0909 |
| Arif      | Arshad     | 2007-05-22  |  4.9091 |   -49.0909 |
| Enrica    | Denver     | 2007-05-21  |  4.9091 |   -49.0909 |
| Enrica    | Denver     | 2007-05-22  |  4.9091 |   -49.0909 |
| Mirrelle  | Namowa     | 2007-05-18  |  4.9091 |   -49.0909 |
| Mirrelle  | Namowa     | 2007-05-19  |  4.9091 |   -49.0909 |
+-----------+------------+-------------+---------+------------+
10 rows in set (0.00 sec)