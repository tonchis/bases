# Restricciones Adicionales

### Sobre los atributos

* El `número` del `DNI` tiene que ser mayor a 0.
* El `tipo` del `DNI` tiene que ser alguno de los siguientes: DNI, CI, LE, LC.
* El atributo `cantidad` de la relación `Votos` tiene que ser mayor o igual a 0.
* El atributo `nombre` de `TipoTerritorio` debe ser alguno de los siguientes y no se pueden repetir:
  * País
  * Provincia
  * Localidad
  * Ciudad

### Territorios sólo pueden `contener` a territorios más chicos.

* Un País sólo puede contener Provincias.
* Una Provincia sólo puede contener Localidades.
* Una Localidad sólo puede contener Ciudades.
* Una Ciudad no puede contener nada.

### Sólo se puede ser oriundo de una ciudad.

Sólo los `Territorios` con `TipoTerritorio` de `nombre` "Ciudad" pueden participar de la relación `OriundoDe`.

### Votar en las elecciones que corresponden según territorio.

[ARREGLAR ACA]

Para que un `Ciudadano` pueda participar en `Vota en` con `MesaElectoral`,
ésta debe `pertenecer` a una `Eleccion` que `abarque` un `Territorio` el
cual debe ser igual o `contiene` en algún nivel al `Territorio` del cual el `Ciudadano` es `OriundoDe`[1].

[1] quien participa de `OriundoDe` es `Persona`, no `Ciudadano`. Nos estamos refiriendo a la `Persona` correspondiente a dicho `Ciudadano`.

### Presentarse como candidato para la elección de algún cargo.

Para que un `Candidato` pueda participar de `SePostula` con un `PartidoPolítico` en una `Eleccion`,
el `Territorio` que esta última `abarca` debe ser igual o `contener` en algún nivel al `Territorio`
en el cual el `Candidato` debe participar en `ViveEn`[2] con una `fechaDesde` mayor a los 5 años.

[2] Idem [1].