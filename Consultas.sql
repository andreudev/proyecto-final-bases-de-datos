#Enlistar los clientes que tengan reservas futuras.
SELECT CONCAT(c.Nombre,c.Apellido) AS Nombre_Cliente,r.Fecha_inicio AS Inicio_Reserva
FROM Cliente c
JOIN Reserva r ON c.DNI = r.DNI_Cliente
WHERE r.Fecha_inicio > CURDATE();

#Habitaciones disponibles con su informacion.
SELECT tp.Nombre,tp.Capacidad,tp.Descripcion,tp.Precio,h.Estado_Habitacion
FROM Habitaciones h
JOIN TipoHabitacion tp ON h.IdTipoHabitacion = tp.IdTipoHabitacion
WHERE h.Estado_Habitacion = TRUE;

#Listar las reservas que contengan el servicio "cena" junto con el cliente registrado
SELECT CONCAT(c.Nombre,c.Apellido) AS Nombre_Cliente,r.idReserva,s.Descripcion
FROM Cliente c
JOIN Reserva r ON c.DNI = r.DNI_Cliente
JOIN Reserva_Servicio rs ON r.IdReserva = rs.IdReserva
JOIN Servicio s ON rs.idServicio = s.idServicio
WHERE Descripcion = 'Cena';

#Listar los servicios que han sido utilizados por los clientes, incluyendo en total gastado en cada servicio por cliente.
SELECT CONCAT(c.Nombre,c.Apellido) AS Nombre_Cliente,SUM(s.Precio) AS Precio_total_Servicio
FROM Cliente c
JOIN Reserva r ON c.DNI = r.DNI_Cliente
JOIN Reserva_Servicio rs ON r.IdReserva = rs.IdReserva
JOIN Servicio s ON rs.IdServicio = s.IdServicio
GROUP BY Nombre_Cliente;

#Mostrar todas las habitaciones ocupadas, incluyendo informacion del cliente que las reservo y el tipo de habitacion.
SELECT h.Estado_Habitacion,c.*,th.Nombre
FROM Cliente c
JOIN Reserva r ON c.DNI = r.DNI_Cliente
JOIN Habitaciones h ON r.IdHabitacion = h.IdHabitacion
JOIN TipoHabitacion th ON h.IdTipoHabitacion = th.IdTipoHabitacion
WHERE h.Estado_habitacion = FALSE;