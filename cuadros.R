#matriz
matriz<-matrix(1:12,nrow=3, ncol=4)
matriz
pelis<-c("sherk1", "sherk2", "sherk3", "sherk4")
cal<-c(10,10,7,6)
cuadro<-matrix(c(pelis, cal), nrow=4, ncol=2)
cuadro

##nombrar columas y renglones#
#para nombrar una matriz se hace como vector argumentando al nombre

colnames(cuadro)<-c("pelis", "cal")
rownames(cuadro)<-c("1","2","3","4")
cuadro
cuadro[3,1]
cuadro[,2]

#para crear tablas en R data,frame# 
cuadro_df<-data.frame(pelis,cal)
cuadro_df[,2]
class(cuadro_df[,1]) #para ver de que tipo de dato es el cuadro#
class(cuadro_df[,2])  #para ver de que tipo de dato es el cuadro#
View(cuadro_df) #Se ecribe con mayuscula y te abre una pestaña con cuadro#
mean(cuadro_df[,2]) #para sacar el promedio del cuadro#
cuadro_df$cal
mean(cuadro_df$cal)
cuadro_df[,"cal"]

#rengolens rownmaes, columnas,colnames"

##renombrar las tablas"
colnames(cuadro_df<-c("chuek", "ponderacion"))
cuadro_df
#rownmames() #renglones
#colnames()  #columnas
#unirtablas
rbind()
cbind()
"se deben llamar igual la tabla"
chuek<-c("sherk5")
ponderacion<-c(10)
nueva_tabla<-rbind(cuadro_df, cuadro )
nueva_tabla


