USE FastFoodDB;

--Total de ventas globales. 
--Pregunta 1: �Cu�l es el total de ventas (TotalCompra) a nivel global?
SELECT SUM(TotalCompra) AS VentasGoblales
FROM Ordenes;

--Promedio de precios de productos por categor�a. 
--Pregunta 2: �Cu�l es el precio promedio de los productos dentro de cada categor�a?
SELECT CategoriaID, CAST(AVG(Precio) AS DECIMAL(10,2)) AS PromedioProductos
FROM Productos
GROUP BY CategoriaID;

--Orden m�nima y m�xima por sucursal. 
--Pregunta 3: �Cu�l es el valor de la orden m�nima y m�xima por cada sucursal?
SELECT SucursalID,
	MIN(TotalCompra) AS OrdenMinima,
	MAX(TotalCompra) AS OrdenMaxima
FROM Ordenes
GROUP BY SucursalID;

--Mayor n�mero de kil�metros recorridos para entrega.
--Pregunta 4: �Cu�l es el mayor n�mero de kil�metros recorridos para una entrega?
SELECT MAX(KilometrosRecorrer) AS MayorViaje
FROM Ordenes;

--Promedio de cantidad de productos por orden
--Pregunta 5: �Cu�l es la cantidad promedio de productos por orden?
SELECT OrdenID, AVG(Cantidad) AS CantidadPromedio
FROM DetalleOrdenes
GROUP BY OrdenID;

--Total de ventas por tipo de pago
--Pregunta 6: �Cu�l es el total de ventas por cada tipo de pago?
SELECT TipoPagoID, SUM(TotalCompra) AS TotalVentas
FROM Ordenes
GROUP BY TipoPagoID;

--Sucursal con la venta promedio m�s alta
--Pregunta 7: �Cu�l sucursal tiene la venta promedio m�s alta?
SELECT TOP 1 SucursalID, CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS PromedioVentas
FROM Ordenes
GROUP BY SucursalID
ORDER BY PromedioVentas DESC;

--Sucursal con la mayor cantidad de ventas por encima de un umbral
--Pregunta 8: �Cu�les son las sucursales que han generado ventas por orden por encima de $100, y c�mo se comparan en t�rminos del total de ventas?
SELECT SucursalID, 
	SUM(TotalCompra) AS TotalVentas,
	COUNT(OrdenID) AS NumeroOrdenes,
	CAST(SUM(TotalCompra) / COUNT(OrdenID) AS DECIMAL(10,2)) AS VentaXOrden
FROM Ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) > 100 
ORDER BY TotalVentas DESC;

--Comparaci�n de ventas promedio antes y despu�s de una fecha espec�fica
--Pregunta 9: �C�mo se comparan las ventas promedio antes y despu�s del 1 de julio de 2023?
SELECT CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS PromedioVentasAntes
FROM Ordenes
WHERE FechaOrdenTomada < '2023-07-01'

SELECT CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS PromedioVentasDespues
FROM Ordenes
WHERE FechaEntrega > '2023-07-1'

--An�lisis de actividad de ventas por horario
--Pregunta 10: �Durante qu� horario del d�a (ma�ana, tarde, noche) se registra la mayor cantidad de ventas, cu�l es el valor promedio de estas ventas, y cu�l ha sido la venta m�xima alcanzada?
SELECT HorarioVenta,
	COUNT(*) AS CantidadVentas,
	CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS PromedioVentas,
	MAX(TotalCompra) AS VentaMaxima
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY CantidadVentas DESC;