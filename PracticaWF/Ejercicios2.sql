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

