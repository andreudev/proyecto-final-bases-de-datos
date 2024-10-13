-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (DNI, Nombre, Apellido, Direccion)
VALUES (1001, 'Juan', 'Perez', 'Calle 123'),
       (1002, 'Maria', 'Lopez', 'Avenida 456'),
       (1003, 'Carlos', 'Sanchez', 'Calle 789'),
       (1004, 'Lucia', 'Gomez', 'Boulevard 100'),
       (1005, 'Pedro', 'Martinez', 'Calle 200'),
       (1006, 'Sofia', 'Rodriguez', 'Avenida 300'),
       (1007, 'Luis', 'Ramirez', 'Calle 400'),
       (1008, 'Ana', 'Fernandez', 'Calle 500'),
       (1009, 'Miguel', 'Torres', 'Boulevard 600'),
       (1010, 'Laura', 'Vargas', 'Avenida 700');

-- Insertar datos en la tabla Telefono
INSERT INTO Telefono (IdTelefono, DNI_Cliente, Numero, Tipo)
VALUES (1, 1001, '1234567890', 'Movil'),
       (2, 1002, '0987654321', 'Casa'),
       (3, 1003, '1234509876', 'Trabajo'),
       (4, 1004, '5678901234', 'Movil'),
       (5, 1005, '6789012345', 'Casa'),
       (6, 1006, '7890123456', 'Movil'),
       (7, 1007, '8901234567', 'Trabajo'),
       (8, 1008, '9012345678', 'Movil'),
       (9, 1009, '0123456789', 'Casa'),
       (10, 1010, '1234098765', 'Trabajo');

-- Insertar datos en la tabla TipoHabitacion
INSERT INTO TipoHabitacion (IdTipoHabitacion, Nombre, Capacidad, Descripcion, Precio)
VALUES (1, 'Simple', 1, 'Habitación para una persona', 50.00),
       (2, 'Doble', 2, 'Habitación para dos personas', 80.00),
       (3, 'Triple', 3, 'Habitación para tres personas', 100.00),
       (4, 'Suite', 2, 'Habitación de lujo para dos personas', 150.00),
       (5, 'Familiar', 4, 'Habitación para una familia', 120.00),
       (6, 'Deluxe', 2, 'Habitación deluxe', 200.00),
       (7, 'Economica', 1, 'Habitación económica para una persona', 40.00),
       (8, 'Doble Deluxe', 2, 'Habitación doble con extras', 180.00),
       (9, 'Penthouse', 4, 'Habitación en el último piso', 300.00),
       (10, 'Suite Presidencial', 2, 'Suite de lujo', 400.00);

-- Insertar datos en la tabla Habitaciones
INSERT INTO Habitaciones (IdHabitacion, IdTipoHabitacion, Estado_Habitacion)
VALUES (1, 1, TRUE),
       (2, 2, TRUE),
       (3, 3, FALSE),
       (4, 4, TRUE),
       (5, 5, TRUE),
       (6, 6, FALSE),
       (7, 7, TRUE),
       (8, 8, FALSE),
       (9, 9, TRUE),
       (10, 10, FALSE);


-- Insertar datos en la tabla Reserva
INSERT INTO Reserva (IdReserva, DNI_Cliente, IdHabitacion, Fecha_Reserva, Fecha_Inicio, Fecha_Fin)
VALUES (1, 1001, 1, '2024-01-05', '2024-01-10', '2024-01-12'),
       (2, 1002, 2,  '2024-02-10', '2024-02-15', '2024-02-20'),
       (3, 1003, 3,  '2024-03-15', '2024-03-20', '2024-03-25'),
       (4, 1004, 4,  '2024-04-20', '2024-04-25', '2024-04-30'),
       (5, 1005, 5, '2024-05-25', '2024-05-30', '2024-06-05'),
       (6, 1006, 6, '2024-06-01', '2024-06-05', '2024-06-10'),
       (7, 1007, 7, '2024-07-05', '2024-07-10', '2024-07-15'),
       (8, 1008, 8, '2024-08-10', '2024-08-15', '2024-08-20'),
       (9, 1009, 9, '2024-09-15', '2024-09-20', '2024-09-25'),
       (10, 1010, 10, '2024-10-10', '2024-10-25', '2024-10-30');

-- Insertar datos en la tabla Servicio
INSERT INTO Servicio (IdServicio, Descripcion, Precio)
VALUES (1, 'Desayuno', 15.00),
       (2, 'Almuerzo', 25.00),
       (3, 'Cena', 30.00),
       (4, 'Lavandería', 10.00),
       (5, 'Spa', 50.00),
       (6, 'Transporte', 20.00),
       (7, 'WiFi', 5.00),
       (8, 'Aseo habitación', 35.00),
       (9, 'Gimnasio', 20.00),
       (10, 'Piscina', 40.00);

-- Insertar datos en la tabla Reserva_Servicio
INSERT INTO Reserva_Servicio (IdReserva, IdServicio)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (3, 4),
       (4, 5),
       (5, 6),
       (6, 7),
       (7, 8),
       (8, 9),
       (9, 10);

-- Insertar datos en la tabla Departamento
INSERT INTO Departamento (IdDepartamento, Nombre)
VALUES (1, 'Recepción'),
       (2, 'Mantenimiento'),
       (3, 'Limpieza'),
       (4, 'Cocina'),
       (5, 'Gerencia'),
       (6, 'Seguridad'),
       (7, 'Spa'),
       (8, 'Gimnasio'),
       (9, 'Servicio a la habitación'),
       (10, 'Administración');

-- Insertar datos en la tabla Empleado
INSERT INTO Empleado (IdEmpleado, IdDepartamento, DNI, Nombre, Apellido)
VALUES (1, 1, 101, 'Juan', 'Perez'),
       (2, 2, 102, 'Carlos', 'Sanchez'),
       (3, 3, 103, 'Lucia', 'Martinez'),
       (4, 4, 104, 'Ana', 'Gomez'),
       (5, 5, 105, 'Pedro', 'Lopez'),
       (6, 6, 106, 'Sofia', 'Ramirez'),
       (7, 7, 107, 'Luis', 'Gomez'),
       (8, 8, 108, 'Miguel', 'Fernandez'),
       (9, 9, 109, 'Laura', 'Rodriguez'),
       (10, 10, 110, 'Jorge', 'Torres');
