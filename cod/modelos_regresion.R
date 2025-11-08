##############################
# Nombre del archivo: limpieza_datos.R
# Autor: Ashly Garro
# Curso: Herramientas para Ciencias de Datos I
# Fecha: 2025
# Descripción: Modelos de Regresion multiple
##############################

# 6. Modelos de regresion multiple para exito
## Modelo 1: ROI como indicador de exito

modelo_roi <- lm(ROI_log ~ log(budget) + vote_average + runtime, data = movies)
print(summary(modelo_roi))

## Modelo 2: Ingresos como indicador de exito
modelo_revenue <- lm(log(revenue) ~ log(budget) + vote_average, data = movies)
print(summary(modelo_revenue))

## Modelo 3: Promedio de calificaciones como indicador de exito
modelo_rating <- lm(vote_average ~ log(budget) + revenue + runtime, data = movies)
print(summary(modelo_rating))

#===============================================================