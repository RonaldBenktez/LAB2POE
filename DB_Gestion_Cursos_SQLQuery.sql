-- Crear la base de datos
CREATE DATABASE gestion_cursos;
GO

USE gestion_cursos;
GO

-- Crear la tabla 'estudiantes'
CREATE TABLE estudiantes (
    id_estudiante INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(10) NOT NULL
);
GO

-- Crear la tabla 'cursos'
CREATE TABLE cursos (
    id_curso INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    duracion VARCHAR(15) NOT NULL, -- en horas
    fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL
);
GO

-- Crear la tabla 'estudiante_curso' para establecer la relación entre estudiantes y cursos
CREATE TABLE estudiante_curso (
    id_estudiante_curso  INT IDENTITY(1,1) PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON DELETE CASCADE
);
GO


--CRUD de la tabla estudiantes
INSERT INTO estudiantes (nombre, apellido, correo, telefono) 
VALUES ('Moises', 'Carranza', 'u20210127@gmail.com', '7296-6938');
GO

SELECT * FROM estudiantes;
GO

UPDATE estudiantes 
SET nombre='$nombre', apellido='$apellido', correo='$correo', telefono='$telefono'
WHERE id_estudiante= 1;
GO

DELETE FROM estudiantes WHERE id_estudiante= 1;
GO


--CRUD de la tabla cursos
INSERT INTO cursos (nombre, descripcion, duracion, fecha_inicio, fecha_fin) 
VALUES ('POE', 'POE', '6 Mes', '2024-02-01', '2024-07-01');
GO

SELECT * FROM cursos;
GO

UPDATE cursos 
SET nombre='$nombre_curso', descripcion='$descripcion', duracion='$duracion', fecha_inicio='$fecha_inicio', fecha_fin='$fecha_fin' 
WHERE id_curso= 1;
GO

DELETE FROM cursos WHERE id_curso= 1;
GO


--CRUD de la tabla estudiante_curso
INSERT INTO estudiante_curso (id_estudiante, id_curso, fecha_inscripcion) 
VALUES (1, 1, '2024-01-01');
GO

SELECT * FROM estudiante_curso;
GO

UPDATE estudiante_curso 
SET fecha_inscripcion='2024-02-01' 
WHERE id_estudiante_curso= 1;
GO

DELETE FROM estudiante_curso WHERE id_estudiante_curso= 1;
GO
