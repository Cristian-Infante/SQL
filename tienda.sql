CREATE TABLE clientes(cod_cli VARCHAR(15) NOT NULL, nomb_cli VARCHAR(50) NOT NULL, dir_cli VARCHAR(20) NOT NULL, telefono VARCHAR(10) NOT NULL, PRIMARY KEY (cod_cli));
CREATE TABLE proveedores(cod_prov VARCHAR(15) NOT NULL, nom_prov VARCHAR(50) NOT NULL, dir_prov VARCHAR(20) NOT NULL, telefono VARCHAR(10) NOT NULL, PRIMARY KEY (cod_prov));
CREATE TABLE categorias(cod_cat VARCHAR(15) NOT NULL, nom_cat VARCHAR(50) NOT NULL, PRIMARY KEY (cod_cat));

CREATE TABLE Factura( cod_fact VARCHAR(15) NOT NULL, fecha DATE NOT NULL, cod_cli VARCHAR(15) NOT NULL, PRIMARY KEY (cod_fact), CONSTRAINT fk_cod_cli FOREIGN KEY (cod_cli) REFERENCES clientes(cod_cli));
CREATE TABLE productos(cod_prod VARCHAR(15) NOT NULL, nomb_prod VARCHAR(50) NOT NULL, stock INT NOT NULL, precio MONEY NOT NULL, cod_cat VARCHAR(15) NOT NULL, PRIMARY KEY (cod_prod), CONSTRAINT fk_cod_cat FOREIGN KEY (cod_cat) REFERENCES categorias(cod_cat));

CREATE TABLE detalle(cant INT NOT NULL, cod_fact VARCHAR(15) NOT NULL, cod_prod VARCHAR(15) NOT NULL, PRIMARY KEY (cod_fact, cod_prod), CONSTRAINT fk_cod_fact FOREIGN KEY (cod_fact) REFERENCES Factura(cod_fact), CONSTRAINT fk_cod_prod FOREIGN KEY (cod_prod) REFERENCES productos(cod_prod));
CREATE TABLE distribuye(cod_prod VARCHAR(15) NOT NULL, cod_prov VARCHAR(15) NOT NULL, PRIMARY KEY (cod_prod, cod_prov), CONSTRAINT fk_cod_prod FOREIGN KEY (cod_prod) REFERENCES productos(cod_prod), CONSTRAINT fk_cod_prov FOREIGN KEY (cod_prov) REFERENCES proveedores(cod_prov));
