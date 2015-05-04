CREATE OR REPLACE FUNCTION GetVotantesQueMasTardeVotaronPorCentroElectoral(eleccionID INTEGER)
RETURNS TABLE(idCentroVotacion INTEGER,	DireccionCentroElectoral CHARACTER VARYING(255), Nombre CHARACTER VARYING(510), TipoDocumento CHARACTER VARYING(255), NumeroDocumento INT) AS

$BODY$

SELECT cv.idCentroVotacion, cv.Direccion, p.Nombre||' '||p.Apellido, d.Tipo, d.Numero 
FROM Eleccion e
INNER JOIN  MesaElectoral me ON me.idEleccion = e.idEleccion
INNER JOIN CentroVotacion cv ON cv.idCentroVotacion = me.idCentroVotacion
INNER JOIN VotaEn ve ON me.idMesaElectoral = ve.idMesaElectoral
INNER JOIN Ciudadano c ON ve.idCiudadano = c.idPersona
INNER JOIN Persona p ON c.idPersona =  p.idPersona
INNER JOIN Documento d ON d.idPersona = p.idPersona
WHERE e.idEleccion = eleccionID
AND c.idPersona IN (
    SELECT ve2.idCiudadano
    FROM CentroVotacion cv2
    INNER JOIN MesaElectoral me ON cv2.idCentroVotacion = me.idCentroVotacion
    INNER JOIN VotaEn ve2 ON me.idMesaElectoral = ve2.idMesaElectoral
    WHERE cv2.idCentroVotacion = cv.idCentroVotacion
    ORDER BY ve2.fecha, ve2.hora DESC
    LIMIT 5
  )
ORDER BY cv.idCentroVotacion, ve.fecha, ve.hora

$BODY$

LANGUAGE sql;
