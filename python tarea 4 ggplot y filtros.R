#tarea 3 analisis de informacion economica  Diego Valdez
"Condiciones"
# 1- PIB nacional > promedio total, deben ser paises del continente americano, solamente.
# 2- De ese filtro obtener los periodos (años de esos paises), que tengan poblacion menor a 200 millones hab
# 3- graficar el movimiento del pib de los paises elegidos

#carga de libreria
library(gapminder)
library(gapminder)
library(dplyr)
library(ggplot2)

#se crea un vector con la libreria.

paises<-data.frame(gapminder)
paises

#Obtencion Pib despues del 82
PIBtotal<-paises %>% mutate (PIB = pop * gdpPercap)
PIBtotal

paises_despues_decrisis<- PIBtotal %>%filter(year>1982, continent == "Americas")
paises_despues_decrisis

#promedio de paises despues del 82
promedio_pib <-mean(paises_despues_decrisis$PIB)
promedio_pib

#primer condicional paises que superan el promedio despues del 82
paises_pibalto <- paises_despues_decrisis %>% filter(PIB > promedio_pib)
paises_pibalto

#segundo condicional paises de pib alto y poblacion media
paisestop <-paises_pibalto %>% filter(PIB>promedio_pib, pop<200000000)
paisestop
View(paisestop)

#cuadro donde se representan los paises con PIB>mean y pop < 200,000,000
cuadro_paises_top<-data.frame(paisestop)
cuadro_paises_top
View(cuadro_paises_top) 


################################################################################
############################ Grafica GGplot ####################################

ggplot(paisestop, aes(x = year, y = PIB, color = country)) +
  geom_line(size = 1.2) +  
  geom_point(size = 2) +  
  labs(title = "Paises de Pib arriba de la media despues de 1982",
       subtitle = paste("Promedio PIB:", round(promedio_pib, 2)),
       x = "Año",
       y = "PIB (en Billones)",
       color = "País") +  
  theme_minimal() +  
  theme(
    text = element_text(size = 12), plot.title = element_text(hjust = 0.5, face = "bold"),plot.subtitle = element_text(hjust = 0.5) ) + scale_y_continuous(labels = scales::comma_format())
#
