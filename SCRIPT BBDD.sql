create database poo_bbdd_uoc;
USE poo_bbdd_uoc;


CREATE TABLE socio (
    idSocio INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    tipoSocio VARCHAR(50)
);

CREATE TABLE Seguro (
	idSeguro INT PRIMARY KEY AUTO_INCREMENT,
    seguroContratado VARCHAR(255),
    precio DOUBLE
);

INSERT INTO Seguro (idSeguro, seguroContratado, precio) VALUES (1, 'Básico', 10);
INSERT INTO Seguro (idSeguro, seguroContratado, precio) VALUES (2, 'Completo', 20);

CREATE TABLE Federacion (
    idFederacion INT PRIMARY KEY AUTO_INCREMENT,
    nombreFederacion VARCHAR(255)
);


CREATE TABLE Estandar (
    idSocio INT PRIMARY KEY,
    nif VARCHAR(9),
    seguroContratado INT,
    FOREIGN KEY (idSocio) REFERENCES Socio(idSocio),
    FOREIGN KEY (seguroContratado) REFERENCES Seguro(idSeguro)
);

CREATE TABLE Federado (
    idSocio INT PRIMARY KEY,
    nif VARCHAR(9),
    idFederacion INT,
    FOREIGN KEY (idSocio) REFERENCES Socio(idSocio),
    FOREIGN KEY (idFederacion) REFERENCES Federacion(idFederacion)
);

CREATE TABLE Infantil (
    idSocio INT PRIMARY KEY,
    idTutor INT NOT NULL,
    FOREIGN KEY (idSocio) REFERENCES Socio(idSocio),
    FOREIGN KEY (idTutor) REFERENCES Socio(idSocio),
    CONSTRAINT chk_id_tutor CHECK (idSocio <> idTutor)
);


CREATE TABLE Excursion (
    idExcursion INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255),
    fechaExcursion DATE,
    duracionDias INT,
    precioInscripcion DOUBLE
);

CREATE TABLE Inscripcion (
    idInscripcion INT AUTO_INCREMENT PRIMARY KEY,
    idSocio INT,
    idExcursion INT,
    fechaInscripcion DATE,
    FOREIGN KEY (idSocio) REFERENCES Socio(idSocio),
    FOREIGN KEY (idExcursion) REFERENCES Excursion(idExcursion)
);

DELIMITER $$

CREATE TRIGGER CheckValidTutorBeforeInsertOrUpdate
BEFORE INSERT ON Infantil
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Infantil WHERE idSocio = NEW.idTutor) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El idTutor seleccionado no puede ser un socio infantil.';
    END IF;
END$$

DELIMITER ;

