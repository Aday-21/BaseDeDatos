-- Active: 1777278272534@@127.0.0.1@3306@bancos
USE bancos;

-- Actividad 1
/*
Crear una función que devuelva la suma total del saldo de todas las cuentas. 

Requisitos:

No tiene ningún parámetro de entrada
Devolverá una valor numérico de tipo monetario (DECIMAL(10,2) 
*/
DELIMITER $$
DROP FUNCTION IF EXISTS suma_saldos $$
CREATE FUNCTION suma_saldos()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_saldo DECIMAL(10,2);
    
    SELECT SUM(saldo) INTO total_saldo
    FROM cuentas;
    
    RETURN total_saldo;
END $$
DELIMITER ;
-- Actividad 2
/*
Crear una función que devuelva el id del mejor cliente. Siendo el mejor cliente aquél al que pertenece la cuenta de mayor saldo.
*/
DELIMITER $$
DROP FUNCTION IF EXISTS mejor_cliente $$
CREATE FUNCTION mejor_cliente()
RETURNS INT UNSIGNED
DETERMINISTIC
BEGIN
    DECLARE cliente_id INT UNSIGNED;
    
    SELECT cliente_id INTO cliente_id
    FROM cuentas
    ORDER BY saldo DESC
    LIMIT 1;
    
    RETURN cliente_id;
END $$

DELIMITER ;
-- Actividad 3
/*
Se desea crear la función saldo_cuentas para la base de datos bancos, que me devuelva a partir de los movimientos (tabla movimientos)
de una cuenta el saldo actual de dicha cuenta. Se trata de una procedimiento de verificación puesto que en la tabla cuentas tengo la 
columna saldo.

Observaciones:

Esta función recibirá como parámetro de entrada id de la cuenta.
Devolverá como parámetro de salida el saldo total verificado de dicha cuenta.
*/
DELIMITER $$
DROP FUNCTION IF EXISTS saldo_cuentas $$
CREATE FUNCTION saldo_cuentas(p_cuenta_id INT UNSIGNED)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE saldo_total DECIMAL(10,2);
    
    SELECT SUM(CASE 
                    WHEN tipo_movimiento = 'ingreso' THEN cantidad 
                    ELSE -cantidad 
                END) INTO saldo_total
    FROM movimientos
    WHERE cuenta_id = p_cuenta_id;
    
    RETURN saldo_total;
END $$
DELIMITER ;

--  Actividad 4
/*
Crear un procedimiento para la base de datos Bancos llamado verificar_saldo, este procedimiento comprobará que la columna saldo 
e la tabla Cuentas, coincide con el valor que devuelve la función desarrollada en el apartado anterior saldo_cuenta(). En caso 
de que no coincida deberá mostrar todos los detalles (todas las columnas) de esta cuenta.

El procedimiento recibirá como parámetro de entrada id de la cuenta que se quiere verificar. 
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS verificar_saldo $$
CREATE PROCEDURE verificar_saldo(IN p_cuenta_id INT UNSIGNED)
BEGIN
    DECLARE saldo_verificado DECIMAL(10,2);
    DECLARE saldo_actual DECIMAL(10,2);
    
    -- Obtener el saldo verificado utilizando la función saldo_cuentas
    SET saldo_verificado = saldo_cuentas(p_cuenta_id);
    
    -- Obtener el saldo actual de la cuenta desde la tabla cuentas
    SELECT saldo INTO saldo_actual
    FROM cuentas
    WHERE id = p_cuenta_id;
    
    -- Comparar los saldos y mostrar detalles si no coinciden
    IF saldo_verificado != saldo_actual THEN
        SELECT *
        FROM cuentas
        WHERE id = p_cuenta_id;
    END IF;
END $$
DELIMITER ;

-- Actividad 5
/*
Idem que el anterior, pero en caso de no coincidencia de los saldos, 
actualizar a partir del saldo total obtenido a partir de los movimientos.
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS verificar_saldo_actualizar $$
CREATE PROCEDURE verificar_saldo_actualizar(IN p_cuenta_id INT UNSIGNED)
BEGIN
    DECLARE saldo_verificado DECIMAL(10,2);
    DECLARE saldo_actual DECIMAL(10,2);
    
    -- Obtener el saldo verificado utilizando la función saldo_cuentas
    SET saldo_verificado = saldo_cuentas(p_cuenta_id);
    
    -- Obtener el saldo actual de la cuenta desde la tabla cuentas
    SELECT saldo INTO saldo_actual
    FROM cuentas
    WHERE id = p_cuenta_id;
    
    -- Comparar los saldos y actualizar si no coinciden
    IF saldo_verificado != saldo_actual THEN
        UPDATE cuentas
        SET saldo = saldo_verificado
        WHERE id = p_cuenta_id;
    END IF;
END $$
DELIMITER ;