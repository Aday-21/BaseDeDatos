-- Active: 1777278272534@@127.0.0.1@3306@bancos
-- practica_81_13
-- Aday Trandafir Garcia
-- curso 25/26

USE bancos;

-- ACTIVIDAD 1 Procedimiento clientes_ciudad

DELIMITER $$

DROP PROCEDURE IF EXISTS clientes_ciudad $$
CREATE PROCEDURE clientes_ciudad(IN p_ciudad VARCHAR(20))
BEGIN
    SELECT *
    FROM clientes
    WHERE ciudad = p_ciudad;
END $$

DELIMITER ;

-- ACTIVIDAD 2 Procedimiento movimientos_cuentas

DELIMITER $$

DROP PROCEDURE IF EXISTS movimientos_cuentas $$
CREATE PROCEDURE movimientos_cuentas(IN p_cuenta_id INT UNSIGNED)
BEGIN
    SELECT *
    FROM movimientos
    WHERE cuenta_id = p_cuenta_id;
END $$

DELIMITER ;

-- ACTIVIDAD 3 Procedimiento clientes_cuentas

DELIMITER $$

DROP PROCEDURE IF EXISTS clientes_cuentas $$
CREATE PROCEDURE clientes_cuentas(IN p_cliente_id INT UNSIGNED)
BEGIN
    SELECT *
    FROM cuentas
    WHERE cliente_id = p_cliente_id;
END $$

DELIMITER ;


-- 4 Procedimiento SaldosBajos

DELIMITER $$

DROP PROCEDURE IF EXISTS SaldosBajos $$
CREATE PROCEDURE SaldosBajos()
BEGIN
    SELECT
        cuentas.id AS id_cuenta,
        cuentas.iban,
        clientes.nombre,
        clientes.apellidos,
        clientes.dni,
        cuentas.saldo
    FROM cuentas
    INNER JOIN clientes
        ON cuentas.cliente_id = clientes.id
    WHERE cuentas.saldo <= 200;
END $$

DELIMITER ;

-- 5 Saldo total por cliente

DROP PROCEDURE IF EXISTS total_cliente $$
CREATE PROCEDURE bancos.total_cliente()
BEGIN 
    SELECT cl.id, cl.nombre, cl.apellido, cl.dni, cl.ciudad, SUM(cu.salldo) AS saldo_total
    FROM clientes cl JOIN cuentas cu ON cl.id = cu.clientes_id 
    GROUP BY cl.id;
END $$

DELIMITER ;

-- llamadas a las funciones

CALL clientes_ciudad('Ubrique');

CALL movimientos_cuentas(1);

CALL clientes_cuentas(2);

CALL SaldosBajos();

CALL total_cliente();