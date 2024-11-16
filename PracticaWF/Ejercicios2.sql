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