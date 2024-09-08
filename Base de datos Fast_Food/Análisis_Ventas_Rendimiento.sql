USE FastFoodDB;

/*Listar todos los productos y sus categor�as
Pregunta 1: �C�mo puedo obtener una lista de todos los productos junto con sus categor�as?*/

SELECT 
	p.Nombre AS Producto, 
	c.Nombre AS Categoria
FROM Productos p
INNER JOIN Categorias c ON p.CategoriaID = c.CategoriaID;

/*Obtener empleados y su sucursal asignada
Pregunta 2: �C�mo puedo saber a qu� sucursal est� asignado cada empleado?*/

SELECT 
	e.Nombre AS Empleado, 
	s.Nombre AS Sucursal
FROM Empleados e
LEFT JOIN Sucursales s ON s.SucursalID = e.SucursalID;

/*Identificar productos sin categor�a asignada
Pregunta 3: �Existen productos que no tienen una categor�a asignada?*/

SELECT 
	p.Nombre AS Producto, 
	c.Nombre AS Categoria
FROM Categorias c
RIGHT JOIN Productos p ON p.CategoriaID = c.CategoriaID;

/*Detalle completo de �rdenes
Pregunta 4: �C�mo puedo obtener un detalle completo de las �rdenes, incluyendo cliente, empleado que tom� la orden, y el mensajero que la entreg�?*/

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
Pregunta 5: �Cu�ntos productos de cada tipo se han vendido en cada sucursal?*/

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