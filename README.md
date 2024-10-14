# Proyecto Final: Sistema de Gestión Hotelera

Este proyecto consiste en la implementación de un sistema de gestión hotelera utilizando SQL. A continuación, se describen los diferentes componentes del proyecto y su funcionalidad.

## Estructura del Proyecto

### 1. CONSULTAS.SQL

Este archivo contiene varias consultas SQL que permiten obtener información relevante del sistema. Algunas de las consultas incluidas son:

- Listar clientes con reservas futuras.
- Mostrar habitaciones disponibles con su información.
- Listar reservas que incluyen el servicio de "cena" junto con el cliente registrado.
- Listar servicios utilizados por los clientes y el total gastado en cada servicio por cliente.
- Mostrar habitaciones ocupadas, incluyendo información del cliente y el tipo de habitación.

### 2. PROYECTO_FINAL.SQL

Este archivo define la estructura de la base de datos del sistema de gestión hotelera. Incluye la creación de las siguientes tablas:

- **Cliente**: Información de los clientes.
- **Telefono**: Números de teléfono de los clientes.
- **TipoHabitacion**: Tipos de habitaciones disponibles.
- **Habitaciones**: Información de las habitaciones.
- **Pago**: Información de los pagos realizados.
- **Reserva**: Información de las reservas realizadas.
- **Departamento**: Departamentos del hotel.
- **Empleado**: Información de los empleados.
- **Servicio**: Servicios ofrecidos por el hotel.
- **Reserva_Servicio**: Relación entre reservas y servicios.

### 3. PROCEDIMIENTO.SQL

Este archivo contiene procedimientos almacenados que permiten realizar operaciones específicas en la base de datos. Un ejemplo es el procedimiento `InsertarReserva`, que permite insertar una nueva reserva en el sistema, calculando automáticamente el monto del pago asociado.

### 4. INSERTS_PROYECTO_FINAL.SQL

Este archivo contiene sentencias SQL para insertar datos iniciales en las tablas del sistema. Incluye datos de ejemplo para clientes, teléfonos, tipos de habitaciones, habitaciones, reservas, servicios, empleados y departamentos.

### 5. TRIGGER_PROYECTOFINAL.SQL

Este archivo define un trigger que se ejecuta después de insertar un registro en la tabla `Reserva_Servicio`. El trigger `trg_calcular_monto` calcula el monto total de una reserva (incluyendo el precio de la habitación y los servicios asociados) y actualiza la tabla `Pago` en consecuencia.

## Cómo Usar Este Proyecto

1. **Crear la Base de Datos**: Ejecutar el script `PROYECTO_FINAL.SQL` para crear la estructura de la base de datos.
2. **Ejecutar Procedimientos y Triggers**: Ejecutar los scripts `PROCEDIMIENTO.SQL` y `TRIGGER_PROYECTOFINAL.SQL` para habilitar los procedimientos almacenados y triggers.
3. **Insertar Datos Iniciales**: Ejecutar el script `INSERTS_PROYECTO_FINAL.SQL` para insertar datos de ejemplo.
4. **Realizar Consultas**: Utilizar el script `CONSULTAS.SQL` para obtener información relevante del sistema.
