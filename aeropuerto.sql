CREATE TABLE pasajeros(cc_pasajero VARCHAR(15) NOT NULL, nombre_pasajero VARCHAR(50) NOT NULL, PRIMARY KEY (cc_pasajero));
CREATE TABLE ciudades(cod_ciudad VARCHAR(15) NOT NULL, nombre_ciudad VARCHAR(50) NOT NULL, PRIMARY KEY (cod_ciudad));
CREATE TABLE aviones(horas_vuelo INT NOT NULL, cod_avion VARCHAR(15) NOT NULL, modelo VARCHAR(15) NOT NULL, capacidad INT NOT NULL, PRIMARY KEY (cod_avion));
CREATE TABLE tripulacion(cod_tripulante VARCHAR(15) NOT NULL, nombre_tripulante VARCHAR(50) NOT NULL, PRIMARY KEY (cod_tripulante));

CREATE TABLE aeropuertos(nombre_aeropuerto VARCHAR(50) NOT NULL, cod_aeropuerto VARCHAR(15) NOT NULL, cod_ciudad VARCHAR(15) NOT NULL, PRIMARY KEY (cod_aeropuerto), CONSTRAINT fk_cod_ciudad FOREIGN KEY (cod_ciudad) REFERENCES ciudades(cod_ciudad));

CREATE TABLE vuelos(cod_vuelo VARCHAR(15) NOT NULL, fecha_salida DATE NOT NULL, cod_ciudad VARCHAR(15) NOT NULL, cod_avion VARCHAR(15) NOT NULL, PRIMARY KEY (cod_vuelo), CONSTRAINT fk_cod_ciudad FOREIGN KEY (cod_ciudad) REFERENCES ciudades(cod_ciudad), CONSTRAINT fk_cod_avion FOREIGN KEY (cod_avion) REFERENCES aviones(cod_avion));
CREATE TABLE reserva(clase bool NOT NULL, cod_vuelo VARCHAR(15) NOT NULL, cc_pasajero VARCHAR(15) NOT NULL, PRIMARY KEY (cod_vuelo, cc_pasajero), CONSTRAINT fk_cod_vuelo FOREIGN KEY (cod_vuelo) REFERENCES vuelos(cod_vuelo), CONSTRAINT fk_cc_pasajero FOREIGN KEY (cc_pasajero) REFERENCES pasajeros(cc_pasajero));
CREATE TABLE tripula(cargo VARCHAR(20) NOT NULL, cod_vuelo VARCHAR(15) NOT NULL, cod_tripulante VARCHAR(15) NOT NULL, PRIMARY KEY (cod_vuelo, cod_tripulante), CONSTRAINT fk_cod_vuelo FOREIGN KEY (cod_vuelo) REFERENCES vuelos(cod_vuelo), CONSTRAINT fk_cod_tripulante FOREIGN KEY (cod_tripulante) REFERENCES tripulacion(cod_tripulante));
