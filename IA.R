##descargar paqueterias 

install.packages("quantmod")
install.packages("lubridate")
install.packages("tidyr")
install.packages("caret")

library(quantmod)
library(lubridate)
library(tidyr)
library(caret)
library(dplyr)
library(ggplot2)

##empezamos con el ejercicio
hoy<-today()
hoy
acciones<-getSymbols("NKE", from= "2014-01-01", to= hoy,
                     src="yahoo", auto.assign = F)[,6]
View(acciones)
plot(acciones)
acciones<-as.data.frame(acciones)
View(acciones)
acciones$Fecha<-rownames(acciones)
rownames(acciones)<-NULL
colnames(acciones)<-c("Precio", "Fecha")
str(acciones)
acciones$Fecha<-as.Date(acciones$Fecha)

##construccion varibales a futuro 
fecha_rango<- (hoy+1):(hoy+30) 
Precio<-as.numeric(NA)
tabla_futuro<-as.data.frame(cbind(Precio, fecha_rango))
View(tabla_futuro)
tabla_futuro$Fecha<-as.Date(tabla_futuro$fecha_rango)
tabla_futuro$fecha_rango<-NULL
str(tabla_futuro)

##Unir las tablas
acciones_completas<-rbind(acciones, tabla_futuro)
View(acciones_completas)
str(acciones_completas)

##separar las variables independientes
Fecha_duplicada<-acciones_completas$Fecha
acciones_completas<-cbind(acciones_completas, Fecha_duplicada)
acciones_completas<-acciones_completas %>% 
  separate(Fecha, c("Año", "Mes", "Dia"))
View(acciones_completas)
str(acciones_completas)
acciones_completas$Año<-as.numeric(acciones_completas$Año)
acciones_completas$Mes<-as.numeric(acciones_completas$Mes)
acciones_completas$D?a<-as.numeric(acciones_completas$Dia)

##filtros
filtro_entrenamiento<-acciones_completas %>% 
  filter(Fecha_duplicada < hoy)
entrenamiento<-createDataPartition(filtro_entrenamiento$Precio,
                                   p=0.7, list = F)
filtro_prueba<-acciones_completas %>% 
  filter(Fecha_duplicada>=hoy)
prueba<-rbind(acciones_completas[-entrenamiento,], 
              filtro_prueba)
View(prueba)

###Modelo randomForest 
install.packages("randomForest")
library(randomForest)

modelo<-randomForest(Precio ~ Año + Mes + Dia,
                     data=acciones_completas[entrenamiento,],
                     type="regression", ntree=100)
prediccion<-predict(modelo, prueba)
datos_comparaci?n<-cbind(prediccion, prueba)
View(datos_comparacion)

ggplot() + geom_line(data = datos_comparacion, 
                     aes(x=Fecha_duplicada, y=Precio),
                     color="red") + geom_line(data = datos_comparacion, 
                                              aes(x=Fecha_duplicada, y=prediccion),
                                              color="blue")
