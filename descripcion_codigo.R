"Tarea 5 Coneval"
"Jorge Diego Valdez Fonseca"



################################################################################
# Parte IV Indicadores de carencias sociales:
# INDICADOR DE CARENCIA POR CALIDAD Y ESPACIOS DE LA VIVIENDA
################################################################################

# Material de construcción de la vivienda

viviendas <- fread("Bases de datos/viviendas.csv") %>% rename_all(tolower)
cev <- viviendas

concen <- fread("Bases de datos/concentradohogar.csv") %>% rename_all(tolower)
cev <- left_join(cev, concen,  by = c("folioviv")) %>% 
  mutate(
    # Indicador de carencia por material de piso de la vivienda
    icv_pisos=as.numeric(mat_pisos), # Material de los pisos de la vivienda
    icv_pisos=case_when(icv_pisos>=2 ~ 0,
                        icv_pisos==1 ~ 1),
    # Indicador de carencia por material de techos de la vivienda
    icv_techos=as.numeric(mat_techos), # Material de los techos de la vivienda
    icv_techos=case_when(icv_techos >=3 ~ 0,
                         icv_techos <=2 ~ 1),
    # Indicador de carencia por material de muros de la vivienda
    icv_muros=as.numeric(mat_pared), # Material de muros en la vivienda
    icv_muros=case_when(icv_muros >=6 ~ 0,
                        icv_muros <=5 ~ 1),
    
    # Espacios en la vivienda (Hacinamiento)
    # Número de residentes en la vivienda
    num_ind = tot_resid ,
    # Número de cuartos en la vivienda
    num_cua = num_cuarto ,
    # Índice de hacinamiento
    cv_hac=num_ind/num_cua,
    # Indicador de carencia por hacinamiento en la vivienda
    icv_hac=case_when(
      cv_hac>2.5 & !is.na(cv_hac) ~ 1,
      cv_hac<=2.5 ~ 0 ))

# Indicador de carencia por calidad y espacios de la vivienda
################################################################################
# Se considera en situación de carencia por calidad y espacios 
# de la vivienda a las personas que residan en viviendas
# que presenten, al menos, una de las siguientes características:
#  
# 1. El material de los pisos de la vivienda es de tierra
# 2. El material del techo de la vivienda es de lámina de cartón o desechos.
# 3. El material de los muros de la vivienda es de embarro o bajareque, de
#    carrizo, bambú o palma, de lámina de cartón, metálica o asbesto, o
#    material de desecho
# 4. La razón de personas por cuarto (hacinamiento) es mayor que 2.5
################################################################################

cev <- mutate(cev,
              ic_cv=case_when(
                is.na(icv_pisos) | is.na(icv_techos) | is.na(icv_muros) | is.na(icv_hac) ~ NA_real_,
                icv_pisos==1 | icv_techos==1 | icv_muros==1 | icv_hac==1 ~ 1, # Con carencia
                icv_pisos==0 & icv_techos==0 & icv_muros==0 & icv_hac==0 ~ 0, # Sin carencia
              )) %>%
  select(folioviv, foliohog, icv_pisos, icv_techos, 
         icv_muros, icv_hac, ic_cv) 

fwrite(cev, "Bases/ic_cev16.csv", row.names=F)
gdata::keep(rezedu, salud, segsoc, cev, concen, viviendas, pobla, sure=T)

################################################################################
"Analisis del Codigo"

#En la primera linea se puede ver que se genera un vector llamado viviendas y en este contiene 
#la paqueteria del fread, que alberga bases de datos de las viviendas por lo que esta llamando un archivo
#de caracter csv, que es el de viviendas que esta drentode la carpeta de bases de datos, por lo que se llama
#y se le genera un valor pipe para filtrar, donde se le va cambiar el nombre a todas las columnas que pertenecen
#al vector de viviendas donde se le aplica la funcion "tolower()" para convertir el nombre en Mayusculas.
#al ultimo le cambia de nombre al vector de viviendas por el de "cev".

#Despues se vuelve a otro vector pero que muestre los datos con relacion a la concentracion del hogar,
#que le el archivo de la carpeta de base de datos y carga la concentracion del data frame, a su vez convierte los nombres
#en columnas con mayusculas como en el anterior, se pide unir los data frames creados de los dastos 
#que se craron anteriormiento el de viviendas y el de concentracion, donde tambien tiene un operador pipe y
#un indicador de mutate para condicionar y con base a ello clasificar parecido a la practica de la escolaridad
#por lo que  dice que si el material de pisos es mayor o igual a 2 se le asigna un valor cero y si este es igual a 1 se le asigna un valor a 1
#esto es para clasificar el tipo de vivienda y ver en que rango entra, por lo que con el codigo de coneval lo clasifican
#siendo esta primera carateristica la del piso, despues con la de techo es similar si se clasifica el vector de 
#icv_techos mayor igual a 3 este se traspociona a 0 y si este es menor igual a 2 se traspociona  a 2.
#por ultimo se ve el de los muros donde de forma similar se acomoda y se clasifica si el de los muros es mayor igual a 6 entra en la clasificacion 0
#si esta clasificaciones menor igual a 5 se traspociona a 1

"Por lo que se puede ver para concluir que coneval tiene tres parametros en sentido:"
#pisos / con valores de 2 y 1
#techos / con valores de 3 y 2
#muros / con valores de 6 y 5

#donde cada valor se le asigna si bien 0 o 1 en la clasificacion, para ver en que rango entran
#teniendo en cuenta la calidad del material de viienda, numero de gente que vive, cuartos, hacinamiento, indicador de carencia de hacinamiento.
#se generan 3 funciones con estos valores, numero de residentes / num_ind (siendot el total de residentes)
#num_acua (siendo el numero de cuartos), estos valores ya estan definidos por asignaciones de la base de datos
#pero el ultimo valor de ("cv_hac") se genera dividiendo las funciones anteriores num_ind/num_cua, osea
#dividiendo el numero de residentes sobre el numero de cuartos para ver el indice de carencia de hacinamiento

"Este indice ya esta definido con valores por lo que tiene como parametro predeterminado el valor de 2.5" 
#dandonos a entender que si el valor del indice de hacinamiento es mayor a 2.5 este tiene un condicional de que no
#se le asignara un 1, y se asigna un 0 si no cumple otra condicion porque tiene una negacion de que si no cumple este valor
#con el operador de !, por lo que el indice entra o se traspociona  1 y si este es menor a 2.5 se traspociona a 0.

#dentro de el ultimo vector de cev, se tiene una funcion para cerar una columna en el data frame, llamada "ic_cv"
#donde en este nuevo vector se verifican criterios, de pisos, techos, muros, ademas del indice para ver si
#pertenecen a este nuevo data frame y que cambie el valor de la columna por una transpocion a uno llamado NA_real
#donde se tiene otro filtrado de los valores posteriormente filtrado dividiendo bajo los 3 cirterios mencionados
#los que cumplen con el valor de 1 se asigna a carencia y los que cumplen al 0 sin carencia , teniendo en cuenta
#los parametros de pisos, techos, muros, indice.

#Al ultimo se ve que se genera un select que es para ver que columnas va mantener en el dataframe y cuales va
#meter en un nuevo dataframe, segun las clasificaciones previamente vistas, en los 5 rubros de medicion.
#de carencia, que son:
#techo
#pisos
#muros
#nueva funcion creada, con la separacion de valores de esos parametros de o y 1
#indice

"Por lo que al ultimo simplemente se escribe la ultima funcion creada, donde se filtro todo en dif parameteros"
#y se mete en la base de datos de /"ic_cev16.cxv", donde se subira a la base de datos, donde se le dice con una
#funcion de row.names = F que no incluya esos valores "que se generan automaticamente para señalar las columnas" al exportar esa base de datos.
#si no que exporte solo los datos de las listas creadas.
#al ultimo se tiene una funcion de ("gdata::keep"), donde ahi se mantiene solo las variables mencionadas
#que fueron los datos limpiados de la informacion para generar los parametros de clasificacion con carencia y sin carencia.
#teniendo como ultimos paramteros , resago educativo, sesgosocial, carancia de espacios, concentracion, vivienda, poblacion, todo en una lista
#para tener diferentes parametros de medicion de la pobreza de coneval.