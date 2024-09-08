USE FastFoodDB;

-- Optimización de la base de datos FastFood_DB

--Índice en la tabla Productos para la columna Nombre
CREATE INDEX IDX_Productos_Nombre ON Productos(Nombre);

--Índice en la Tabla Productos para la columna ProductoID
CREATE INDEX IDX_Productos_ProductoID ON Productos(ProductoID);


--Índice de la Tabla Categorias para la columna CategoriaID
CREATE INDEX IDX_Categorias_CategoriaID ON Categorias(CategoriaID);

--Índice de la Tabla Categorias para la columna Nombre
CREATE INDEX IDX_Categorias_Nombre ON Categorias(Nombre);

--Índice en la Tabla Clientes para la columna ClienteID
CREATE INDEX IDX_Clientes_ClienteID ON Clientes(ClienteID);

--Índice en la Tabla Empleados para la columna EmpleadoID
CREATE INDEX IDX_Empleados_EmpleadoID ON Empleados(EmpleadoID);

--Índice en la Tabla Ordenes para la columna OrdenID
CREATE INDEX IDX_Ordenes_OrdenID ON Ordenes(OrdenID);

--Índice en la Tabla Ordenes para la columna TotalCompra
CREATE INDEX IDX_Ordenes_TotalCompra ON Ordenes(TotalCompra);

--Índice en la tabla Sucursales para la columna Nombre
CREATE INDEX IDX_Sucursales_Nombre ON Sucursales(Nombre);

--Índice en la Tabla Sucursales para la columna SucursalID
CREATE INDEX IDX_Sucursales_SucursalID ON Sucursales(SucursalID);
