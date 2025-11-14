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
# 5. Visualizaciones en graficos
## Presupuesto vs ingreso
graf_budg_rev <- ggplot(movies, aes(x = budget, y = revenue)) +
  geom_point(alpha = 0.5, color = "pink") +
  scale_x_log10(labels = dollar_format(prefix="$")) +
  scale_y_log10(labels = dollar_format(prefix="$")) +
  labs(
    title = "Presupuesto vs Ingresos en Taquilla",
    x = "Presupuesto (USD, log)",
    y = "Ingresos (USD, log)"
  ) + 
  theme_minimal()
print(graf_budg_rev)
ggsave("outputs/presupuesto_vs_ingreso.png", plot = graf_budg_rev, width = 8, height = 6)

## Presupuesto vs Promedio de votos
graf_budg_votes <- ggplot(movies, aes(x= budget_group, y = vote_average, fill = budget_group)) +
  geom_col()+
  scale_y_continuous(limits = c(0, 10)) +
  labs(
    title = "Promedio de calificaciones por rango de presupuesto",
    x = "Rango de presupuesto",
    y = "Promedio de calificacion",
    fill = "Rangos de Presupuesto"
  ) +
  theme_minimal() 
print(graf_budg_votes)
ggsave("outputs/presupuesto_vs_promediovotos.png", plot = graf_budg_votes, width = 8, height = 6)

## Presupuesto vs ROI
###
graf_budg_roi <- ggplot(movies, aes(x = budget, y = ROI_log)) +
  geom_point(alpha = 0.5, color = "pink") +
  scale_x_log10(labels = dollar_format(prefix="$")) +
  labs(
    title = "Presupuesto vs Retorno de Inversion",
    x = "Presupuesto (USD, log)",
    y = "Retorno de Inversion (ROI, log)"
  ) + 
  theme_minimal()
print(graf_budg_roi)
ggsave("outputs/presupuesto_vs_roi.png", plot = graf_budg_roi, width = 8, height = 6)
#==============================================================

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