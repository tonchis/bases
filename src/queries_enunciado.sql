-- candidato ganador para la elección con id = ?
SELECT vc.idCandidato, p.nombre, sum(vc.cantidad) AS total
  FROM Eleccion e
  INNER JOIN MesaElectoral me ON me.idEleccion = e.idEleccion
  INNER JOIN MesaCandidato mc ON me.idMesaElectoral = mc.idMesaElectoral
  INNER JOIN VotosCandidato vc ON vc.idMesaElectoral = mc.idMesaElectoral
  INNER JOIN Persona p ON p.idPersona = vc.idCandidato
  WHERE e.idEleccion = 1
  GROUP BY vc.idCandidato, p.nombre
  HAVING NOT EXISTS (
    SELECT sum(vc2.cantidad)
      FROM Eleccion e2
      INNER JOIN MesaElectoral me2 ON me2.idEleccion = e2.idEleccion
      INNER JOIN MesaCandidato mc2 ON me2.idMesaElectoral = mc2.idMesaElectoral
      INNER JOIN VotosCandidato vc2 ON vc2.idMesaElectoral = mc2.idMesaElectoral
      WHERE e2.idEleccion = 1
      GROUP BY vc2.idCandidato
      HAVING sum(vc2.cantidad) > sum(vc.cantidad)
  );

-- Poder obtener los ganadores de las elecciones transcurridas en el último año.
SELECT e.idElecion, vc.idCandidato, sum(vc.cantidad) AS total
  FROM Eleccion e
  INNER JOIN MesaElectoral me ON me.idEleccion = e.idEleccion
  INNER JOIN MesaCandidato mc ON me.idMesaElectoral = mc.idMesaElectoral
  INNER JOIN VotosCandidato vc ON vc.idMesaElectoral = mc.idMesaElectoral
  WHERE e.fecha BETWEEN ? AND ?
  AND NOT EXISTS (
    SELECT sum(vc2.cantidad)
      FROM Eleccion e2
      INNER JOIN MesaElectoral me2 ON me2.idEleccion = e2.idEleccion
      INNER JOIN MesaCandidato mc2 ON me2.idMesaElectoral = mc2.idMesaElectoral
      INNER JOIN VotosCandidato vc2 ON vc2.idMesaElectoral = mc2.idMesaElectoral
      WHERE e2.idEleccion = e.idEleccion
      GROUP BY vc2.idCandidato
      HAVING sum(vc2.cantidad) > total
  )
  GROUP BY e.id, vc.idCandidato

-- Poder consultar las cinco personas que más tarde fueron a votar antes de terminar
-- la votación por cada centro electoral en una elección.
-- Parámetro e.idEleccion
SELECT cv.idCentroVotacion, c.idCiudadano, c.nombre
  FROM Eleccion e,
  INNER JOIN MesaElectoral me ON me.idEleccion = e.idEleccion
  INNER JOIN CentroVotacion cv ON cv.idCentroVotacion = me.idCentroVotacion
  INNER JOIN VotaEn ve ON me.idMesaElectoral = ve.idMesaElectoral
  INNER JOIN Ciudadano c ON ve.idCiudadano = c.idCiudadano
  WHERE e.idEleccion = ?
  AND c.idCiudadano IN (
    SELECT ve.idCiudadano
    FROM CentroVotacion cv2
    INNER JOIN MesaElectoral me ON cv2.idCentroVotacion = me.idCentroVotacion
    INNER JOIN VotaEn ve ON me.idMesaElectoral = ve.idMesaElectoral
    WHERE cv2.idCentroVotacion = cv.idCentroVotacion
    ORDER BY ve.fecha, ve.hora DESC
    LIMIT 5
  )

-- Poder consultar quienes fueron los partidos políticos que obtuvieron más del 20%
-- en las últimas cinco elecciones provinciales a gobernador.
SELECT pp.nombre
  FROM Eleccion e,
  INNER JOIN SePostula sp 
  WHERE e.idEleccion = ?

-- SP: cantidad de votos para un candidato en una eleccion e = ?
SELECT vc.idCandidato, sum(vc.cantidad) AS total
  FROM Eleccion e
  INNER JOIN MesaElectoral me ON me.idEleccion = e.idEleccion
  INNER JOIN MesaCandidato mc ON me.idMesaElectoral = mc.idMesaElectoral
  INNER JOIN VotosCandidato vc ON vc.idMesaElectoral = mc.idMesaElectoral
  WHERE e.idEleccion = ?
  GROUP BY vc.idCandidato
