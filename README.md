# 📊 Fast_Food 🚀

Bienvenido al proyecto de análisis de datos para evaluar la eficiencia de los mensajeros, la productividad de los empleados y las tendencias de ventas en nuestra empresa. Este README proporciona una visión general de la creación y carga de datos en la base de datos, así como un resumen de los análisis y recomendaciones estratégicas.

## 🛠️ Creación y Carga de Datos

### 🏗️ Creación de la Base de Datos

1. **Diseño del Esquema de la Base de Datos:**
   - Se diseñó un esquema de base de datos que incluye las siguientes tablas:
     - **Ordenes**: Información sobre las órdenes realizadas.
     - **Clientes**: Datos de los clientes que realizan las órdenes.
     - **Empleados**: Información de los empleados gestionando las órdenes.
     - **Mensajeros**: Datos de los mensajeros encargados de las entregas.
     - **Productos**: Información sobre los productos disponibles para venta.
     - **DetalleOrdenes**: Detalles específicos de cada orden, como productos y cantidades.
     - **OrigenesOrden**: Información sobre el canal de venta de cada orden.

2. **Estructura de Tablas y Relaciones:**
   - Se establecieron relaciones entre las tablas mediante claves primarias y foráneas para garantizar la integridad de los datos.
   - Se asignaron tipos de datos adecuados a cada columna para optimizar el rendimiento y asegurar la coherencia (e.g., Decimal para ventas, DateTime para fechas).

3. **Carga de Datos:**
   - Se cargaron datos iniciales en las tablas utilizando datos ficticios empleando INSERT.
   - Se aseguraron datos para las pruebas de análisis, incluyendo órdenes, clientes, empleados, productos, y detalles de órdenes.

## 📊 Consultas Finales

1. **Eficiencia de los Mensajeros 🚚:**
   - Se analizó el tiempo promedio de entrega para evaluar la eficiencia de los mensajeros.

2. **Análisis de Ventas por Origen de Orden 💵:**
   - Se identificó el canal de ventas que genera más ingresos.

3. **Productividad de los Empleados 🏆:**
   - Se determinó el empleado con el mayor volumen de ventas promedio.

4. **Análisis de Demanda por Horario y Día 📅:**
   - Se evaluó la demanda de productos según el horario y el día.

5. **Comparación de Ventas Mensuales 📈:**
   - Se compararon las ventas mensuales para identificar tendencias y patrones.

6. **Análisis de Fidelidad del Cliente 💖:**
   - Se analizó la cantidad de órdenes realizadas por cada cliente para evaluar la fidelidad.

## 🗒️ Hallazgos Clave

- **Resumen de Ventas 💰:**
  - Total de ventas a nivel global.
  - Tipos de pago más utilizados.
  - Promedio de ventas antes y después de una fecha clave.

- **Análisis de Productos 🍕:**
  - Precio promedio por categoría de producto.
  - Cantidad promedio de productos por orden.

- **Desempeño de Sucursales 🏢:**
  - Sucursal con promedio de ventas más alta.
  - Comparación de orden mínima y máxima entre sucursales.
  - Sucursales con ventas por orden superiores a un umbral específico.

- **Tendencias Temporales ⏰:**
  - Horarios de mayor cantidad de ventas.
  - Productos más demandados por la mañana.

- **Fidelidad del Cliente 📊:**
  - Todos los clientes realizaron solo un pedido hasta la fecha.

- **Productividad de los Empleados 👩‍💼:**
  - Empleado más productivo y menos productivo.

## 📝 Recomendaciones Estratégicas

1. **Eficiencia de los Mensajeros 🚚:**
   - Crear consultas adicionales para evaluar el tiempo de entrega por sucursal y ajustar el personal según sea necesario.

2. **Productividad de los Empleados 💼:**
   - Filtrar por departamento o rol específico en futuras consultas para enfocarse en el análisis de ventas.

3. **Comparación de Ventas Mensuales 📈:**
   - Ingresar datos más recientes para una comparación efectiva entre años.

4. **Análisis de Fidelidad del Cliente 💖:**
   - Recolectar más datos sobre clientes para obtener una visión más completa de la fidelidad.

## 🔧 Optimización y Sostenibilidad

1. **Normalización de Datos 🗂️:**
   - Se implementó una estructura de base de datos normalizada para evitar redundancias y asegurar la integridad de los datos.

2. **Relaciones Establecidas 🔗:**
   - Se establecieron claves primarias y foráneas para mantener la coherencia de los datos entre tablas.

## 🚧 Desafíos y Soluciones

- **Problemas con Restricciones de FK 🚫:**
  - **Desafío:** No se permitió la eliminación de productos debido a restricciones por claves foráneas.
  - **Solución:** Desactivar y reactivar las restricciones de claves foráneas temporalmente según sea necesario.

## 🎓 Extra!: Análisis Regional y Optimización de Consultas

### 📍 Incorporación de Localidades en la Tabla de Sucursales

Para mejorar el análisis de patrones regionales, se añadió una nueva columna llamada **"Localidad"** a la tabla **Sucursales**. Esto permitió segmentar las ventas por ubicación específica y responder a consultas detalladas sobre las tendencias regionales.

1. **Añadir columna "Localidad" a la tabla Sucursales:**

   Se creó una columna adicional en la tabla para registrar la localidad de cada sucursal.

2. **Ingreso de localidades a cada sucursal:**

   Se asignaron las localidades correspondientes a cada sucursal para permitir un análisis más detallado de las ventas por región.

### 📈 Análisis de Productos Más Vendidos por Localidad

Con la columna **"Localidad"** añadida, se realizó una consulta para identificar los 3 productos más vendidos en cada localidad. Además, se creó un procedimiento almacenado para facilitar consultas específicas por localidad.

1. **Consulta para los 3 productos más vendidos por localidad:**

   Se generó un informe para listar los productos más vendidos en una localidad específica.

2. **Creación del Procedimiento Almacenado:**

   Se desarrolló un procedimiento almacenado que permite consultar los productos más vendidos en una localidad específica, facilitando el análisis de ventas regionales.

### 🗓️ Análisis de Ventas por Estación

Para comprender las variaciones estacionales en las ventas, se realizó un análisis del total de ventas por estación del año.

1. **Consulta para el total de ventas por cada estación:**

   Se realizó un análisis para determinar el total de ventas en cada estación del año, clasificando las ventas por verano, otoño, invierno y primavera.

2. **Creación de Vista para el Producto Más Vendido por Estación:**

   Se creó una vista para identificar el producto más vendido en cada estación del año, lo que permite una visión más clara de las tendencias estacionales en las ventas.

### ⚙️ Optimización de Consultas

Para mejorar la velocidad de ejecución de ciertas consultas, se implementaron índices en las tablas clave.

1. **Índices Implementados:**

   Se añadieron índices en varias tablas para optimizar las consultas y mejorar el rendimiento general de la base de datos.

Estos pasos adicionales permitieron un análisis más detallado y rápido de los datos, mejorando la comprensión de las tendencias regionales y estacionales, así como optimizando el rendimiento de las consultas.

## 👤 Autor

[Agustin Rolon](https://github.com/AgustinRolon)

---

# 💛 Agradecimiento Especial

[![Henry](https://github.com/user-attachments/assets/00eeb5c8-4dcf-4124-ac29-d4ba7b113e6f)](https://www.soyhenry.com)  
[Henry](https://www.soyhenry.com)
