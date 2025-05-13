SELECT * FROM Clientes WHERE NombreCliente = "Gerardo" INTO @CodigoCliente;
UPDATE Clientes SET NombreCliente = "Alfredo" WHERE CodigoCliente = @CodigoCliente;