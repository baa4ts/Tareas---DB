ALTER TABLE CochesVendidos
ADD COLUMN CodigoCliente INT;

ALTER TABLE Revisiones
ADD COLUMN Matricula VARCHAR(7);

ALTER TABLE CochesVendidos
ADD CONSTRAINT fk_cliente_coches
FOREIGN KEY (CodigoCliente) REFERENCES Clientes(CodigoCliente);

ALTER TABLE Revisiones
ADD CONSTRAINT fk_cliente_revisiones
FOREIGN KEY (Matricula) REFERENCES CochesVendidos(Matricula);

describe CochesVendidos;
describe Revisiones;
