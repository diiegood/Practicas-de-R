###### paqueteria dplyr 
#mutate filter

library(dplyr)
library(gapminder)

tabla<-data.frame(gapminder)
View(tabla)

#para cambiar de nombre #(tabla)<-c("pais", "continente", "año", "espv", "poblacion")

#select( ) #se puede anidar
#tabla$country #se seleccona pero no se puede anidar
tabla_seleccionar<-tabla %>% select(continent, year)
tabla_seleccionar

C1<-tabla %>% select(continent, year)%>% filter(year>1988)
View(C1)

C2<-C1 %>% arrange(continent)
View(C2)

################################################################################
#Coneval medicion de temas sociales con respecto a la pobreza, del setor social del
#pais.










