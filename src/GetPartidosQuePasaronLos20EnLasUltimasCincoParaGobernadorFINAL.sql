CREATE OR REPLACE FUNCTION GetPartidosQuePasaronLos20EnLasUltimasCincoParaGobernador()
RETURNS TABLE(PartidoPolitico CHARACTER VARYING (255)) AS
$BODY$
SELECT Nombre FROM (
	SELECT e.idEleccion , pp.Nombre
	FROM Eleccion e
	INNER JOIN MesaElectoral me ON e.idEleccion = me.idEleccion
	INNER JOIN MesaCandidato mc ON me.idMesaElectoral = mc.idMesaElectoral
	INNER JOIN VotosCandidato vc ON vc.idMesaElectoral = mc.idMesaElectoral
	INNER JOIN Candidato c ON c.idPersona = vc.idCandidato 
	INNER JOIN Persona p ON p.idPersona = c.idPersona
	INNER JOIN SePostula sp ON sp.idCandidato = c.idPersona and sp.idEleccion = e.idEleccion
	INNER JOIN PartidoPolitico pp ON pp.idPartidoPolitico = sp.idPartidoPolitico
	WHERE e.idEleccion IN (
		SELECT idEleccion
		FROM Eleccion 
		INNER JOIN TipoEleccion ON Eleccion.idTipoEleccion = TipoEleccion.idTipoEleccion
		--POR EL MOMENTO, ASUMO QUE EL TIPO DE ELECCION 2 ES EL DE GOBERNADOR
		WHERE TipoEleccion.idTipoEleccion = 2
		ORDER BY Eleccion.Fecha DESC
		LIMIT 5)
	GROUP BY e.idEleccion,pp.idPartidoPolitico, pp.Nombre
	HAVING ((SUM(vc.Cantidad)) *100 /
			(SELECT SUM(vc2.Cantidad) 
			 FROM Eleccion e2 
			 INNER JOIN MesaElectoral me2 ON e2.idEleccion = me2.idEleccion
			 INNER JOIN VotosCandidato vc2 ON me2.idMesaElectoral = vc2.idMesaElectoral
			 WHERE e2.idEleccion = e.idEleccion) > 20)
	) AS PartidosConMasDe20PorEleccion
	GROUP BY Nombre
	-- para que funcione siempre : si hubo menos de cinco elecciones para gobernador, entonces traigo los partidos que
	-- pasaron el 20% en todas esas elecciones.
	-- si hay mas de 5, traigo de las ultimas 5
	HAVING COUNT(Nombre) =  CASE WHEN (SELECT COUNT(*) FROM Eleccion WHERE idTipoEleccion = 2) > 5 
				THEN 5 
				ELSE (SELECT COUNT(*) FROM Eleccion WHERE idTipoEleccion = 2)
				END  
$BODY$

LANGUAGE sql;
