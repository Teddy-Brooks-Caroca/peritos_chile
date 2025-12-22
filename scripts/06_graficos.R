## BASE DE DATOS PERITOS CHILE ##

# A.- CARGA DE LIBRERÍAS

library(tidyverse)
library(ggplot2)
library(dplyr)
library(scales)
library(chilemapas)
library(sf)

# B.- CARGA DE TABLAS

especialidades_a_nivel_nacional <- read.csv("especialidades_a_nivel_nacional.csv")

peritos_antropologos_por_corte <- read.csv("peritos_antropologos_por_corte.csv")

peritos_por_corte <- read.csv("peritos_por_corte.csv")

proporcion_de_antropologos_por_corte <- read.csv("proporcion_de_antropologos_por_corte.csv")

# C.- GRÁFICOS DE LA INFORMACIÓN

# 1. Especialidades a nivel nacional (Top 10)
ggplot(especialidades_a_nivel_nacional, aes(x = reorder(especialidad, total), y = total)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Top 10 de Especialidades a Nivel Nacional",
    x = "Especialidad",
    y = "Total de Peritos"
  ) +
  theme_minimal()

ggsave("01_top10_especialidades.png", width = 8, height = 6)

# 2. Peritos antropólogos por corte
ggplot(peritos_antropologos_por_corte, aes(x = reorder(corte, total_antropologos), y = total_antropologos)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Peritos Antropólogos por Corte",
    x = "Corte de Apelaciones",
    y = "Cantidad de Antropólogos"
  ) +
  theme_minimal()

ggsave("02_antropologos_por_corte.png", width = 8, height = 6)

# 3. Peritos por corte
ggplot(peritos_por_corte, aes(x = reorder(corte, total_peritos), y = total_peritos)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Total de Peritos por Corte",
    x = "Corte de Apelaciones",
    y = "Cantidad Total de Peritos"
  ) +
  theme_minimal()

ggsave("03_total_peritos_por_corte.png", width = 8, height = 6)

# 4. Proporción de antropólogos por corte
ggplot(proporcion_de_antropologos_por_corte, 
       aes(x = reorder(corte, porcentaje_antropologos), 
           y = porcentaje_antropologos)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = percent_format(scale = 1)) +
  labs(
    title = "Proporción de Antropólogos por Corte",
    x = "Corte de Apelaciones",
    y = "Porcentaje de Antropólogos"
  ) +
  theme_minimal()

ggsave("04_proporcion_antropologos_por_corte.png", width = 8, height = 6)

# D.- MAPA GEOREFERENCIADO DE CHILE

# 1.Proporción de peritos por corte

# 1.1 Obtener mapa de regiones de Chile
mapa_regiones <- mapa_comunas |> 
  group_by(codigo_region) |> 
  summarize(geometry = st_union(geometry)) # resumir los datos agrupados uniéndolos

mapa_regiones
grafico_regiones <- mapa_regiones |> 
  st_set_geometry(mapa_regiones$geometry) |> # especificar la geometría del mapa
  ggplot() + # graficar
  geom_sf() + # capa geográfica
  coord_sf(xlim = c(-77, -65)) # recortar coordenadas

grafico_regiones +
  theme_classic()

# 1.2 Dataframe de los recuentos
datos_antropologos <- data.frame(
  codigo_region = c("01", "02", "03", "04", "05", "06", "07", "08", 
                    "09", "10", "11", "12", "13", "14", "15", "16"),
  region = c("Tarapacá", "Antofagasta", "Atacama", "Coquimbo", 
             "Valparaíso", "O'Higgins", "Maule", "Biobío", 
             "La Araucanía", "Los Lagos", "Aysén", "Magallanes", 
             "Metropolitana", "Los Ríos", "Arica y Parinacota", "Ñuble"),
  antropologos = c(8, 7, 8, 12, 9, 7, 6, 12, 11, 7, 5, 5, 18, 9, 7, 6),
  total_peritos = c(1369, 1445, 1283, 1692, 2637, 2317, 1768, 2066, 
                    1732, 1621, 1331, 1169, 3976, 1590, 1284, 1702),
  porcentaje = c(0.58, 0.48, 0.62, 0.71, 0.34, 0.30, 0.34, 0.58, 
                 0.64, 0.43, 0.38, 0.43, 0.45, 0.57, 0.55, 0.35)
)

# 1.3 Unir mapa con datos
mapa_con_datos <- mapa_regiones %>%
  left_join(datos_antropologos, by = "codigo_region")

# 1.4 Crear mapa: Proporción de antropólogos
mapa_con_datos |>
  st_set_geometry(mapa_con_datos$geometry) |>
  ggplot() +
  geom_sf(aes(fill = porcentaje), color = "white", size = 0.3) +
  coord_sf(xlim = c(-76, -66), ylim = c(-56, -17), expand = FALSE) +
  scale_fill_gradient(
    low = "#fee5d9", 
    high = "#a50f15",
    name = "% Antropólogos",
    breaks = c(0.30, 0.45, 0.60, 0.71),
    labels = c("0.30%", "0.45%", "0.60%", "0.71%"),
    guide = guide_colorbar(
      barwidth = 15,              # ANCHO EN UNIDADES (más largo)
      barheight = 0.8,            # ALTO
      title.position = "top",     # TÍTULO ARRIBA
      title.hjust = 0.5           # TÍTULO CENTRADO
    )
  ) +
  labs(
    title = "Proporción de Antropólogos Peritos por Región",
    subtitle = "Porcentaje sobre total de peritos regionales (2024-2025)",
    caption = "Fuente: Registro Nacional de Peritos Judiciales"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(face = "bold", size = 15, hjust = 0.5),
    plot.subtitle = element_text(size = 11, hjust = 0.5, color = "gray30",
                                 margin = margin(b = 15)),
    plot.caption = element_text(size = 9, hjust = 0.5, color = "gray50",
                                margin = margin(t = 10)),
    legend.position = "bottom",
    legend.title = element_text(size = 10, face = "bold"),
    legend.text = element_text(size = 9),
    plot.margin = margin(20, 20, 20, 20)
  )

######################################### FIN SCRIPT ######################################################












