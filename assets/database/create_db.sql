-- SQLite does not support multiple databases; skip database creation

-- Create tables without schema qualification (SQLite does not support schemas)
CREATE TABLE cliente (
    codcli CHAR(4) PRIMARY KEY,
    nombre VARCHAR(20),
    apellido VARCHAR(40),
    direccion VARCHAR(50),
    mail VARCHAR(100)
);

CREATE TABLE coche (
    matricula CHAR(7) PRIMARY KEY,
    modelo VARCHAR(40),
    combustible CHAR(1),
    motor CHAR(1),
    plazas INTEGER,
    maletas INTEGER,
    foto VARCHAR(15),
    codgama CHAR(2) NOT NULL,
    coste NUMERIC,
    FOREIGN KEY (codgama) REFERENCES gama(codgama)
);

CREATE TABLE gama (
    codgama CHAR(2) PRIMARY KEY,
    nomgama VARCHAR(20),
    stock INTEGER
);

CREATE TABLE reserva (
    codreserva INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha_res DATE NOT NULL,
    f_inicio DATE,
    f_fin DATE,
    dias INTEGER,
    lugar VARCHAR(50),
    importe NUMERIC,
    gama VARCHAR(2) NOT NULL,
    codcliente CHAR(4) NOT NULL,
    coche CHAR(7),
    f_recogida DATE,
    f_devolucion DATE,
    FOREIGN KEY (gama) REFERENCES gama(codgama),
    FOREIGN KEY (codcliente) REFERENCES cliente(codcli),
    FOREIGN KEY (coche) REFERENCES coche(matricula)
);

-- Data inserts
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES ('1   ', 'Pepe', 'García', 'Ausiach March, 23', 'pep@gmailx.com');
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES ('2   ', 'Lucas', 'Iniesta', 'Ausiach March, 23', 'lui@gmailx.com');
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES ('3   ', 'Ana', 'Lorca Sanz', 'Ausiach March, 23', 'annta@gmailx.com');

INSERT INTO coche (matricula, modelo, combustible, motor, plazas, maletas, foto, codgama, coste) VALUES
('1111AAA', 'Volvo z', 'F', 'A', 5, 3, 'foto1.jpg', 'B1', 20),
('1112AAA', 'Volvo EX40', 'E', 'A', 5, 3, 'foto2.jpg', 'B1', 25),
('1001BBB', 'Ford Focus', 'H', 'A', 5, 3, 'foto4.jpg', 'B1', 25),
('1003TTT', 'Citroen e-c3', 'E', 'A', 7, 4, 'foto5.jpg', 'T1', 30),
('3003LLL', 'Mercedes', 'E', 'A', 7, 4, 'foto6.jpg', 'L1', 40),
('3333BBB', 'Volvo XC90', 'E', 'A', 7, 4, 'foto7.jpg', 'L1', 50),
('1113AAA', 'Audi A3', 'H', 'M', 5, 4, 'foto3.jpg', 'B1', 30),
('6666NNN', 'Fiesta', 'F', 'M', 5, 3, 'foto8.jpg', 'F1', 25),
('6612NNN', 'Audi A3', 'F', 'M', 5, 3, 'foto9.jpg', 'F1', 25),
('4444NNN', 'Volvo XC1', 'H', 'A', 5, 4, 'foto10.jpg', 'F1', 25);

INSERT INTO gama (codgama, nomgama, stock) VALUES
('B1', 'Berlingo', 4),
('L1', 'Lujo', 2),
('T1', '4 x 4', 1),
('F1', 'Familiar', 3);

INSERT INTO reserva (codreserva, fecha_res, f_inicio, f_fin, dias, lugar, importe, gama, codcliente, coche, f_recogida, f_devolucion) VALUES
(1, '2024-10-25', '2023-03-05', '2023-03-07', 2, 'direc. oficina 1', 120, 'T1', '1', NULL, NULL, NULL);

-- SQLite doesn't support SEQUENCES, so codreserva uses AUTOINCREMENT instead
