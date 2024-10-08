##graficar con ggplot
PIB<-data.frame(Datos_muestra_para_la_clase)
install.packages("ggplot2")
library(ggplot2)
View(PIB)

ggplot(data = PIB) + aes(x=Año, y=México) + geom_line()
##graficar los PIB´s juntos
ggplot(data = PIB) + aes(x=Año) +
  geom_line(aes(y=México, colour="México"), size= 2) + 
  geom_line(aes(y=China, colour="China"), size= 2) + 
  geom_line(aes(y=EU, colour="EU"), size=2) + 
  labs(y="Crecimiento", title = "Tasa de crecimiento MX, CH, EU",
       colour= "Países")

##graficar imagenes en una sola
install.packages("gridExtra")
library(gridExtra)
Gmx<-ggplot(data= PIB) + aes(x=Año, y=México) + geom_line()
GMx
Gch<-ggplot(data= PIB) + aes(x=Año, y=China) + geom_line()
GMx
grid.arrange(Gmx, Gch)



carrera<-c("Economía", "Economía", "Economía", "Filosofía", "Derecho")
alumnos<-c("Ivan", "Marco", "Maria", "Pedro", "Marck")
horas_estudio<-c(10,5,4,9,4)
calificaciones<-c(8,8,7,6,10)
tabla<-data.frame(carrera, alumnos, horas_estudio, calificaciones)
tabla
##filtros 
#tidyverse - dplyr y ggplot2 
####dplyr operador PIPE %>% 
#FILTRAR filter ()
#MUTATE
tabla %>% filter(carrera=="Economía")
tabla %>% filter(calificaciones>=8, horas_estudio>6)
tabla %>% filter(horas_estudio>6, calificaciones>=8)
tabla %>% mutate(horas_estudio_semana=horas_estudio*7)
data.frame(gapminder)