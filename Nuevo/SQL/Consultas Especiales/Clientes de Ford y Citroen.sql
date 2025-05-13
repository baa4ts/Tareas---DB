SELECT 
    c.ApellidosCliente, 
    c.Poblacion
FROM 
    Clientes c
JOIN 
    CochesVendidos cv ON c.CodigoCliente = cv.CodigoCliente
WHERE 
    cv.Marca IN ('Ford', 'Citroen')
ORDER BY 
    c.Poblacion ASC, 
    c.ApellidosCliente ASC;
