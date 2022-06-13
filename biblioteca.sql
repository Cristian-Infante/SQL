CREATE TABLE Usuarios(DNI_usuario VARCHAR(10) NOT NULL, Nombre VARCHAR(25) NOT NULL, Apellido VARCHAR(25) NOT NULL, Domicilio VARCHAR(20) NOT NULL, PRIMARY KEY(DNI_usuario));
CREATE TABLE Libros(Titulo VARCHAR(50) NOT NULL, Idioma VARCHAR(10) NOT NULL, N_paginas INT NOT NULL, Cod_libro VARCHAR(15) NOT NULL, PRIMARY KEY (Cod_libro));
CREATE TABLE Autores(Nombre_autor VARCHAR(50) NOT NULL, Nacionalidad VARCHAR(20) NOT NULL, FechaNac_autor DATE NOT NULL, DNI_autor VARCHAR(10) NOT NULL, PRIMARY KEY (DNI_autor));

CREATE TABLE Ediciones(Año_ed DATE NOT NULL, ISBN VARCHAR(15) NOT NULL, Cod_libro VARCHAR(15) NOT NULL, PRIMARY KEY (ISBN), CONSTRAINT fk_Cod_libro FOREIGN KEY (Cod_libro) REFERENCES Libros(Cod_libro));
CREATE TABLE Copias(Numero_copia INT NOT NULL, Precio MONEY NOT NULL, ISBN VARCHAR(15) NOT NULL, PRIMARY KEY (Numero_copia), CONSTRAINT fk_ISBN FOREIGN KEY (ISBN) REFERENCES Ediciones(ISBN));

CREATE TABLE Escribe(DNI_autor VARCHAR(10) NOT NULL, Cod_libro VARCHAR(15) NOT NULL, PRIMARY KEY (DNI_autor, Cod_libro), CONSTRAINT fk_DNI_autor FOREIGN KEY (DNI_autor) REFERENCES Autores(DNI_autor), CONSTRAINT fk_Cod_libro FOREIGN KEY (Cod_libro) REFERENCES Libros(Cod_libro));
CREATE TABLE Prestamos(Fecha_prestamo DATE NOT NULL, Fecha_regreso DATE, Numero_copia INT NOT NULL, DNI_usuario VARCHAR(10) NOT NULL, PRIMARY KEY (Numero_copia, DNI_usuario), CONSTRAINT fk_Numero_copia FOREIGN KEY (Numero_copia) REFERENCES Copias(Numero_copia), CONSTRAINT fk_DNI_usuario FOREIGN KEY (DNI_usuario) REFERENCES Usuarios(DNI_usuario));
CREATE TABLE Referencia(Cod_libro_1 VARCHAR(15) NOT NULL, Ref_Cod_libro_2 VARCHAR(15) NOT NULL, PRIMARY KEY (Cod_libro_1, Ref_Cod_libro_2), CONSTRAINT fk_Cod_libro_1 FOREIGN KEY (Cod_libro_1) REFERENCES Libros(Cod_libro), CONSTRAINT fk_Cod_libro_2 FOREIGN KEY (Ref_Cod_libro_2) REFERENCES Libros(Cod_libro));
