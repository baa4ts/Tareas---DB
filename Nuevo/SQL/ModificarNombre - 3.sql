select CodigoCliente from Clientes where NombreCliente = "Gerardo" into @ClienteVar;
update Clientes set NombreCliente = "Alfredo" WHERE CodigoCliente = @ClienteVar;