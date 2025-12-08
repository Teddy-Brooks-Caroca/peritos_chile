## BASE DE DATOS PERITOS CHILE ##

# A.- CARGA DE LIBRERÍAS

library(ggplot2)
library(dplyr)
library(scales)

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

######################################### FIN SCRIPT ######################################################












