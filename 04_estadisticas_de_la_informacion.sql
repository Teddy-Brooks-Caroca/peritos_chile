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
