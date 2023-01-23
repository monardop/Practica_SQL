use proyecto_integrador;
-- Etapa 1.2
ALTER TABLE facturas CHANGE ClienteID IDCliente int(10);
ALTER TABLE facturas CHANGE ArticuloID IDArticulo int(10);
ALTER TABLE facturas MODIFY Monto double UNSIGNED;
alter table articulos change ArticuloID IDArticulo int;
alter table articulos modify Nombre varchar(75);
alter table articulos modify Precio double unsigned not null ;
alter table articulos modify Stock int unsigned not null;
alter table clientes change ClienteID IDCliente int;
alter table clientes modify Nombre varchar(30) not null;
alter table clientes modify Apellido varchar(30) not null;
alter table clientes change Comentarios Observaciones varchar(255);
-- Final etapa 1.2
insert into facturas values
	('A', 28,14,335,2021-03-18,1589.50),
	('A', 39,26,157,'2021-04-12',979.75),
	('B', 8, 17, 95, '2021-04-25', 513.35),
    ('B', 12, 5, 411, '2021-05-03', 2385.70),
    ('B', 19, 50, 200, '2021-05-26',979.75);
select * from facturas;
