-- # D.- ESTADÍSTICAS CONSULTADAS

-- 1. Estadísticas nacionales generales

-- 1.1 Total nacional de peritos

SELECT COUNT(DISTINCT run) AS total_peritos_nacional
FROM peritos_nacional_limpia
WHERE run IS NOT NULL;

-- 1.2 Total de peritos por corte
SELECT corte, COUNT(DISTINCT run) AS total_peritos
FROM peritos_nacional_limpia
WHERE run IS NOT NULL
GROUP BY corte
ORDER BY total_peritos DESC;

-- 1.3 Total de peritos por especialidad
SELECT especialidad, COUNT(DISTINCT run) AS total
FROM peritos_nacional_limpia
WHERE especialidad IS NOT NULL 
  AND especialidad <> ''
  AND run IS NOT NULL
GROUP BY especialidad
ORDER BY total DESC;

-- 2. Enfoque exclusivo en peritos antropológicos

-- 2.1 Total nacional de peritos antropólogos
SELECT COUNT(DISTINCT run) AS total_antropologos
FROM peritos_nacional_limpia
WHERE 
  especialidad ILIKE '%antropolog%'
   OR titulo_profesional ILIKE '%antropolog%';
  
-- 2.2 Peritos antropológicos por corte
SELECT corte, COUNT(DISTINCT run) AS total_antropologos
FROM peritos_nacional_limpia
WHERE
  especialidad ILIKE '%antropolog%'
   OR titulo_profesional ILIKE '%antropolog%'
GROUP BY corte
ORDER BY total_antropologos DESC;

-- 2.3 Proporción de antropólogos dentro de cada corte
SELECT
  corte,
  COUNT(DISTINCT run) FILTER (
    WHERE especialidad ILIKE '%antropolog%' 
       OR titulo_profesional ILIKE '%antropolog%'
  ) AS antropologos,
  COUNT(DISTINCT run) AS total_peritos,
  ROUND(
    COUNT(DISTINCT run) FILTER (
      WHERE especialidad ILIKE '%antropolog%' 
         OR titulo_profesional ILIKE '%antropolog%'
    ) * 100.0 
    / COUNT(DISTINCT run),
    2
  ) AS porcentaje_antropologos
FROM peritos_nacional_limpia
WHERE run IS NOT NULL
GROUP BY corte
ORDER BY porcentaje_antropologos DESC;

-- 2.4 Peritos repetidos en mas de un a corte
SELECT 
  run,
  nombre,
  COUNT(DISTINCT corte) AS cantidad_cortes,
  STRING_AGG(DISTINCT corte, ' | ') AS cortes_en_que_aparece
FROM peritos_nacional_limpia
WHERE
  (
    especialidad ILIKE '%antropolog%'
     OR titulo_profesional ILIKE '%antropolog%'
  )
  AND run IS NOT NULL
GROUP BY run, nombre
HAVING COUNT(DISTINCT corte) > 1
ORDER BY cantidad_cortes DESC;

-- 2.5 Repetidos por conteo
SELECT COUNT(*) AS total_antropologos_repetidos
FROM (
  SELECT run
  FROM peritos_nacional_limpia
  WHERE
    especialidad ILIKE '%antropolog%'
     OR titulo_profesional ILIKE '%antropolog%'
  GROUP BY run
  HAVING COUNT(DISTINCT corte) > 1
) t;

-- 3. Comparación con las especialidades dominantes

-- 3.1 Ranking nacional de especialidades
SELECT especialidad, COUNT(DISTINCT run) AS total
FROM peritos_nacional_limpia
WHERE especialidad IS NOT NULL
GROUP BY especialidad
ORDER BY total DESC
LIMIT 10;

-- 3.2 Posición de Antropología dentro del ranking
SELECT *
FROM (
  SELECT
    especialidad,
    COUNT(DISTINCT run) AS total,
    RANK() OVER (ORDER BY COUNT(DISTINCT run) DESC) AS ranking
  FROM peritos_nacional_limpia
  WHERE especialidad IS NOT NULL
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
SELECT region, COUNT(DISTINCT run) AS total_antropologos
FROM peritos_nacional_limpia
WHERE
  especialidad ILIKE '%antropolog%'
   OR titulo_profesional ILIKE '%antropolog%'
GROUP BY region
ORDER BY total_antropologos DESC;

-- 4.3 Proporción regional de antropólogos
SELECT
  region,
  COUNT(DISTINCT run) FILTER (
    WHERE especialidad ILIKE '%antropolog%' 
       OR titulo_profesional ILIKE '%antropolog%'
  ) AS antropologos,
  COUNT(DISTINCT run) AS total_peritos,
  ROUND(
    COUNT(DISTINCT run) FILTER (
      WHERE especialidad ILIKE '%antropolog%' 
         OR titulo_profesional ILIKE '%antropolog%'
    ) * 100.0 
    / COUNT(DISTINCT run),
    2
  ) AS porcentaje_antropologos
FROM peritos_nacional_limpia
WHERE run IS NOT NULL
GROUP BY region
ORDER BY porcentaje_antropologos DESC;

-- ###############################################################################################
