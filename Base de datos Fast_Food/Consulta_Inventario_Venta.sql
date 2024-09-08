USE FastFoodDB;

--Total de ventas globales. 
--Pregunta 1: ¿Cuál es el total de ventas (TotalCompra) a nivel global?
SELECT SUM(TotalCompra) AS VentasGoblales
FROM Ordenes;

--Promedio de precios de productos por categoría. 
--Pregunta 2: ¿Cuál es el precio promedio de los productos dentro de cada categoría?
SELECT CategoriaID, CAST(AVG(Precio) AS DECIMAL(10,2)) AS PromedioProductos
FROM Productos
GROUP BY CategoriaID;

--Orden mínima y máxima por sucursal. 
--Pregunta 3: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?
SELECT SucursalID,
	MIN(TotalCompra) AS OrdenMinima,
	MAX(TotalCompra) AS OrdenMaxima
FROM Ordenes
GROUP BY SucursalID;

--Mayor número de kilómetros recorridos para entrega.
--Pregunta 4: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?
SELECT MAX(KilometrosRecorrer) AS MayorViaje
FROM Ordenes;

--Promedio de cantidad de productos por orden
--Pregunta 5: ¿Cuál es la cantidad promedio de productos por orden?
SELECT OrdenID, AVG(Cantidad) AS CantidadPromedio
FROM DetalleOrdenes
GROUP BY OrdenID;

--Total de ventas por tipo de pago
--Pregunta 6: ¿Cuál es el total de ventas por cada tipo de pago?
SELECT TipoPagoID, SUM(TotalCompra) AS TotalVentas
FROM Ordenes
GROUP BY TipoPagoID;

--Sucursal con la venta promedio más alta
--Pregunta 7: ¿Cuál sucursal tiene la venta promedio más alta?
SELECT TOP 1 SucursalID, CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS PromedioVentas
FROM Ordenes
GROUP BY SucursalID
ORDER BY PromedioVentas DESC;

--Sucursal con la mayor cantidad de ventas por encima de un umbral
--Pregunta 8: ¿Cuáles son las sucursales que han generado ventas por orden por encima de $100, y cómo se comparan en términos del total de ventas?
SELECT SucursalID, 
	SUM(TotalCompra) AS TotalVentas,
	COUNT(OrdenID) AS NumeroOrdenes,
	CAST(SUM(TotalCompra) / COUNT(OrdenID) AS DECIMAL(10,2)) AS VentaXOrden
FROM Ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) > 100 
ORDER BY TotalVentas DESC;

--Comparación de ventas promedio antes y después de una fecha específica
--Pregunta 9: ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?
SELECT CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS PromedioVentasAntes
FROM Ordenes
WHERE FechaOrdenTomada < '2023-07-01'

SELECT CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS PromedioVentasDespues
FROM Ordenes
WHERE FechaEntrega > '2023-07-1'

--Análisis de actividad de ventas por horario
--Pregunta 10: ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, cuál es el valor promedio de estas ventas, y cuál ha sido la venta máxima alcanzada?
SELECT HorarioVenta,
	COUNT(*) AS CantidadVentas,
	CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS PromedioVentas,
	MAX(TotalCompra) AS VentaMaxima
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY CantidadVentas DESC;