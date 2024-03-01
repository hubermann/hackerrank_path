# Country codes 
# Una empresa quiere contactar a cada uno de sus clientes con respecto a los cambios de política.
# Tienen clientes internacionales, pero su base de datos no incluye códigos de país con sus números de teléfono.
# Hay dos tablas en la base de datos: clientes y códigos de país. La primera tabla contiene detalles 
# de cada cliente, incluido customer_id, nombre y número de teléfono. y país. La segunda tabla contiene el 
# código de país para cada país."
# Escriba una consulta para recuperar una lista de todos los identificadores, nombres y números de teléfono 
# de los clientes, con sus códigos de país concatenados con sus números de teléfono. 
# Ordene la salida en el orden de su customer_id.
# Nota: El número de teléfono debe tener el siguiente formato: -CÓDIGO DE PAÍS NÚMERO DE TELÉFONO (sin espacios)

# -----------------------
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name STRING,
  phone_number STRING,
  country STRING,
  FOREIGN KEY (country) REFERENCES country_codes (country)
);

CREATE TABLE country_codes (
  country STRING PRIMARY KEY,
  country_code STRING
);

# -----------------------
SELECT
    cu.customer_id,
    cu.name,
    CONCAT('+', cc.country_code, cu.phone_number) as phone_number
FROM customers cu
JOIN country_codes cc ON cc.country = cu.country
ORDER BY cu.ccustomer_id; 


