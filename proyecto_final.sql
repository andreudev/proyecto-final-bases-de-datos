CREATE DATABASE IF NOT EXISTS hotel_paraiso;
USE hotel_paraiso;


CREATE TABLE Cliente
(
    DNI       INT PRIMARY KEY ,
    Nombre    VARCHAR(50) NOT NULL,
    Apellido  VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100)
);

CREATE TABLE Telefono
(
    IdTelefono  INT PRIMARY KEY AUTO_INCREMENT,
    DNI_Cliente INT         NOT NULL,
    Numero      VARCHAR(15) NOT NULL,
    Tipo        VARCHAR(10),
    FOREIGN KEY (DNI_Cliente) REFERENCES Cliente (DNI)
);

CREATE TABLE TipoHabitacion
(
    IdTipoHabitacion INT PRIMARY KEY,
    Nombre           VARCHAR(30)    NOT NULL,
    Capacidad        INT            NOT NULL,
    Descripcion      VARCHAR(200)   NOT NULL,
    Precio           DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Habitaciones
(
    IdHabitacion      INT PRIMARY KEY,
    IdTipoHabitacion  INT NOT NULL,
    Estado_Habitacion BOOLEAN,
    FOREIGN KEY (IdTipoHabitacion) REFERENCES TipoHabitacion (IdTipoHabitacion)
);

CREATE TABLE Pago
(
    IdPago      INT PRIMARY KEY AUTO_INCREMENT,
    Monto       DECIMAL(10, 2) DEFAULT 0.00,
    Fecha_Pago  DATE,
    Estado VARCHAR(20) DEFAULT 'Pendiente'
);


CREATE TABLE Reserva
(
    IdReserva     INT PRIMARY KEY AUTO_INCREMENT,
    DNI_Cliente   INT  NOT NULL,
    IdHabitacion  INT  NOT NULL,
    IdPago        INT,
    Fecha_Reserva DATE NOT NULL,
    Fecha_Inicio  DATE NOT NULL,
    Fecha_Fin     DATE NOT NULL,
    FOREIGN KEY (DNI_Cliente) REFERENCES Cliente (DNI),
    FOREIGN KEY (IdHabitacion) REFERENCES Habitaciones (IdHabitacion),
    FOREIGN KEY (IdPago) REFERENCES Pago (IdPago)
);

CREATE TABLE Departamento
(
    IdDepartamento INT PRIMARY KEY AUTO_INCREMENT,
    Nombre         VARCHAR(30)NOT NULL
);


CREATE TABLE Empleado
(
    IdEmpleado     INT PRIMARY KEY AUTO_INCREMENT,
    IdDepartamento INT,
    DNI            INT NOT NULL,
    Nombre         VARCHAR(50) NOT NULL,
    Apellido       VARCHAR(50) NOT NULL,
    FOREIGN KEY (IdDepartamento) REFERENCES Departamento (IdDepartamento)
);

CREATE TABLE Servicio
(
    IdServicio  INT PRIMARY KEY AUTO_INCREMENT,
    IdEmpleado  INT,
    Descripcion VARCHAR(20),
    Precio      DECIMAL(10, 2),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado (IdEmpleado)
);

CREATE TABLE Reserva_Servicio
(
    IdReserva  INT NOT NULL,
    IdServicio INT NOT NULL,
    PRIMARY KEY (IdReserva, IdServicio),
    FOREIGN KEY (IdReserva) REFERENCES Reserva (IdReserva),
    FOREIGN KEY (IdServicio) REFERENCES Servicio (IdServicio)
);