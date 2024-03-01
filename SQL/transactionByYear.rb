

Veamos MYSQL

Tablas:

users [user_id, user_name]
transactions [transaction_id, user_id]

El fomato de transaction_id tiene 5 digitos, pero los dos primeros delimitan el año de la transaccion. Es decir, si empieza con 19
es de 2019, si omienza con 20 es de 2020 y si comienza con 2021, es del año 2021.

Necesito que la salida sea solo un parrafo con el nombre del usuario y la cantidad de transacciones por año

es decir, si el usuario gabriel hico en 2019 5 transacciones, en 2020 3 y en 2021 4

deberia ser la salida: "Gabriel 5 3 4"


SELECT 
    COUNT(CASE WHEN LEFT(t.transaction_id, 2) = '19' THEN 1 ELSE 0 END) AS Transactions2019_Gabriel
FROM Users u
LEFT JOIN Transactions t
ON u.user_id = t.user_id
WHERE u.username = 'Gabriel';




