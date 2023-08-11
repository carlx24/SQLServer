

-- consulta compleja en la cual dene traer los valores: producto , color m precio unitario, subcategoria y modelo

use AdventureWorks2014

---- TABLAS

SELECT PP.ProductID, PP.Name, PP.Color FROM Production.Product PP;

SELECT SD.UnitPrice  FROM Sales.SalesOrderDetail SD;

SELECT PS.ProductSubcategoryID, PS.Name FROM Production.ProductSubcategory PS;

SELECT PM.ProductModelID,PM.Name FROM [Production].[ProductModel] PM;

---- PRIMERA FORMA

SELECT  PP.ProductID,  PP.Name as [Producto], PP.Color , SD.UnitPrice as [Precio Unitario], PS.Name as [Subcatergoria] , PM.Name as [Modelo]
		FROM	(SELECT ProductID,ProductSubcategoryID, ProductModelID, Name, Color FROM [Production].[Product] )PP , 
		        (SELECT ProductModelID,Name FROM [Production].[ProductModel] ) PM,
				(SELECT UnitPrice, ProductID  FROM [Sales].[SalesOrderDetail]) SD , 
				(SELECT ProductSubcategoryID, Name  FROM [Production].[ProductSubcategory]) PS
		WHERE PP.ProductID = SD.ProductID AND PP.ProductSubcategoryID = PS.ProductSubcategoryID AND PM.ProductModelID = PP.ProductModelID ;

---- SEGUNDA FORMA

SELECT PP.ProductID,  PP.Name as [Producto], PP.Color , SD.UnitPrice as [Precio Unitario], PS.Name as [Subcatergoria] , PM.Name as [Modelo]
	FROM	   [Production].[Product] PP
	INNER JOIN [Production].[ProductModel] PM ON PP.ProductModelID= PM.ProductModelID
	INNER JOIN [Sales].[SalesOrderDetail] SD ON SD.ProductID=PP.ProductID  
	INNER JOIN [Production].[ProductSubcategory] PS ON PS.ProductSubcategoryID = PP.ProductSubcategoryID