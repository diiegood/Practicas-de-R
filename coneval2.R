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

tabla<-data.frame(nombre=c("Ana", "Paty", "Pedro", "Juan"), 
           nota=c(95, 82, 67, 73))
#clasificación de notas
tabla<-tabla %>% mutate(clasificaciones=case_when(
  nota>=90 ~ "Excelente",
  nota>=80 ~ "Bueno",
  nota>=70 ~ "Mejorar",
  TRUE ~ "Masomenos"))
View(tabla)
View(rezaed)
rezaed$ni
rezaed<-rezaed %>% mutate(
  #Año de nacimiento 
  año_n=case_when(!is.na(edad)~ 2016 - edad),
  #Inasistencia escolar 
  inas_esc=case_when(asis_esc==1~0, #Sí asiste
                     asis_esc==2~1), #No asiste
  #Nivel educativo 
  nivel_ed=case_match(
    #Primaria incompleta o menos
    (nivelaprob<2) | (nivelaprob==2 & gradoaprob<6) ~ 0,
    #Primaria completa o secundaria incompleta
    (nivelaprob==2 & gradoaprob ==6 ) | (nivelaprob==3 & gradoaprob<3) ~ 1,
    #Secundaria completa o media superior incompleta
    (nivelaprob==3 & gradoaprob ==3) |
      (nivelaprob==4 & gradoaprob<3) |
      nivelaprob==6 & gradoaprob>=3 & inas_esc)
    
    
  )
  )