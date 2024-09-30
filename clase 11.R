##Importar datos de excel 
installed.packages("readxl")
library(readxl)
file.choose()
ruta<-"C:\\Users\\Usuario\\Downloads\\Datos muestra para la clase.xlsx"
##lo importa por defecto 
tabla<-read_excel(ruta)
View(tabla)
##lo importa por pestaña 
tabla<-read_excel(ruta, sheet = "PIB")

##lo importa por selección de tabla y pestaña
tabla<-read_excel(ruta, sheet = "Sector", range = "A27:E49")
tabla



tabla<-data.frame(tabla)
tabla
tabla<-(data.frame(round(Datos_muestra_para_la_clase, 2)))

##gráficas
#básica
plot(tabla$Año, tabla$México)
plot(tabla$Año, tabla$México, type="l", lwd= 2, col="red",
     xlab="Año", ylab="PIB", 
     main= "Tasa de crecimiento PIB",
     sub= "Fuente: Banco Mundial")
grid()

#graficar tasas juntas 
par(cex= .8)
plot(tabla$Año, tabla$México, 
     main="Tasa de crecimiento PIB", type="l", col="red",
     xlab="Año", ylab="PIB", ylim=c(-30, 20))
lines(tabla$Año, tabla$China, col="blue")
lines(tabla$Año, tabla$EU, col="green")
legend(x=2000, y=-10, col=c("red", "blue", "green"), 
       legend = c("México", "China", "EU"), lwd=2)
max(tabla$China)
min(tabla$China)

##graficar tablas separadas en una imagen 
par(cex=1, mfrow=c(1,3))
plot(tabla$Año, tabla$México, 
     main="Tasa de crecimiento PIB MX", type="l", col="red",
     xlab="Año", ylab="PIB")
plot(tabla$Año, tabla$China, 
     main="Tasa de crecimiento PIB CH", type="l", col="blue",
     xlab="Año", ylab="PIB")
plot(tabla$Año, tabla$EU, 
     main="Tasa de crecimiento PIB EU", type="l", col="green",
     xlab="Año", ylab="PIB")