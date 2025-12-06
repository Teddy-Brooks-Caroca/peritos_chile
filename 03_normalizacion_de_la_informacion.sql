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