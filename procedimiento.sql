DELIMITER //

CREATE PROCEDURE InsertarReserva(
    IN p_DNI_Cliente INT,
    IN p_IdHabitacion INT,
    IN p_Fecha_Reserva DATE,
    IN p_Fecha_Inicio DATE,
    IN p_Fecha_Fin DATE
)
BEGIN
    DECLARE v_IdPago INT;
    DECLARE v_Precio DECIMAL(10, 2);

    -- Obtener el precio de la habitación asociada
    SELECT th.Precio
    INTO v_Precio
    FROM Habitaciones h
             JOIN TipoHabitacion th ON h.IdTipoHabitacion = th.IdTipoHabitacion
    WHERE h.IdHabitacion = p_IdHabitacion;

    -- Insertar el pago con el monto obtenido
    INSERT INTO Pago (Monto, Fecha_Pago, Estado)
    VALUES (v_Precio, CURDATE(), 'Pendiente');

    -- Obtener el ID del último pago insertado
    SET v_IdPago = LAST_INSERT_ID();

    -- Insertar la reserva
    INSERT INTO Reserva (DNI_Cliente, IdHabitacion, IdPago, Fecha_Reserva, Fecha_Inicio, Fecha_Fin)
    VALUES (p_DNI_Cliente, p_IdHabitacion, v_IdPago, p_Fecha_Reserva, p_Fecha_Inicio, p_Fecha_Fin);
END //

DELIMITER ;

CALL InsertarReserva(1001, 1, '2024-10-10', '2024-10-15', '2024-10-20');

SELECT *
FROM reserva_servicio
JOIN reserva r on reserva_servicio.IdReserva = r.IdReserva
JOIN hotel_paraiso.servicio s on reserva_servicio.IdServicio = s.IdServicio
WHERE Descripcion = 'Cena';

SELECT *
FROM cliente
JOIN hotel_paraiso.telefono t on cliente.DNI = t.DNI_Cliente
WHERE Tipo = 'Movil';