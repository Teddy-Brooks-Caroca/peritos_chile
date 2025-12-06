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

-- # B.- UNIFICACIÓN DE LA INFORMACIÓN

-- 1. Creamos una tabla general

DROP TABLE IF EXISTS peritos_nacional;

CREATE TABLE peritos_nacional (
  corte TEXT,
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

-- 2. Inserción por cada tabla

-- Arica
INSERT INTO peritos_nacional
SELECT
  'Arica', nombre, run, titulo_profesional, nro_ficha::TEXT, rol_corte,
  estado, observaciones, email, especialidad, mencion, direccion, telefono
FROM peritos_arica;

-- Iquique
INSERT INTO peritos_nacional
SELECT
  'Iquique', nombre, run, titulo_profesional, nro_ficha::TEXT, rol_corte,
  estado, observaciones, email, especialidad, mencion, direccion, telefono
FROM peritos_iquique;

-- Antofagasta
INSERT INTO peritos_nacional
SELECT
  'Antofagasta', nombre, run, titulo_profesional, nro_ficha::TEXT, rol_corte,
  estado, observaciones, email, especialidad, mencion, direccion, telefono
FROM peritos_antofagasta;

-- Copiapó
INSERT INTO peritos_nacional
SELECT
  'Copiapó', nombre, run, titulo_profesional, nro_ficha::TEXT, rol_corte,
  estado, observaciones, email, especialidad, mencion, direccion, telefono
FROM peritos_copiapo;

-- La Serena
INSERT INTO peritos_nacional
SELECT
  'La Serena', nombre, run, titulo_profesional, nro_ficha::TEXT, rol_corte,
  estado, observaciones, email, especialidad, mencion, direccion, telefono
FROM peritos_la_serena;

-- Valparaíso
INSERT INTO peritos_nacional (
  corte, nombre, run, email, especialidad, mencion, direccion, telefono
)
SELECT
  'Valparaíso', nombre, run, email, especialidad, mencion, direccion, telefono
FROM peritos_valparaiso;

-- Santiago
INSERT INTO peritos_nacional (
  corte, nombre, run, email, especialidad, mencion, direccion, telefono
)
SELECT
  'Santiago', nombre, run, email, especialidad, mencion, direccion, telefono
FROM peritos_santiago;

-- San Miguel
INSERT INTO peritos_nacional (
  corte, nombre, run, titulo_profesional,
  email, especialidad, mencion, direccion, telefono
)
SELECT
  'San Miguel', nombre, run, titulo_profesional,
  email, especialidad, mencion, direccion, telefono
FROM peritos_san_miguel;

-- Rancagua
INSERT INTO peritos_nacional (
  corte, nombre, run, nro_ficha,
  email, especialidad, mencion, direccion, telefono
)
SELECT
  'Rancagua', nombre, run, nro_ficha,
  email, especialidad, mencion, direccion, telefono
FROM peritos_rancagua;

-- Talca
INSERT INTO peritos_nacional (
  corte, nombre, run, titulo_profesional, nro_ficha, rol_corte,
  email, especialidad, mencion, direccion, telefono
)
SELECT
  'Talca', nombre, run, titulo_profesional, nro_ficha, rol_corte,
  email, especialidad, mencion, direccion, telefono
FROM peritos_talca;

-- Chillán
INSERT INTO peritos_nacional (
  corte, nombre, run, titulo_profesional,
  especialidad, mencion, direccion, email, telefono
)
SELECT
  'Chillán', nombre, run, titulo_profesional,
  especialidad, mencion, direccion, email, telefono
FROM peritos_chillan;

-- Concepción
INSERT INTO peritos_nacional
SELECT
  'Concepción', nombre, run, titulo_profesional, nro_ficha,
  rol_corte, estado, observaciones,
  email, especialidad, mencion, direccion, telefono
FROM peritos_concepcion;

-- Temuco
INSERT INTO peritos_nacional (
  corte, nombre, run, titulo_profesional, nro_ficha,
  email, especialidad, mencion, direccion, telefono
)
SELECT
  'Temuco', nombre, run, titulo_profesional, nro_ficha,
  email, especialidad, mencion, direccion, telefono
FROM peritos_temuco;

--Valdivia
INSERT INTO peritos_nacional (
  corte, nombre, run, titulo_profesional, nro_ficha,
  email, especialidad, mencion, direccion, telefono
)
SELECT
  'Valdivia', nombre, run, titulo_profesional, nro_ficha,
  email, especialidad, mencion, direccion, telefono
FROM peritos_valdivia;

-- Puerto Montt
INSERT INTO peritos_nacional
SELECT
  'Puerto Montt', nombre, run, titulo_profesional, nro_ficha,
  rol_corte, estado, observaciones,
  email, especialidad, mencion, direccion, telefono
FROM peritos_puerto_montt;

-- Coyhaique
INSERT INTO peritos_nacional
SELECT
  'Coyhaique', nombre, run, titulo_profesional, nro_ficha::TEXT,
  rol_corte, estado, observaciones,
  email, especialidad, mencion, direccion, telefono
FROM peritos_coyhaique;

-- Punta Arenas
INSERT INTO peritos_nacional
SELECT
  'Punta Arenas', nombre, run, titulo_profesional, nro_ficha,
  rol_corte, estado, NULL,
  email, especialidad, mencion, direccion, telefono
FROM peritos_punta_arenas;

-- 3. Conteo de la unificación

SELECT COUNT(*) FROM peritos_nacional;

SELECT corte, COUNT(*)
FROM peritos_nacional
GROUP BY corte
ORDER BY corte;

SELECT nombre, run, especialidad, corte
FROM peritos_nacional
LIMIT 20;


-- Unificamos la información en una sola tabla (peritos_nacional) con tal de tener 
-- todos los registros para su manipulación.

-- No todas las tablas tienen la misma información, ya sea en cnatidad o en orden 

-- ###############################################################################################

-- #  C.- NORMALIZACIÓN DE LA INFORMACIÓN

-- 1. Normalización del RUN

-- 1.1 Limpieza básica
UPDATE peritos_nacional
SET run = UPPER(
  REGEXP_REPLACE(run, '[^0-9Kk]', '', 'g')
);

-- 1.2 Insertar guion antes del dígito verificador
UPDATE peritos_nacional
SET run = REGEXP_REPLACE(
  run,
  '^([0-9]+)([0-9K])$',
  '\1-\2'
);

-- 1.3 Verificar RUN inválidos
SELECT run, COUNT(*)
FROM peritos_nacional
WHERE run IS NULL
   OR run !~ '^[0-9]+-[0-9K]$'
GROUP BY run;

-- 2. Normalización de e-mail

-- 2.1 Limpieza básica
UPDATE peritos_nacional
SET email = LOWER(TRIM(email));

-- 2.2 Correos inválidos
SELECT email, COUNT(*)
FROM peritos_nacional
WHERE email IS NOT NULL
AND email !~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
GROUP BY email;

-- 3. Normalización de teléfonos

-- 3.1 Limpiar todo a solo números
UPDATE peritos_nacional
SET telefono = REGEXP_REPLACE(telefono, '[^0-9]', '', 'g');

-- 3.2 Estandarizar a teléfonos chilenos
UPDATE peritos_nacional
SET telefono = '56' || telefono
WHERE LENGTH(telefono) = 9;

-- 3.3 Teléfonos sospechosos
SELECT telefono, COUNT(*)
FROM peritos_nacional
GROUP BY telefono
HAVING telefono IS NULL OR LENGTH(telefono) < 8;

-- 4. Normalización de textos

UPDATE peritos_nacional
SET
  nombre = INITCAP(TRIM(nombre)),
  titulo_profesional = INITCAP(TRIM(titulo_profesional)),
  especialidad = INITCAP(TRIM(especialidad)),
  mencion = INITCAP(TRIM(mencion)),
  direccion = INITCAP(TRIM(direccion)),
  observaciones = INITCAP(TRIM(observaciones));

-- 5. Detección de duplicados por RUN

-- 5.1 RUN repetidos
SELECT run, COUNT(*)
FROM peritos_nacional
GROUP BY run
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- 5.2 Cruces entre cortes
SELECT run, STRING_AGG(DISTINCT corte, ' | ') AS cortes
FROM peritos_nacional
GROUP BY run
HAVING COUNT(DISTINCT corte) > 1;

-- 6. Detección de perfiles sin contacto

-- 6.1 Por e-mail
SELECT COUNT(*) AS sin_email
FROM peritos_nacional
WHERE email IS NULL OR email = '';

-- 6.2 Por teléfono
SELECT COUNT(*) AS sin_telefono
FROM peritos_nacional
WHERE telefono IS NULL OR telefono = '';

-- 7. Versión final

CREATE TABLE peritos_nacional_limpia AS
SELECT * FROM peritos_nacional;

-- ###############################################################################################

-- # D.- ESTADÍSTICAS CONSULTADAS

-- 1. Estadísticas nacionales generales

-- 1.1 Total nacional de peritos
SELECT COUNT(*) AS total_peritos_nacional
FROM peritos_nacional_limpia;

-- 1.2 Total de peritos por corte
SELECT corte, COUNT(*) AS total_peritos
FROM peritos_nacional_limpia
GROUP BY corte
ORDER BY total_peritos DESC;

-- 1.3 Total de peritos por especialidad
SELECT especialidad, COUNT(*) AS total
FROM peritos_nacional_limpia
WHERE especialidad IS NOT NULL AND especialidad <> ''
GROUP BY especialidad
ORDER BY total DESC;

-- 2. Enfoque exclusivo en peritos antropológicos

-- 2.1 Total nacional de peritos antropólogos
SELECT COUNT(*) AS total_antropologos
FROM peritos_nacional_limpia
WHERE
  especialidad ILIKE '%antropolog%';
  
-- 2.2 Peritos antropológicos por corte
SELECT corte, COUNT(*) AS total_antropologos
FROM peritos_nacional_limpia
WHERE especialidad ILIKE '%antropolog%'
GROUP BY corte
ORDER BY total_antropologos DESC;

-- 2.3 Proporción de antropólogos dentro de cada corte
SELECT
  corte,
  COUNT(*) FILTER (WHERE especialidad ILIKE '%antropolog%') AS antropologos,
  COUNT(*) AS total_peritos,
  ROUND(
    COUNT(*) FILTER (WHERE especialidad ILIKE '%antropolog%') * 100.0 / COUNT(*),
    2
  ) AS porcentaje_antropologos
FROM peritos_nacional_limpia
GROUP BY corte
ORDER BY porcentaje_antropologos DESC;

-- 3. Comparación con las especialidades dominantes

-- 3.1 Ranking nacional de especialidades
SELECT especialidad, COUNT(*) AS total
FROM peritos_nacional_limpia
GROUP BY especialidad
ORDER BY total DESC
LIMIT 10;

-- 3.2 Posición de Antropología dentro del ranking
SELECT *
FROM (
  SELECT
    especialidad,
    COUNT(*) AS total,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
  FROM peritos_nacional_limpia
  GROUP BY especialidad
) t
WHERE especialidad ILIKE '%antropolog%';

-- 4. Comparación regional

-- 4.1 Construcción de regiones ( por corte)
ALTER TABLE peritos_nacional_limpia ADD COLUMN region TEXT;

UPDATE peritos_nacional_limpia
SET region = CASE
  WHEN corte ILIKE '%arica%' THEN 'Arica y Parinacota'
  WHEN corte ILIKE '%iquique%' THEN 'Tarapacá'
  WHEN corte ILIKE '%antofagasta%' THEN 'Antofagasta'
  WHEN corte ILIKE '%copiapo%' THEN 'Atacama'
  WHEN corte ILIKE '%la serena%' THEN 'Coquimbo'
  WHEN corte ILIKE '%valparaiso%' THEN 'Valparaíso'
  WHEN corte ILIKE '%santiago%' THEN 'Metropolitana'
  WHEN corte ILIKE '%san miguel%' THEN 'Metropolitana'
  WHEN corte ILIKE '%rancagua%' THEN 'O’Higgins'
  WHEN corte ILIKE '%talca%' THEN 'Maule'
  WHEN corte ILIKE '%chillan%' THEN 'Ñuble'
  WHEN corte ILIKE '%concepcion%' THEN 'Biobío'
  WHEN corte ILIKE '%temuco%' THEN 'La Araucanía'
  WHEN corte ILIKE '%valdivia%' THEN 'Los Ríos'
  WHEN corte ILIKE '%puerto montt%' THEN 'Los Lagos'
  WHEN corte ILIKE '%coyhaique%' THEN 'Aysén'
  WHEN corte ILIKE '%punta arenas%' THEN 'Magallanes'
END;

-- 4.2 Antropólogos por región
SELECT region, COUNT(*) AS total_antropologos
FROM peritos_nacional_limpia
WHERE especialidad ILIKE '%antropolog%'
GROUP BY region
ORDER BY total_antropologos DESC;

-- 4.3 Proporción regional de antropólogos
SELECT
  region,
  COUNT(*) FILTER (WHERE especialidad ILIKE '%antropolog%') AS antropologos,
  COUNT(*) AS total_peritos,
  ROUND(
    COUNT(*) FILTER (WHERE especialidad ILIKE '%antropolog%') * 100.0 / COUNT(*),
    2
  ) AS porcentaje_antropologos
FROM peritos_nacional_limpia
GROUP BY region
ORDER BY porcentaje_antropologos DESC;

-- ###############################################################################################

-- # E.- TABULACIONES EXTRAS (DIAGNOSTICO)

-- 1. Especificiar los NULL 
SELECT corte, region, COUNT(*) AS total
FROM peritos_nacional_limpia
WHERE especialidad ILIKE '%antropolog%'
GROUP BY corte, region
ORDER BY region NULLS FIRST;

-- 2.Actualizar los NULL

-- Chillán → Ñuble
UPDATE peritos_nacional_limpia
SET region = 'Ñuble'
WHERE corte = 'Chillán'
  AND region IS NULL;

-- Concepción → Biobío
UPDATE peritos_nacional_limpia
SET region = 'Biobío'
WHERE corte = 'Concepción'
  AND region IS NULL;

-- Copiapó → Atacama
UPDATE peritos_nacional_limpia
SET region = 'Atacama'
WHERE corte = 'Copiapó'
  AND region IS NULL;

-- Valparaíso → Valparaíso
UPDATE peritos_nacional_limpia
SET region = 'Valparaíso'
WHERE corte = 'Valparaíso'
  AND region IS NULL;
  
-- 3. Verificar que de 0 NULL
SELECT COUNT(*) 
FROM peritos_nacional_limpia
WHERE especialidad ILIKE '%antropolog%'
  AND region IS NULL;

-- 4. Estadística limpia
SELECT
  region,
  COUNT(*) AS total_antropologos
FROM peritos_nacional_limpia
WHERE especialidad ILIKE '%antropolog%'
GROUP BY region
ORDER BY total_antropologos DESC;

-- Este paso adicional se realizó por la existencia de NULL en las regiones; una vez corregidos, no debería
-- afectar en las estadísticas previas.

-- ######################################### FIN SCRIPT ######################################################







































