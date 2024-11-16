USE PracticaWF
GO


SELECT id_pedido, id_cliente, monto,
    AVG(monto) OVER (
        ORDER BY monto DESC
    )AS Promedio_monto_cliente,
    RANK() OVER (
        ORDER BY monto
    ) AS Posicion
FROM tablaswf.Pedidos;
GO

/* 
Encontrar a los tres principales clientes (por monto total de pedidos) de cada país, mostrando 
su nombre, país y el monto total de sus pedidos 
*/

SELECT cl.nombre, cl.pais,
    SUM(pd.monto) OVER (
        PARTITION BY cl.pais
        ORDER BY pd.monto
    ) AS monto_total_pedidos,
    RANK() OVER (
        PARTITION BY cl.pais
        ORDER BY pd.monto
    ) AS ranking
FROM tablaswf.Pedidos pd
JOIN tablaswf.Clientes cl 
    ON cl.id_cliente = pd.id_cliente 

/*
Calcular la diferencia de monto entre un pedido y el siguiente pedido realizado por el mismo 
cliente, ordenado por fecha de pedido. Muestra el ID del pedido, el ID del cliente, la fecha del 
pedido y la diferencia de monto.
*/

SELECT id_pedido, id_cliente, fecha_pedido, monto,
    monto - LAG(monto) OVER (
        PARTITION BY id_cliente
        ORDER BY fecha_pedido
    ) AS diferencia_monto
FROM tablaswf.Pedidos

