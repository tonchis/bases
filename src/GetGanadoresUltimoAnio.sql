CREATE OR REPLACE FUNCTION GetGanadoresUltimoAnio()
RETURNS TABLE(idEleccion INTEGER, Nombre CHARACTER VARYING(510), TipoDocumento CHARACTER VARYING(255), NumeroDocumento INT) AS

$BODY$

SELECT e.idEleccion, p.Nombre||''||p.Apellido, d.Tipo, d.Numero
FROM Eleccion e
INNER JOIN MesaElectoral me ON e.idEleccion = me.idEleccion
INNER JOIN VotosCandidato vc ON me.idMesaElectoral = vc.idMesaElectoral
INNER JOIN Persona p ON p.idPersona = vc.idCandidato
INNER JOIN Documento d ON d.idPersona= p.idPersona
WHERE (e.Fecha BETWEEN (now()-INTERVAL '365 days') AND now())
GROUP BY e.idEleccion, p.Nombre,p.Apellido,d.Tipo, d.Numero
HAVING NOT EXISTS
	(SELECT sum(vc2.Cantidad)
	FROM Eleccion e2
	INNER JOIN MesaElectoral me2 ON me2.idEleccion = e2.idEleccion
	INNER JOIN MesaCandidato mc2 ON me2.idMesaElectoral = mc2.idMesaElectoral
	INNER JOIN VotosCandidato vc2 ON vc2.idMesaElectoral = mc2.idMesaElectoral
	WHERE e2.idEleccion = e.idEleccion
	GROUP BY vc2.idCandidato
	HAVING SUM(vc2.Cantidad) > SUM(vc.Cantidad))

$BODY$

LANGUAGE sql;
