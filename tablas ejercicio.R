#construccion de tablas de data frame#
#union de columnas y renglones de tablas#

rbind() #columna   dataframe matriz permite que los datos no sean todos caracter / matriz 
cbind()  #renglon   vector solo acepta elementos del mismo tipo 

nombre<-c("aldo", "viriana", "Luis" )
horas_de_estudio <-c(4,5,4 )
calificacion_esperadas<-c(9,8,9 )
area_economia<-c("historia", "historia","finanzas")
Felicidad<-c(TRUE, TRUE, TRUE)
promedio <- mean(horas_de_estudio)
promedio

class(nombre)
class(horas_de_estudio)
class(calificacion_esperadas)
class(area_economia)
class(Felicidad)

tabla<-data.frame(nombre, horas_de_estudio, promedio)
tabla_1<-data.frame(area_economia, Felicidad)
tabla
tabla_1
tablas<-cbind(tabla,tabla_1)
tablas
datos<-data.frame(nombre, calificacion_esperadas, area_economia, Felicidad, horas_de_estudio)

tab_1<-cbind(tabla, tabla_1)
tab_2<-cbind(tabla, tabla_1)

#para exportar datos a excel#
install.packages("openxlsx")  #para instalar la paqueteria#

library(openxlsx)  #para usar la paqueteria#
"C:/Users/creep/OneDrive/Escritorio/rdatos"  #ruta de la carpeta#
# "/" cambio de ruta significa que vas a extraer informacion de esa ruta#

setwd("C:/Users/creep/OneDrive/Escritorio/rdatos") #se le pone comillas a la direccion#
write.xlsx(datos, "prueba.xlsx")
