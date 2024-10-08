#Ejercicio
####Paso 1 crear vectores de materias y calificaciones
materias=c("Ecopol","Metodos","INAE1","Taller","Teoec","conta","Histo UNI")
calificaciones=c(8,9,7,8,9,8,9)
####Crear la tabla del primer semestre
Primer_semestre=data.frame(materias,calificaciones)
Promedio_Primer_semestre=mean(calificaciones)
semestre2<-data.frame(materias=c("Ecopol","Mate",
                                 "INAE2","Taller2",
                                 "Micro",
                                 "ContaSocial",
                                 "Historia"),calificaciones=c(7,8,9,6,10,8,9))
PromedioSem2<-mean(semestre2$calificaciones)
PromedioSem2

Historia_Academico<-rbind(Primer_semestre,semestre2)


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
  geom_line(aes(y=EU, colour="EU"), size=2) 

