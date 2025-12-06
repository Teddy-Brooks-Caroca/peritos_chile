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