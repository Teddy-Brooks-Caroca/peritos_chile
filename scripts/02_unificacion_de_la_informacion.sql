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
