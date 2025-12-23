-- ## ENCUESTA A ABOGADOS ##

-- CARGA DE TABLA

CREATE TABLE encuesta (
    edad TEXT,                               -- 1. Edad
    region_estudios TEXT,                    -- 2. Región donde ejerce sus estudios de Derecho
    tipo_institucion TEXT,                   -- 3. Tipo de institución donde cursó sus estudios de Derecho

    ha_escuchado_peritaje TEXT,              -- 4. ¿Ha escuchado hablar del peritaje antropológico?
    definicion_peritaje TEXT,                -- 5. Definición de peritaje antropológico
    considera_aporte_judicial TEXT,          -- 6. ¿Puede aportar al ámbito judicial?
    tipo_causas TEXT,                        -- 7. Tipo de causas
    experiencia_profesional TEXT,            -- 8. Experiencia con perito antropológico
    formacion_juridica_antropologia TEXT,    -- 9. Formación jurídica y antropología
    reconocimiento_sistema_judicial TEXT,    -- 10. Reconocimiento del sistema judicial

    interes_formacion TEXT,                  -- 11. Interés en formación
    relevancia_antropologia INT,             -- 12. Escala 1–5
    comentarios TEXT                         -- 13. Comentarios finales
);

-- DISCRIMINACIÓN / TABLA ANALÍTICA

CREATE TABLE encuesta_normalizada AS
SELECT
    edad,
    tipo_institucion,
    ha_escuchado_peritaje,
    considera_aporte_judicial,
    tipo_causas,
    experiencia_profesional,
    formacion_juridica_antropologia,
    reconocimiento_sistema_judicial,
    interes_formacion,
    relevancia_antropologia
FROM encuesta;

-- DISTRIBUCIONES BÁSICAS (%)
-- “¿Quiénes son los encuestados?”
-- Distribución por grupo etario
SELECT
    edad,
    COUNT(*) AS n,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS porcentaje
FROM encuesta_normalizada
GROUP BY edad
ORDER BY edad;

-- Tipo de institución
SELECT
    tipo_institucion,
    COUNT(*) AS n,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS porcentaje
FROM encuesta_normalizada
GROUP BY tipo_institucion
ORDER BY porcentaje DESC;

-- ¿Ha escuchado hablar del peritaje antropológico?
SELECT
    ha_escuchado_peritaje,
    COUNT(*) AS n,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS porcentaje
FROM encuesta_normalizada
GROUP BY ha_escuchado_peritaje;

-- ¿Ha participado en un peritaje antropológico?
SELECT
    experiencia_profesional,
    COUNT(*) AS n,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS porcentaje
FROM encuesta_normalizada
GROUP BY experiencia_profesional;

-- CRUCES DE INFORMACIÓN POR EDAD
-- "¿El conocimiento y la experiencia varían según edad?"

-- ¿En sus años ha escuchado hablar de peritajes antropológicos?
SELECT
    edad,
    ha_escuchado_peritaje,
    COUNT(*) AS n
FROM encuesta_normalizada
GROUP BY edad, ha_escuchado_peritaje
ORDER BY edad;

-- En sus años de experiencia ¿ha participado en peritajes antropológicos?
SELECT
    edad,
    experiencia_profesional,
    COUNT(*) AS n,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY edad),
        2
    ) AS porcentaje
FROM encuesta_normalizada
GROUP BY edad, experiencia_profesional
ORDER BY edad;

-- CRUCES DE INFORMACIÓN POR TIPO DE INSTITUCIÓN
-- “¿Influye la institución en la formación recibida?”
SELECT
    tipo_institucion,
    formacion_juridica_antropologia,
    COUNT(*) AS n
FROM encuesta_normalizada
GROUP BY tipo_institucion, formacion_juridica_antropologia
ORDER BY tipo_institucion;

-- CRUCES DE INFORMACIÓN POR INTERÉS DE LA PERSONA
-- “¿La formación previa se relaciona con la disposición a recibir más formación?” 
SELECT
    formacion_juridica_antropologia,
    interes_formacion,
    COUNT(*) AS n
FROM encuesta_normalizada
GROUP BY formacion_juridica_antropologia, interes_formacion;

-- “¿Quiénes muestran mayor disposición a formarse?”
SELECT
    edad,
    interes_formacion,
    COUNT(*) AS n,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY edad),
        2
    ) AS porcentaje
FROM encuesta_normalizada
GROUP BY edad, interes_formacion
ORDER BY edad;

-- ######################################### FIN SCRIPT ######################################################
