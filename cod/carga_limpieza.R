##############################
# Nombre del archivo: limpieza_datos.R
# Autor: Ashly Garro
# Curso: Herramientas para Ciencias de Datos I
# Fecha: 2025
# Descripción: Carga de datos y limpieza/exploracion
##############################

# 1. Importacion de datos
movies <- read.csv("data/movies_metadata.csv")
#==============================================================

# Inspección inicial
str(movies)
summary(movies)
colSums(is.na(movies))
#==============================================================

# 2. Limpieza de datos
### Primero se convierten las variables utiles para el analisis en numericas
movies <- movies %>%
  filter(
    !is.na(budget),
    !is.na(revenue),
    !is.na(vote_average),
    !is.na(runtime),
    budget >0, 
    revenue >0
  ) %>%
  mutate(
    budget = as.numeric(budget),
    revenue = as.numeric(revenue),
    vote_average = as.numeric(vote_average),
    runtime = as.numeric(runtime),
    release_date = as.Date(release_date), ##
    ROI = (revenue - budget)/budget
  ) 

# Ajuste para ROI_log
min_ROI <- min(movies$ROI, na.rm = TRUE)
movies <- movies %>%
  mutate(ROI_log = log(ROI + 1 - min_ROI))


##Se crean rangos de presupuesto
movies <- movies %>%
  mutate(
    budget_group = cut(budget,
    breaks = 5,
    labels = c("Muy bajo", "Bajo", "Medio", "Alto", "Muy alto"))
  )

## Se revisan los datos de los primeros registros
print(head(movies))
#==============================================================
