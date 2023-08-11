

--Encuentra todos los números que aparecen al menos tres veces consecutivas.
--Devuelve la tabla de resultados en cualquier orden .
--El formato del resultado está en el siguiente ejemplo.
 

--Input: 
--Logs table:
--+----+-----+
--| id | num |
--+----+-----+
--| 1  | 1   |
--| 2  | 1   |
--| 3  | 1   |
--| 4  | 2   |
--| 5  | 1   |
--| 6  | 2   |
--| 7  | 2   |
--+----+-----+
--Output: 
--+-----------------+
--| ConsecutiveNums |
--+-----------------+
--| 1               |
--+-----------------+
--Explicación: 1 es el único número que aparece consecutivamente al menos tres veces.

 with cte as (select
	*,
	LEAD(num) OVER(ORDER BY (SELECT NULL)) nextvalues,
	LEAD(num,2) OVER(ORDER BY (SELECT NULL)) nextvalues2
from	
	Logs
)
,cte2 as (select
	distinct iif(num = nextvalues and nextvalues = nextvalues2 and num = nextvalues2,num,null) result 
from
	cte
)
select
	result ConsecutiveNums
from	
	cte2 
where
	result is not null

-------------------

select num  as 'ConsecutiveNums'
from Logs 
group by num
Having (count(num)) > 3
