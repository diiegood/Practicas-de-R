##vectores 
vector1<-c(14,15,18,20)
vector1[2]
promedio<-mean(vector1)

#Ejercicio de bancos 
bancos<-c("HSBC", "Banamex", "Bancomer", "Santander", "Banco Azteca")
calificaciones<-c(8.5, 7.6, 9.2, 8.3, 6.3)
preferencias<-c(T, F, T, T, F)
calificaciones_mayores_8<-calificaciones>8
calificaciones_mayores_8
calificaciones[calificaciones_mayores_8]
bancos[calificaciones_mayores_8]



##Ejercicio 
##Ejercicio 
##paso 1. Construir un vector  con los nombres de las peliculas
##paso 2. vector con calificaciones
##paso 3. Determinar un objeto que albergue las calificaciones
##        superiores al promedio 
##paso 4. Ver las calificaciones superiores 
##paso 5. Observar los nombres de dichas calificaciones

peli_shrek <- c('Sh1','Sh2','Sh3','Sh4')
calif_shrek <- c(10,9.8,8,6.5)
prom_calif <- mean(calif_shrek)
prom_calif

calif_shrek_mayor <- calif_shrek>prom_calif
calif_shrek_mayor

calif_shrek[calif_shrek_mayor]
peli_shrek[calif_shrek_mayor]


##matriz
matriz<-matrix(1:12, nrow= 6, ncol=6)
matriz
?matrix
colnames()
rownames()