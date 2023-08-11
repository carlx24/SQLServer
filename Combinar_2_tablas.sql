--Combine Two Tables

--Input: 
--Person table:
--+----------+----------+-----------+
--| personId | lastName | firstName |
--+----------+----------+-----------+
--| 1        | Wang     | Allen     |
--| 2        | Alice    | Bob       |
--+----------+----------+-----------+
--Address table:
--+-----------+----------+---------------+------------+
--| addressId | personId | city          | state      |
--+-----------+----------+---------------+------------+
--| 1         | 2        | New York City | New York   |
--| 2         | 3        | Leetcode      | California |
--+-----------+----------+---------------+------------+
--Output: 
--+-----------+----------+---------------+----------+
--| firstName | lastName | city          | state    |
--+-----------+----------+---------------+----------+
--| Allen     | Wang     | Null          | Null     |
--| Bob       | Alice    | New York City | New York |
--+-----------+----------+---------------+----------+
--Explanation: 
--There is no address in the address table for the personId = 1 so we return null in their city and state.
--addressId = 1 contains information about the address of personId = 2.

--SQL Schema

--Create table If Not Exists Person (personId int, firstName varchar(255), lastName varchar(255))
--Create table If Not Exists Address (addressId int, personId int, city varchar(255), state varchar(255))
--Truncate table Person
--insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
--insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
--Truncate table Address
--insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
--insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

SELECT PE.Firstname , PE.lastname ,AD.[city] ,AD.[state]
  FROM [CONOCIMIENTO].[dbo].[Address] AD RIGHT  JOIN  [CONOCIMIENTO].[dbo].[Person] PE on AD.[personId] = PE.[personId]