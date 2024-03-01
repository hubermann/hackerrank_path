
# Profitable stocks

# Una acción se considera rentable si el precio previsto es estrictamente mayor que el precio actual.
# Escriba una consulta para encontrar los códigos de acciones de todas las acciones que son rentables según esta definición. Ordene la salida en orden ascendente.
# Hay dos tablas en la base de datos: price_today y price_tommorrow. Sus claves principales son stock_code

# --------------------------

CREATE TABLE price_today (
  stock_code STRING PRIMARY KEY,
  price INT
);

CREATE TABLE price_tomorrow (
  stock_code STRING PRIMARY KEY,
  price INT
);

# --------------------------

SELECT stock_code
FROM price_today pt 
JOIN price_tommorrow pto on pto.stock_code = pt.stock_code
WHERE pto.price > pt.price
ORDER BY pt.stock_code ASC;

