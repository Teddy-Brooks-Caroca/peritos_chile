-- ## BASE DE DATOS PERITOS DE CHILE ##

-- #  A.- CARGA DE TABLAS 

-- Corte de Apelaciones de Arica
CREATE TABLE peritos_arica (
  nombre TEXT,
  run TEXT,
  titulo_profesional TEXT,
  nro_ficha TEXT,
  rol_corte TEXT,
  estado TEXT,
  observaciones TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
);

-- Corte de Apelaciones de Iquique
CREATE TABLE peritos_iquique (LIKE peritos_arica INCLUDING ALL);

-- Corte de Apelaciones de Antofagasta
CREATE TABLE peritos_antofagasta (LIKE peritos_arica INCLUDING ALL);

-- Corte de Apelaciones de Copiapó
CREATE TABLE peritos_copiapo (LIKE peritos_arica INCLUDING ALL);

-- Corte de Apelaciones de La Serena
CREATE TABLE peritos_la_serena (LIKE peritos_arica INCLUDING ALL);

-- Corte de Apelaciones de Valparaíso
CREATE TABLE peritos_valparaiso (
  nombre TEXT,
  run TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
);

-- Corte de Apelaciones de Santiago
CREATE TABLE peritos_santiago (
  nombre TEXT,
  run TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
);

-- Corte de Apelaciones de San Miguel
CREATE TABLE peritos_san_miguel (
  nombre TEXT,
  run TEXT,
  titulo_profesional TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
);

-- Corte de Apelaciones de Rancagua
CREATE TABLE peritos_rancagua (
  nombre TEXT,
  run TEXT,
  nro_ficha TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
 );

-- Corte de Apelaciones de Talca 
CREATE TABLE peritos_talca (
  nombre TEXT,
  run TEXT,
  titulo_profesional TEXT,
  nro_ficha TEXT,
  rol_corte TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
);

-- Corte de Apelaciones de Chillan
DROP TABLE IF EXISTS peritos_chillan;

CREATE TABLE peritos_chillan_raw (
  linea_completa TEXT
);

SELECT COUNT(*) FROM peritos_chillan_raw;

DELETE FROM peritos_chillan_raw
WHERE linea_completa ILIKE '%nombre%run%';

SELECT COUNT(*) FROM peritos_chillan_raw;

DROP TABLE IF EXISTS peritos_chillan;

CREATE TABLE peritos_chillan(
	nombre TEXT,
	run TEXT,	
	titulo_profesional TEXT,
	especialidad TEXT,
	mencion TEXT,
	direccion TEXT,	
	email TEXT,
	telefono TEXT
);

INSERT INTO peritos_chillan (
  nombre, run, titulo_profesional, especialidad, mencion, direccion, email,telefono
)
SELECT
  split_part(linea_completa, ';', 1),  -- nombre
  split_part(linea_completa, ';', 2),  -- run
  split_part(linea_completa, ';', 3),  -- titulo
  split_part(linea_completa, ';', 4),  -- especialidad
  split_part(linea_completa, ';', 5),  -- mencion
  split_part(linea_completa, ';', 6),  -- direccion
  split_part(linea_completa, ';', 7),  -- email
  split_part(linea_completa, ';', 8)   -- telefono
FROM peritos_chillan_raw;

SELECT COUNT(*) FROM peritos_chillan;

DROP TABLE peritos_chillan_raw;

-- Corte de Apelaciones de Concepción
CREATE TABLE peritos_concepcion_raw (
  linea_completa TEXT
);

SELECT COUNT(*) FROM peritos_concepcion_raw;

DELETE FROM peritos_concepcion_raw
WHERE linea_completa ILIKE '%nombre%run%';

SELECT COUNT(*) FROM peritos_concepcion_raw;

DROP TABLE IF EXISTS peritos_concepcion;

CREATE TABLE peritos_concepcion (
  nombre TEXT,
  run TEXT,
  titulo_profesional TEXT,
  nro_ficha TEXT,
  rol_corte TEXT,
  estado TEXT,
  observaciones TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
);

INSERT INTO peritos_concepcion (
  nombre, run, titulo_profesional, nro_ficha, rol_corte, estado,
  observaciones, email, especialidad, mencion, direccion, telefono
)
SELECT
  split_part(linea_completa, ';', 1),  -- nombre
  split_part(linea_completa, ';', 2),  -- run
  split_part(linea_completa, ';', 3),  -- titulo
  split_part(linea_completa, ';', 4),  -- nro ficha
  split_part(linea_completa, ';', 5),  -- rol corte
  split_part(linea_completa, ';', 6),  -- estado
  split_part(linea_completa, ';', 7),  -- observaciones
  split_part(linea_completa, ';', 8),  -- email
  split_part(linea_completa, ';', 9),  -- especialidad
  split_part(linea_completa, ';',10),  -- mencion
  split_part(linea_completa, ';',11),  -- direccion
  split_part(linea_completa, ';',12)   -- telefono
FROM peritos_concepcion_raw;

SELECT COUNT(*) FROM peritos_concepcion;

DROP TABLE peritos_concepcion_raw;

-- Corte de Apelaciones de Temuco
CREATE TABLE peritos_temuco (
  nombre TEXT,
  run TEXT,
  titulo_profesional TEXT,
  nro_ficha TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
);

-- Corte de Apelaciones de Valdivia
CREATE TABLE peritos_valdivia (
  nombre TEXT,
  run TEXT,
  titulo_profesional TEXT,
  nro_ficha TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
);

-- Corte de Apelaciones de Puerto Montt
CREATE TABLE peritos_puerto_montt (
  nombre TEXT,
  run TEXT,
  titulo_profesional TEXT,
  nro_ficha TEXT,
  rol_corte TEXT,
  estado TEXT,
  observaciones TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
);

-- Corte de Apelaciones de Coyhaique
CREATE TABLE peritos_coyhaique (LIKE peritos_arica INCLUDING ALL);

-- Corte de Apelaciones de Punta Arenas
CREATE TABLE peritos_punta_arenas (
  nombre TEXT,
  run TEXT,
  titulo_profesional TEXT,
  nro_ficha TEXT,
  rol_corte TEXT,
  estado TEXT,
  email TEXT,
  especialidad TEXT,
  mencion TEXT,
  direccion TEXT,
  telefono TEXT
);

-- La importación de tablas fue efectuada con el wizard del programa, se cotejó las caracteristicas
-- del csv para que coincidan con la tabla respectiva.

-- El contenido y disposición de las columnas es de responsabilidad de quienes hicieron los registros,
-- las tablas de este script se basan en dichas confecciones.

-- En los csv de Chillán y Concepción se detectó que el CSV contenía saltos de línea internos
-- y delimitación inconsistente, por lo que se aplicó una importación cruda y posterior separación 
-- manual de campos.

-- ###############################################################################################