#Traiding Cuantitativo : Modelo Garch para estimacion de Volatilidad.

#Criticas del modelo, la variabilidad de las series financieras no son contastantes, 
#en el tiempo, no es constante la volatilidad, ya que varia demasiado inclusive en 1 dia

#Modelo Garch intenta modelizar la variabilidad de la serie financiera, en comparacion
#Markowitz no lo tiene en cuenta, asumiendo la volatilidad de manera no constante.

#Cambios en la volatilidad--> Heterocedasticidad: 
#Por eso se nombran auto-regresivos de heterocedasticidad

#La heterocedasticidad es un patron de variacion en los residuos, de un modelo estadistico
#donde la varianza no es constante, ya que la dispersion de los residuos es desigual.


#Con el garch estudiando el pasado de la serie financiera (volatilidad)  se busca, 
#calcular el valor futuro. 

#cartera de divisas de GARCH
if (!requireNamespace("quantmod", quietly = TRUE)) {
  install.packages("quantmod")}


"instalar paqueteria"
#install.packages("quantmod")
library(quantmod)

getFX(c("MXN/SEK", "MXN/EUR", "MXN/USD", "GBP/USD", "USD/CHF", "USD/CAD",
        "USD/JPY", "MXN/JPY"))

#Calculo de Retornos Logaritmicos.

MXN<-na.omit(diff(log(MXNUSD)))
MXNS<-na.omit(diff(log(MXNSEK)))
MXNE<-na.omit(diff(log(MXNEUR)))
MXNJ<-na.omit(diff(log(MXNJPY)))
GBP<-na.omit(diff(log(GBPUSD)))
USDCH<-na.omit(diff(log(USDCHF)))
USDC<-na.omit(diff(log(USDCAD)))
USDJ<-na.omit(diff(log(USDJPY)))


#graficos 

#install.packages("fBasics")
library(fBasics)

skewness(MXN) #para poder medir la asimetria de la divisa mexicana

#se cargan histogramas de las matrices / con esto vemos la distribucion si se 
#aleja de la normal o tiene otro comportamiento, para poder modelar la serie.


hist(MXN,breaks = 20)
hist(MXNS,breaks = 20)
hist(MXNE,breaks = 20)
hist(MXNJ, breaks= 20)
hist(GBP, breaks= 20)
hist(USDCH, breaks= 20)
hist(USDC, breaks= 20)
hist(USDJ, breaks= 20)

#modelar la serie / con el modelo GARCH
#install.packages("fGarch")
"al usar el modelado del garchFit o garch, se incluyen diversos componentes como:"
#coeficiente estimado
#desviacion estandar condicional (sigma t)
#residuos estandarizados(residuos)

"simbolos / @ es para el objeto / $ es para acceder al data.frame"

library(fGarch)
#cond.dist "norm" (para la distribucion normal)
#cond.dist "sstd" (para la distribucion student)

MXN.garch <-garchFit(~garch(1,1), MXN, cond.dist = "norm", trace = FALSE)
MXNS.garch <-garchFit(~garch(1,1), MXNS, cond.dist = "norm", trace = FALSE)
MXNE.garch <-garchFit(~garch(1,1), MXNE, cond.dist = "norm", trace = FALSE)
MXNJ.garch <-garchFit(~garch(1,1), MXNJ, cond.dist = "norm", trace = FALSE)
GBP.garch <-garchFit(~garch(1,1), GBP, cond.dist = "norm", trace = FALSE)
USDCH.garch <-garchFit(~garch(1,1), USDCH, cond.dist = "norm", trace = FALSE)
USDC.garch <-garchFit(~garch(1,1), USDC, cond.dist = "norm", trace = FALSE)
USDJ.garch <-garchFit(~garch(1,1), USDJ, cond.dist = "norm", trace = FALSE)

#"Correcion"
#MXN.garch <- garchFit(formula = ~ garch(1, 1), data = MXN, cond.dist 
                      #= "norm", trace = FALSE)

#MXNS.garch <- garchFit(formula = ~ garch(1, 1), data = MXNS, cond.dist 
                      #= "norm", trace = FALSE)

#Standarization :
#el valor de la serie partido desde la desviacion estandar, pero la
#que se obtuvo con la modelizacion del garch (garch modela la volatilidad de la serie)
#se busca que la serie sea mas estandar desde el punto de vista de la volatilidad
"se calcula la volatilidad de forma diferente y no con la desviacion tipica normal"


"simbolo @" #sirve para poder acceder a slots del objeto o tambien para extraer 
#ciertos componentes o atributos de los objetos definidos bajo esa clase,
#en este caso se nombro en la paqueteria garch, por lo que es para extraerlo de ahi


MXN.stand <- MXN / MXN.garch@sigma.t
MXNS.stand <-MXNS / MXNS.garch@sigma.t
MXNE.garch <-MXNE / MXNE.garch@sigma.t
MXNJ.garch <-MXNJ /MXNJ.garch@sigma.t
GBP.garch <-GBP /GBP.garch@sigma.t
USDCH.garch <-USDCH /USDCH.garch@sigma.t
USDC.garch <-USDC /USDC.garch@sigma.t
USDJ.garch <-USDJ /USDJ.garch@sigma.t

#Calculo de correlaciones y covarianzas.

correlacion <- cor(cbind(MXN.stand, MXNS.stand, MXNE.stand, MXNJ.stand, GBP.stand,
                         USDCH.stand, USDC.stand, USDJ.stand))
  
covarianza <- cov(cbind(MXN.stand, MXNS.stand, MXNE.stand, MXNJ.stand, GBP.stand,
                         USDCH.stand, USDC.stand, USDJ.stand))



"11:35 video"





