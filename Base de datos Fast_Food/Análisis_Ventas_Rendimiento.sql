USE FastFoodDB;

/*Listar todos los productos y sus categorías
Pregunta 1: ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?*/

SELECT 
	p.Nombre AS Producto, 
	c.Nombre AS Categoria
FROM Productos p
INNER JOIN Categorias c ON p.CategoriaID = c.CategoriaID;

/*Obtener empleados y su sucursal asignada
Pregunta 2: ¿Cómo puedo saber a qué sucursal está asignado cada empleado?*/

SELECT 
	e.Nombre AS Empleado, 
	s.Nombre AS Sucursal
FROM Empleados e
LEFT JOIN Sucursales s ON s.SucursalID = e.SucursalID;

/*Identificar productos sin categoría asignada
Pregunta 3: ¿Existen productos que no tienen una categoría asignada?*/

SELECT 
	p.Nombre AS Producto, 
	c.Nombre AS Categoria
FROM Categorias c
RIGHT JOIN Productos p ON p.CategoriaID = c.CategoriaID;

/*Detalle completo de órdenes
Pregunta 4: ¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo cliente, empleado que tomó la orden, y el mensajero que la entregó?*/

SELECT 
	c.Nombre AS Cliente, 
	e.Nombre AS Empleado,
	m.Nombre AS Mensajero,
	o.OrdenID,
	o.TotalCompra
FROM Ordenes o
INNER JOIN Clientes c ON o.ClienteID = c.ClienteID
INNER JOIN Empleados e ON o.EmpleadoID = e.EmpleadoID
LEFT JOIN Mensajeros m ON o.MensajeroID = m.MensajeroID;


/*Productos vendidos por sucursal
Pregunta 5: ¿Cuántos productos de cada tipo se han vendido en cada sucursal?*/

SELECT 
	s.Nombre AS Sucursal,
	c.Nombre AS Categoria,
	SUM(do.Cantidad) AS CantidadVendida
FROM Ordenes o
INNER JOIN Sucursales s ON o.SucursalID = s.SucursalID
INNER JOIN DetalleOrdenes do ON o.OrdenID = do.OrdenID
INNER JOIN Productos p ON do.ProductoID = p.ProductoID
INNER JOIN Categorias c ON p.CategoriaID = c.CategoriaID
GROUP BY s.Nombre, c.Nombre;

SELECT 
	s.Nombre AS Sucursal,
	p.Nombre AS Producto,
	SUM(do.Cantidad) AS CantidadVendida
FROM Ordenes o
INNER JOIN Sucursales s ON o.SucursalID = s.SucursalID6
INNER JOIN DetalleOrdenes do ON o.OrdenID = do.OrdenID
INNER JOIN Productos p ON do.ProductoID = p.ProductoID
GROUP BY s.Nombre, p.Nombre;