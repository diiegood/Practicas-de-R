#renombrar filas o columnas
colnames(tabla1)<-c("Calificaciones", "Alumnos")
tabla1
rownames()

##Incorporar otro renglon o columna
rbind()
cbind()
nueva_tabla<-rbind(tabla1,c(10, "Ivan"))
nueva_tabla


##Data frame
##incorporacion de columnas y renglones 

calificacion<-c(7,8)
horas_estudio<-c(4,5)
alumnos<-c("Alejandra", "America")
carrera<-c("economia", "economia")
tabla<-data.frame(calificacion, horas_estudio, 
                  alumnos, carrera)
tabla

##columnas=cbind()
##renglon=rbind()

calificacion<-c(7,8)
horas_estudio<-c(4,5)
alumnos<-c("Alejandra", "America")
carrera<-c("economia", "economia")
tabla<-data.frame(calificacion, horas_estudio, 
                  alumnos, carrera)
tabla

promedio<-c(9.7, 6.3)
feliz<-c(TRUE, TRUE)
tabla_1_1<-data.frame(promedio, feliz)
tabla_1_1
tabla<-cbind(tabla, tabla_1_1)


install.packages("openxlsx")
library(openxlsx)
setwd("C:/Users/ivanc/Downloads/prueba")
write.xlsx(tabla, "prueba.xlsx", asTable = T)

