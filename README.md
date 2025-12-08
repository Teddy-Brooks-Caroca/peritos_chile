# 📊 Registro Nacional de Peritos Judiciales en Chile

### Unificación, Normalización y Análisis del Peritaje con Enfoque Antropológico

Proyecto de limpieza, estandarización y análisis del registro nacional de peritos judiciales en Chile, con énfasis en la **presencia territorial del peritaje antropológico**.

---

## 🧭 Descripción General

Este repositorio contiene el proceso completo de:

* ✅ **Carga de bases originales por Corte de Apelaciones**

* ✅ **Unificación en una base nacional**

* ✅ **Normalización de campos críticos (RUN, email, teléfono, textos)**

* ✅ **Asignación territorial por región**

* ✅ **Análisis estadístico del peritaje antropológico a nivel nacional y regional**

El proyecto surge ante la **alta heterogeneidad, baja estandarización y presencia de datos sucios** en los registros oficiales, que dificultan análisis serios sobre distribución territorial, especialización profesional y acceso real al peritaje.

---

## 🎯 Objetivo Principal



Analizar empíricamente la **presencia, distribución y concentración del peritaje antropológico en el sistema judicial chileno**, permitiendo responder preguntas como:



* ¿Cuántos peritos antropológicos existen a nivel nacional?

* ¿En qué regiones se concentran?

* ¿Qué cortes dependen más (o menos) de este tipo de peritaje?

* ¿Existen asimetrías territoriales en el acceso al peritaje cultural?


---


## 🛠️ Tecnologías Utilizadas



* **PostgreSQL** (modelo relacional, limpieza y análisis)

* **CSV / datos administrativos judiciales**

* Potencial integración con:

	* R

	* Python

	* Power BI / Tableau



---



## 🧼 Tratamiento de Datos Sucios



Se identificaron problemas estructurales en los archivos originales:



* Saltos de línea internos en campos

* Delimitadores inconsistentes

* Encabezados intercalados en los datos

* Campos ausentes según corte

* Errores de digitación



Para los casos críticos (Chillán y Concepción) se aplicó la estrategia de:



1. **Importación cruda a tablas RAW**

2. **Separación manual por `split\_part()`**

3. **Validación y reconstrucción de campos**



Este proceso queda completamente documentado en los scripts.



---



## 📐 Normalización Aplicada



Se estandarizaron los siguientes campos:



* `run` → eliminación de puntos, normalización de guion

* `email` → minúsculas + validación por regex

* `telefono` → normalización a formato Chile `56`

* `nombre`, `especialidad`, `direccion` → limpieza de espacios, capitalización

* Detección de **duplicados por RUN**



Además, se realizó:



* ✅ Asignación regional por corte

* ✅ Corrección de 35 casos sin región

* ✅ Normalización del nombre de regiones



---



## 📊 Líneas de Análisis Implementadas



Entre las consultas incluidas se encuentran:



* Total nacional de peritos

* Total nacional de peritos antropológicos

* Porcentaje de antropología dentro del sistema

* Distribución regional del peritaje antropológico

* Índice de dependencia regional de antropología

* Ranking de cortes con mayor presencia antropológica



---



## 🧠 Enfoque Teórico



Este proyecto se inscribe en una línea de análisis **crítico del funcionamiento institucional del peritaje**, abordando:



* Desigualdad territorial en acceso a peritajes especializados

* Centralización técnico-profesional

* Invisibilización estadística por problemas administrativos

* Brecha entre demanda judicial intercultural y oferta real de expertos



---



## 📄 Estado del Proyecto



✅ Carga de datos completa

✅ Unificación nacional

✅ Normalización

✅ Asignación regional

✅ Estadísticas generales



---



## 🤝 Contribuciones



Este repositorio está abierto a:



* Antropólogos/as

* Investigadores/as judiciales

* Científicos/as de datos

* Estudiantes de derecho, sociología, criminología



Pull requests, mejoras metodológicas y nuevas visualizaciones son bienvenidas.



---



## ⚖️ Advertencia de Uso



Los datos provienen de **registros administrativos públicos**, cuya calidad es responsabilidad de los organismos que los producen.

Este proyecto **no altera información sustantiva**, solo la reorganiza, limpia y analiza.



---



## 🔒 Disclaimer de Protección de Datos Personales



Por razones **éticas, legales y de resguardo de la privacidad**, las **tablas con datos individuales de peritos NO serán publicadas en este repositorio**, ni en forma completa ni parcial.



Aunque los registros provienen de **fuentes administrativas públicas**, este proyecto se rige por los siguientes principios:



* ✅ **Protección de la identidad personal**

* ✅ **No exposición de datos sensibles**

* ✅ **Uso exclusivo con fines analíticos y académicos**

* ✅ **Cumplimiento de la Ley N° 19.628 sobre Protección de la Vida Privada (Chile)**



En consecuencia:



* Este repositorio **solo publica**:



	* Scripts de creación de tablas

	* Procesos de limpieza y normalización

	* Consultas estadísticas

	* Resultados agregados y anonimizados

	* **No se incluye** ningún archivo con:



		* Nombres

		* RUN

		* Direcciones

		* Teléfonos

		* Correos electrónicos



Los análisis presentados se construyen **exclusivamente sobre datos ya anonimizados o agregados**, impidiendo la identificación directa o indirecta de personas.



---



## ✍️ Autor



**Teddy Brooks Caroca**

Antropólogo socio-cultural, Analista de datos etnográficos.



---





