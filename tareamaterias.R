#primer semestre#
primer_semestre<-c("historia_economica_gral_I", "ecopol_I", "introduccion_teoria_economica_I", "metodos_cuantitativos_I", "contanilidad_gral_costos_I", "INAE_I", "taller_economia_cuantitativa_I")
calificaciones1<-c(10,10,8,8,8,9,9)
cuadro_primer_semestre<-matrix(c(primer_semestre, calificaciones1), nrow=7, ncol=2)
cuadro_primer_semestre
colnames(cuadro_primer_semestre)<-c("materias", "calificaciones")
rownames(cuadro_primer_semestre)<-c("materia_interesante","materia_aburrida","materia_interesante","materia_dificil", "materia_aburrida", "materia_aburrida", "materia_interesante")
cuadro_primer_semestre
cuadro_semestre1<-data.frame(primer_semestre,calificaciones1)
View(cuadro_semestre1)
promedio_primer_semestre <- mean(calificaciones1)
promedio_primer_semestre

#segundo semestre#
segundo_semestre<-c("historia_economica_gral_II", "ecopol_II", "Teoria_Microeconomica_I", "Matematicas_I", "Contabilidad_Social", "INAE_II", "Taller_economia_cuantitativa_II")
calificaciones2<-c(7,9,8,8,9,9,10)
cuadro_segundo_semestre<-matrix(c(segundo_semestre, calificaciones2), nrow=7, ncol=2)
cuadro_segundo_semestre
colnames(cuadro_segundo_semestre)<-c("materias", "calificaciones")
rownames(cuadro_segundo_semestre)<-c("materia_aburrida", "materia_aburridisima", "materia_interesante", "materia_dificil", "materia_aburrida", "materia_aburrida", "materia_interesante")
cuadro_segundo_semestre
cuadro_semestre2<-data.frame(segundo_semestre,calificaciones2)
View(cuadro_semestre2)
promedio_segundo_semestre<-mean(calificaciones2)
promedio_segundo_semestre

#tercer semestre#
tercer_semestre<-c("historia_pensamiento_economico", "ecopol_III", "Matematicas_III", "Analisis_Estados_Financieros", "INAE_III", "Taller_Economia_Cuantitativa_III", "Teoria_Microeconomica_II")
calificaciones3<-c(10,10,8,7,10,9,10)
cuadro_tercer_semestre<-matrix(c(tercer_semestre, calificaciones3), nrow=7, ncol=2)
cuadro_tercer_semestre
colnames(cuadro_tercer_semestre)<-c("materias", "calificaciones")
rownames(cuadro_tercer_semestre)<-c("materia_intersante", "materia_aburridisima", "materia_interesante", "materia_aburrida", "materia_aburrida", "materia_interesante", "materia_interesante")
cuadro_tercer_semestre
cuadro_semestre3<-data.frame(tercer_semestre, calificaciones3)
View(cuadro_semestre3)
promedio_tercer_semestre<-mean(calificaciones3)
promedio_tercer_semestre

#cuarto semestre#
cuarto_semestre<-c("Teoria_Macroeconomica_I", "historia_economica_mexico_I", "Ecopol_IV", "Estadistica", "Formulacion_Eval_Proyectos", "INAE_IV", "Taller_Eco_Cuantitativa_IV")
calificaciones4<-c(9,8,9,10,7,9,8)
cuadro_cuarto_semestre<-matrix(c(cuarto_semestre, calificaciones4),nrow=7, ncol=2)
cuadro_cuarto_semestre
colnames(cuadro_cuarto_semestre)<-c("materias", "calificaciones")
rownames(cuadro_cuarto_semestre)<-c("materia_intersante", "materia_aburridisima", "materia_aburrida", "materia_interesante", "materia_aburrida", "materia_aburrida", "materia_interesante")
cuadro_cuarto_semestre
cuadro_semestre4<-data.frame(cuarto_semestre, calificaciones4)
View(cuadro_semestre4)
promedio_cuarto_semestre<-mean(calificaciones4)
promedio_cuarto_semestre

#quinto semestre#
quinto_semestre<-c("Historia_Economica_Mexico_II", "Economia_Politica_V", "Teoria_Macroeconomica_II", "Introduccion_Econometria", "Economia industrial", "INAE_V", "Taller_Economia_Cuantitativa")
calificaciones5<-c(9,9,10,8,10,10,10)
cuadro_quinto_semestre<-matrix(c(quinto_semestre, calificaciones5),nrow = 7, ncol=2)
cuadro_quinto_semestre
colnames(cuadro_quinto_semestre)<-c("materias", "calificaciones")
rownames(cuadro_quinto_semestre)<-c("materia_aburrida", "materia_aburridisima", "Materia interesante", "Materia_interesante", "Materia_aburrida", "Materia_aburrida", "Materia_interesante")
cuadro_quinto_semestre
cuadro_semestre5<-data.frame(quinto_semestre, calificaciones5)
View(cuadro_semestre5)
promedio_quinto_semestre<-mean(calificaciones5)
promedio_quinto_semestre

#sexto semestre#
sexto_semestre<-c("Economia_Mexicana_I", "Estructura_Economica_Mundial", "Economia_Internacional", "Teoria_Monetaria_Politica_Financiera", "Finanzas_publicas", "Desarrollo_Economico", "Taller_Economia_Cuantitativa_VI")
calificaciones6<-c(9,6,8,7,7,10,9)
cuadro_sexto_semestre<-matrix(c(sexto_semestre, calificaciones6), nrow = 7, ncol = 2)
cuadro_sexto_semestre
colnames(cuadro_sexto_semestre)<-c("materias", "calificacones")
rownames(cuadro_sexto_semestre)<-c("materia_aburrida", "materia_aburrida", "materia_aburrida", "materia_aburrida", "materia_aburrida", "materia_intersante", "materia_interesante")
cuadro_sexto_semestre
cuadro_semestre6<-data.frame(sexto_semestre, calificaciones6)
View(cuadro_semestre6)
promedio_sexto_semestre<-mean(calificaciones6)
promedio_sexto_semestre

#septimo semestre Nucleo Terminal#
septimo_semestre<-c("Economia_Mexicana_II", "Formulacion_Proeyctos__II", "Economia_Internacional_II", "Economia_America_Norte", "Economia_Europea", "Finanzas_Bursatiles")
calificaciones7<-c(9, 10, 10, 7, 8, 10)
cuadro_septimo_semestre<-matrix(c(septimo_semestre, calificaciones7), nrow= 6, ncol=2)
cuadro_septimo_semestre
colnames(cuadro_septimo_semestre<-c("materias", "calificaciones")
rownames(cuadro_septimo_semestre-c("materia_aburrida", "materia_interesante", "materia_aburrida", "materia_aburrida",  "materia_aburrida", "materia_intersante")
cuadro_septimo_semestre
cuadro_semestre7<-data.frame(septimo_semestre, calificaciones7)
View(cuadro_semestre7)
promedio_septimo_semestre<-mean(calificaciones7)
promedio_septimo_semestre

