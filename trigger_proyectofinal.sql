DELIMITER //

CREATE TRIGGER trg_calcular_monto
    AFTER INSERT
    ON Reserva_Servicio
    FOR EACH ROW
BEGIN
    DECLARE total_habitacion DECIMAL(10, 2);
    DECLARE total_servicios DECIMAL(10, 2);
    DECLARE monto_total DECIMAL(10, 2);

    SET total_habitacion = 0.00;
    SET total_servicios = 0.00;
    SET monto_total = 0.00;

    -- Obtener el precio de la habitación asociada a la reserva
    SELECT th.Precio
    INTO total_habitacion
    FROM Reserva r
             JOIN Habitaciones h ON r.IdHabitacion = h.IdHabitacion
             JOIN TipoHabitacion th ON h.IdTipoHabitacion = th.IdTipoHabitacion
    WHERE r.IdReserva = NEW.IdReserva;

    -- Calcular el total de los servicios asociados a la reserva
    SELECT SUM(s.Precio)
    INTO total_servicios
    FROM Reserva_Servicio rs
             JOIN Servicio s ON rs.IdServicio = s.IdServicio
    WHERE rs.IdReserva = NEW.IdReserva;

    -- Calcular el monto total (habitación + servicios)
    SET monto_total = total_habitacion + total_servicios;

    IF (SELECT IdPago FROM Reserva reserva WHERE reserva.IdReserva = NEW.IdReserva) IS NULL THEN
        -- Insertar un nuevo pago
        INSERT INTO Pago (Monto, Fecha_Pago, Estado)
        VALUES (monto_total, CURDATE(), 'Pendiente');
        -- Actualizar el IdPago en la tabla Reserva
        UPDATE Reserva
        SET IdPago = (SELECT MAX(IdPago) FROM Pago)
        WHERE IdReserva = NEW.IdReserva;
    ELSE
        -- Actualizar el monto en la tabla Pago
        UPDATE Pago
        SET Monto = monto_total
        WHERE IdPago = (SELECT IdPago FROM Reserva WHERE IdReserva = NEW.IdReserva);
    END IF;
END //

DELIMITER ;

