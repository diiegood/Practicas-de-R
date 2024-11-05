##### Coneval Ejercicio
#################################
## Indicadores de carencia social 
##################################
##Rezago educativo 
install.packages("data.table")
install.packages("dplyr")
install.packages("bit64")
library(bit64)
library(dplyr)
library(data.table)

file.choose()
ruta<-"C:\\Users\\Usuario\\Downloads\\poblacion_csv\\poblacion.csv"
rezaed<-fread(ruta)
View(rezaed)

## quitamos los trabajadores del hogar y huespedes
rezaed<-rezaed %>% filter(!(parentesco>=400 & parentesco < 500 |
                              parentesco >=700 & parentesco <800))

rezaed<-rezaed %>% mutate( 
  ##Año de nacimiento 
  anac_e=case_when(!is.na(edad) ~ 2016-edad))