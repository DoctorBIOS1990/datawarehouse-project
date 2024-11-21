--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      Doctor BIOS
-- Project :      Proyecto ALMACEN.DM1
-- Author :       Doctor BIOS
--
-- Date Created : Tuesday, September 24, 2024 19:10:00
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: dim_cliente 
--

CREATE TABLE dim_cliente(
    id_cliente    INT             NOT NULL,
    nombre        VARCHAR(100),
    apellido      VARCHAR(100)    NOT NULL,
    email         VARCHAR(100),
    PRIMARY KEY (id_cliente)
)ENGINE=INNODB
;



-- 
-- TABLE: dim_mercado 
--

CREATE TABLE dim_mercado(
    id_mercado    INT             NOT NULL,
    nombre        VARCHAR(100),
    direccion     VARCHAR(100),
    municipio     VARCHAR(100),
    provincia     VARCHAR(100),
    PRIMARY KEY (id_mercado)
)ENGINE=INNODB
;



-- 
-- TABLE: dim_producto 
--

CREATE TABLE dim_producto(
    id_producto    INT             NOT NULL,
    categoria      VARCHAR(100),
    nombre         VARCHAR(100),
    descripcion    VARCHAR(100),
    unid_en_kg     VARCHAR(100),
    PRIMARY KEY (id_producto)
)ENGINE=INNODB
;



-- 
-- TABLE: dim_tiempo 
--

CREATE TABLE dim_tiempo(
    id_tiempo    INT            NOT NULL,
    dia          VARCHAR(10),
    mes          VARCHAR(10),
    annio        VARCHAR(10),
    PRIMARY KEY (id_tiempo)
)ENGINE=INNODB
;



-- 
-- TABLE: Hechos_venta 
--

CREATE TABLE Hechos_venta(
    id_venta       INT            NOT NULL,
    id_producto    INT            NOT NULL,
    id_tiempo      INT            NOT NULL,
    id_cliente     INT            NOT NULL,
    id_mercado     INT            NOT NULL,
    precio         FLOAT(8, 0),
    cantidad       FLOAT(8, 0),
    monto          FLOAT(8, 0),
    tendencia      FLOAT(8, 0),
    PRIMARY KEY (id_venta, id_producto, id_tiempo, id_cliente, id_mercado)
)ENGINE=INNODB
;



-- 
-- INDEX: Ref11 
--

CREATE INDEX Ref11 ON Hechos_venta(id_producto)
;
-- 
-- INDEX: Ref22 
--

CREATE INDEX Ref22 ON Hechos_venta(id_tiempo)
;
-- 
-- INDEX: Ref53 
--

CREATE INDEX Ref53 ON Hechos_venta(id_cliente)
;
-- 
-- INDEX: Ref74 
--

CREATE INDEX Ref74 ON Hechos_venta(id_mercado)
;
-- 
-- TABLE: Hechos_venta 
--

ALTER TABLE Hechos_venta ADD CONSTRAINT Refdim_producto1 
    FOREIGN KEY (id_producto)
    REFERENCES dim_producto(id_producto)
;

ALTER TABLE Hechos_venta ADD CONSTRAINT Refdim_tiempo2 
    FOREIGN KEY (id_tiempo)
    REFERENCES dim_tiempo(id_tiempo)
;

ALTER TABLE Hechos_venta ADD CONSTRAINT Refdim_cliente3 
    FOREIGN KEY (id_cliente)
    REFERENCES dim_cliente(id_cliente)
;

ALTER TABLE Hechos_venta ADD CONSTRAINT Refdim_mercado4 
    FOREIGN KEY (id_mercado)
    REFERENCES dim_mercado(id_mercado)
;


