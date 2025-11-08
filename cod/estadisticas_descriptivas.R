##############################
# Nombre del archivo: limpieza_datos.R
# Autor: Ashly Garro
# Curso: Herramientas para Ciencias de Datos I
# Fecha: 2025
# Descripción: Estadisticas Descriptivas
##############################

## 3. Estadisticas descripitivas de las variables de interes
print(summary(movies$ROI))
print(summary(movies$revenue))
print(summary(movies$budget))
print(summary(movies$vote_average))
print(summary(movies$runtime))

#==============================================================
# 4. Correlaciones entre presupuesto y variables que indican exito
print(cor(movies$budget, movies$revenue, use = "complete.obs"))
print(cor(movies$budget, movies$vote_count, use = "complete.obs"))
print(cor(movies$budget, movies$ROI, use = "complete.obs"))
print(cor(movies$budget, movies$runtime, use = "complete.obs"))

#==============================================================
sink("outputs/estadisticas.txt")
summary(movies$budget)
summary(movies$revenue)
cor(movies$budget, movies$revenue, use="complete.obs")
sink()  # cierra el archivo