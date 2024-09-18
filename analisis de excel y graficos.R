#primero se importa la libreria#
install.packages("xlxs")
install.packages("readxl")
library(readxl)

#funcion para abrir una documento de excel#
file.choose() #correr la funcion#
#despues en la consola se refleja la busqueda#
ruta<- "C:\\Users\\creep\\OneDrive\\Escritorio\\Datos muestra para la clase.xlsx"
#doble diagonal significa abrir archivo o consulta#

#funciones de extraccion#
tabla<-read_excel(ruta) #importa por defecto 
View(tabla)
tabla<-read_excel(ruta,sheet = "PIB") #se importa por hoja de excel, especificada#
View(tabla)
#tabla<-read_excel(ruta,sheet = "Sector", range = "A27:E49") #se importa por rango seleccionando la celda
#View(tabla)#

#tambien se puede importar en >Enviroment>ImportDatabase>FromExcel>buscardireccion

#para buscar en data frame#
tabla
tabla<-data.frame(tabla)
tabla

#para redondear valores funcion round#
tabla<-(data.frame(round(tabla),2))
tabla
View(tabla)

#graficas  $para especificar eje de y, 

plot(tabla$Año, tabla$China.2, type="l", lwd=2, col="red", xlab= "Año", 
     ylab="PIB", main= "Tasa de crecimiento PIB", sub= "Fuente: Banco de Mexico")
View(tabla)
grid()
#graficar tasas juntas#
par(cex=.8)
plot(tabla$Año, tabla$México.2, type="l", lwd=2, col="blue", xlab= "Año", 
     ylab="PIB", main= "Tasa de crecimiento PIB", sub= "Fuente: Banco de Mexico")
lines(tabla$Año, tabla$China.2, col="green")
lines(tabla$Año, tabla$EU.2, col="black")

#a quien le pertenece la leyenda#
legend(x=2000, y=-10, col=c( "blue", "green","black"),
      legend = c( "Mexico", "China", "EUA"), lwd=2)

max(tabla$China.2) #valores maximos y minimos con respecto a china
min(tabla$China.2)

#graficar tablas separadas en una imagen#
par(cex=1, mfrow=c(1,3))
plot(tabla$Año, tabla$China.2, type="l", lwd=2, col="purple", xlab= "Año", 
     ylab="PIB", main= "Tasa de crecimiento PIB", sub= "Fuente: Banco de Mexico")
plot(tabla$Año, tabla$México.2, type="l", lwd=2, col="brown", xlab= "Año", 
     ylab="PIB", main= "Tasa de crecimiento PIB", sub= "Fuente: Banco de Mexico")
plot(tabla$Año, tabla$EU.2, type="l", lwd=2, col="orange", xlab= "Año", 
     ylab="PIB", main= "Tasa de crecimiento PIB", sub= "Fuente: Banco de Mexico")