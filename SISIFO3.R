###################################################################
##                                                               ##
##               S    Í    S    I    F    O    3                 ##
##                                                               ##
###################################################################

# Este script de R lee las listas brutas de las 5 asignaturas de 3º
# y reparte a los estudiantes en 4 grupos de prácticas equilibrados
# de la manera más equitativa posible.

# Para utilizarlo, hay que instalar R:
# https://cran.rediris.es/

# En el mismo directorio (carpeta) donde pongas este script debes
# meter los listados CSV que genera el campus virutal para cada
# asignatura (con todos los alumnos), con estos nombres:

# anim.csv
# ecol.csv
# gene.csv
# micr.csv
# vege.csv

# Quitar los estudiantes exentos de prácticas.  Hay que borrar la
# línea completa correspondiente a cada uno, manteniendo el forma-
# to CSV del documento.  Utilizar un editor de texto, con una hoja
# de cálculo (~excel~) se corre el riesgo de cambiar el formato.

# Y, finalmente ejecutar el script (en una terminal) con la ins-
# trucción:
# Rscript SISIFO3.R

print("pepillo")

###################################################################
###################################################################

# LEER LOS FICHEROS CON LAS LISTAS BRUTAS
lista.anim.bruta <- read.csv("anim.csv")
lista.ecol.bruta <- read.csv("ecol.csv")
lista.gene.bruta <- read.csv("gene.csv")
lista.micr.bruta <- read.csv("micr.csv")
lista.vege.bruta <- read.csv("vege.csv")

########################### P A S O  1 ############################
# PURIFICAR LAS LISTAS Y SEPARAR LOS DOS TURNOS (A y B)

# FISIOLOGÍA ANIMAL
lista.anim.A <- data.frame(matrix(ncol = 3, nrow = 0))
colnames(lista.anim.A) <- c("DNI", "Nombre", "Apellidos")
lista.anim.B <- lista.anim.A
ultimog <- "A"
for (i in 1:nrow(lista.anim.bruta)) {
  grupo <- as.character(lista.anim.bruta[i,"Inscripción"])
  grupo <- substr(grupo, nchar(grupo), nchar(grupo))
  if (grupo == "A"){
    lista.anim.A[i,1] <- as.character(lista.anim.bruta[i,"DNI.NIE.Pasaporte"])
    lista.anim.A[i,2] <- as.character(lista.anim.bruta[i,"Nombre"])
    lista.anim.A[i,3] <- as.character(lista.anim.bruta[i,"Apellido.s"])
    ultimog <- "A"
  }
  if (grupo == "B"){
    lista.anim.B[i,1] <- as.character(lista.anim.bruta[i,"DNI.NIE.Pasaporte"])
    lista.anim.B[i,2] <- as.character(lista.anim.bruta[i,"Nombre"])
    lista.anim.B[i,3] <- as.character(lista.anim.bruta[i,"Apellido.s"])
    ultimog <- "B"
  }
  if ( (grupo != "A") & (grupo != "B") ){
    if (ultimog == "A"){
      lista.anim.A[i,1] <- as.character(lista.anim.bruta[i,"DNI.NIE.Pasaporte"])
      lista.anim.A[i,2] <- as.character(lista.anim.bruta[i,"Nombre"])
      lista.anim.A[i,3] <- as.character(lista.anim.bruta[i,"Apellido.s"])
      ultimog <- "A"
    }
    if (ultimog == "B"){
      lista.anim.B[i,1] <- as.character(lista.anim.bruta[i,"DNI.NIE.Pasaporte"])
      lista.anim.B[i,2] <- as.character(lista.anim.bruta[i,"Nombre"])
      lista.anim.B[i,3] <- as.character(lista.anim.bruta[i,"Apellido.s"])
      ultimog <- "B"
    }
  }
}
lista.anim.A <- na.omit(lista.anim.A)
lista.anim.B <- na.omit(lista.anim.B)

# ECOLOGÍA
lista.ecol.A <- data.frame(matrix(ncol = 3, nrow = 0))
colnames(lista.ecol.A) <- c("DNI", "Nombre", "Apellidos")
lista.ecol.B <- lista.ecol.A
ultimog <- "A"
for (i in 1:nrow(lista.ecol.bruta)) {
  grupo <- as.character(lista.ecol.bruta[i,"Inscripción"])
  grupo <- substr(grupo, nchar(grupo), nchar(grupo))
  if (grupo == "A"){
    lista.ecol.A[i,1] <- as.character(lista.ecol.bruta[i,"DNI.NIE.Pasaporte"])
    lista.ecol.A[i,2] <- as.character(lista.ecol.bruta[i,"Nombre"])
    lista.ecol.A[i,3] <- as.character(lista.ecol.bruta[i,"Apellido.s"])
    ultimog <- "A"
  }
  if (grupo == "B"){
    lista.ecol.B[i,1] <- as.character(lista.ecol.bruta[i,"DNI.NIE.Pasaporte"])
    lista.ecol.B[i,2] <- as.character(lista.ecol.bruta[i,"Nombre"])
    lista.ecol.B[i,3] <- as.character(lista.ecol.bruta[i,"Apellido.s"])
    ultimog <- "B"
  }
  if ( (grupo != "A") & (grupo != "B") ){
    if (ultimog == "A"){
      lista.ecol.A[i,1] <- as.character(lista.ecol.bruta[i,"DNI.NIE.Pasaporte"])
      lista.ecol.A[i,2] <- as.character(lista.ecol.bruta[i,"Nombre"])
      lista.ecol.A[i,3] <- as.character(lista.ecol.bruta[i,"Apellido.s"])
      ultimog <- "A"
    }
    if (ultimog == "B"){
      lista.ecol.B[i,1] <- as.character(lista.ecol.bruta[i,"DNI.NIE.Pasaporte"])
      lista.ecol.B[i,2] <- as.character(lista.ecol.bruta[i,"Nombre"])
      lista.ecol.B[i,3] <- as.character(lista.ecol.bruta[i,"Apellido.s"])
      ultimog <- "B"
    }
  }
}
lista.ecol.A <- na.omit(lista.ecol.A)
lista.ecol.B <- na.omit(lista.ecol.B)

# GENÉTICA
lista.gene.A <- data.frame(matrix(ncol = 3, nrow = 0))
colnames(lista.gene.A) <- c("DNI", "Nombre", "Apellidos")
lista.gene.B <- lista.gene.A
ultimog <- "A"
for (i in 1:nrow(lista.gene.bruta)) {
  grupo <- as.character(lista.gene.bruta[i,"Inscripción"])
  grupo <- substr(grupo, nchar(grupo), nchar(grupo))
  if (grupo == "A"){
    lista.gene.A[i,1] <- as.character(lista.gene.bruta[i,"DNI.NIE.Pasaporte"])
    lista.gene.A[i,2] <- as.character(lista.gene.bruta[i,"Nombre"])
    lista.gene.A[i,3] <- as.character(lista.gene.bruta[i,"Apellido.s"])
    ultimog <- "A"
  }
  if (grupo == "B"){
    lista.gene.B[i,1] <- as.character(lista.gene.bruta[i,"DNI.NIE.Pasaporte"])
    lista.gene.B[i,2] <- as.character(lista.gene.bruta[i,"Nombre"])
    lista.gene.B[i,3] <- as.character(lista.gene.bruta[i,"Apellido.s"])
    ultimog <- "B"
  }
  if ( (grupo != "A") & (grupo != "B") ){
    if (ultimog == "A"){
      lista.gene.A[i,1] <- as.character(lista.gene.bruta[i,"DNI.NIE.Pasaporte"])
      lista.gene.A[i,2] <- as.character(lista.gene.bruta[i,"Nombre"])
      lista.gene.A[i,3] <- as.character(lista.gene.bruta[i,"Apellido.s"])
      ultimog <- "A"
    }
    if (ultimog == "B"){
      lista.gene.B[i,1] <- as.character(lista.gene.bruta[i,"DNI.NIE.Pasaporte"])
      lista.gene.B[i,2] <- as.character(lista.gene.bruta[i,"Nombre"])
      lista.gene.B[i,3] <- as.character(lista.gene.bruta[i,"Apellido.s"])
      ultimog <- "B"
    }
  }
}
lista.gene.A <- na.omit(lista.gene.A)
lista.gene.B <- na.omit(lista.gene.B)

# MICROBIOLOGÍA
lista.micr.A <- data.frame(matrix(ncol = 3, nrow = 0))
colnames(lista.micr.A) <- c("DNI", "Nombre", "Apellidos")
lista.micr.B <- lista.micr.A
ultimog <- "A"
for (i in 1:nrow(lista.micr.bruta)) {
  grupo <- as.character(lista.micr.bruta[i,"Inscripción"])
  grupo <- substr(grupo, nchar(grupo), nchar(grupo))
  if (grupo == "A"){
    lista.micr.A[i,1] <- as.character(lista.micr.bruta[i,"DNI.NIE.Pasaporte"])
    lista.micr.A[i,2] <- as.character(lista.micr.bruta[i,"Nombre"])
    lista.micr.A[i,3] <- as.character(lista.micr.bruta[i,"Apellido.s"])
    ultimog <- "A"
  }
  if (grupo == "B"){
    lista.micr.B[i,1] <- as.character(lista.micr.bruta[i,"DNI.NIE.Pasaporte"])
    lista.micr.B[i,2] <- as.character(lista.micr.bruta[i,"Nombre"])
    lista.micr.B[i,3] <- as.character(lista.micr.bruta[i,"Apellido.s"])
    ultimog <- "B"
  }
  if ( (grupo != "A") & (grupo != "B") ){
    if (ultimog == "A"){
      lista.micr.A[i,1] <- as.character(lista.micr.bruta[i,"DNI.NIE.Pasaporte"])
      lista.micr.A[i,2] <- as.character(lista.micr.bruta[i,"Nombre"])
      lista.micr.A[i,3] <- as.character(lista.micr.bruta[i,"Apellido.s"])
      ultimog <- "A"
    }
    if (ultimog == "B"){
      lista.micr.B[i,1] <- as.character(lista.micr.bruta[i,"DNI.NIE.Pasaporte"])
      lista.micr.B[i,2] <- as.character(lista.micr.bruta[i,"Nombre"])
      lista.micr.B[i,3] <- as.character(lista.micr.bruta[i,"Apellido.s"])
      ultimog <- "B"
    }
  }
}
lista.micr.A <- na.omit(lista.micr.A)
lista.micr.B <- na.omit(lista.micr.B)

# FISIOLOGÍA VEGETAL
lista.vege.A <- data.frame(matrix(ncol = 3, nrow = 0))
colnames(lista.vege.A) <- c("DNI", "Nombre", "Apellidos")
lista.vege.B <- lista.vege.A
ultimog <- "A"
for (i in 1:nrow(lista.vege.bruta)) {
  grupo <- as.character(lista.vege.bruta[i,"Inscripción"])
  grupo <- substr(grupo, nchar(grupo), nchar(grupo))
  if (grupo == "A"){
    lista.vege.A[i,1] <- as.character(lista.vege.bruta[i,"DNI.NIE.Pasaporte"])
    lista.vege.A[i,2] <- as.character(lista.vege.bruta[i,"Nombre"])
    lista.vege.A[i,3] <- as.character(lista.vege.bruta[i,"Apellido.s"])
    ultimog <- "A"
  }
  if (grupo == "B"){
    lista.vege.B[i,1] <- as.character(lista.vege.bruta[i,"DNI.NIE.Pasaporte"])
    lista.vege.B[i,2] <- as.character(lista.vege.bruta[i,"Nombre"])
    lista.vege.B[i,3] <- as.character(lista.vege.bruta[i,"Apellido.s"])
    ultimog <- "B"
  }
  if ( (grupo != "A") & (grupo != "B") ){
    if (ultimog == "A"){
      lista.vege.A[i,1] <- as.character(lista.vege.bruta[i,"DNI.NIE.Pasaporte"])
      lista.vege.A[i,2] <- as.character(lista.vege.bruta[i,"Nombre"])
      lista.vege.A[i,3] <- as.character(lista.vege.bruta[i,"Apellido.s"])
      ultimog <- "A"
    }
    if (ultimog == "B"){
      lista.vege.B[i,1] <- as.character(lista.vege.bruta[i,"DNI.NIE.Pasaporte"])
      lista.vege.B[i,2] <- as.character(lista.vege.bruta[i,"Nombre"])
      lista.vege.B[i,3] <- as.character(lista.vege.bruta[i,"Apellido.s"])
      ultimog <- "B"
    }
  }
}
lista.vege.A <- na.omit(lista.vege.A)
lista.vege.B <- na.omit(lista.vege.B)


#########################################################################
#########################################################################
######################   T  U  R  N  O    A   ###########################
lista.anim <- lista.anim.A                                              #
lista.ecol <- lista.ecol.A                                          #   #   #
lista.gene <- lista.gene.A                                           #  #  #
lista.micr <- lista.micr.A                                            # # #
lista.vege <- lista.vege.A                                             # #
                                                                        #
########################### P A S O  2 ############################
# LISTA CON TODOS LOS MATRICULADOS, ELIMINAR DUPLICADOS, ORDEN ANFB

lista.todos <- rbind(lista.anim, lista.ecol, lista.gene, lista.micr, lista.vege)
lista.todos <- unique(lista.todos)
lista.todos <- lista.todos[order(lista.todos$Apellidos), ]


########################### P A S O  3 ############################
# GENERAR CÓDIGOS POR ASIGNATURAS MATRICULADAS

lista.todos <- cbind(lista.todos, asignaturas = 0, codigo = 0)
for (i in 1:nrow(lista.todos)){
  alumno <- lista.todos[i,2:3]
  # ver si está matriculado en ANIM
  if (length(which(lista.anim$Nombre == alumno$Nombre & lista.anim$Apellidos == alumno$Apellidos)) > 0) {c_anim <- 1} else {c_anim <- 0}
  # ver si está matriculado en ECOL
  if (length(which(lista.ecol$Nombre == alumno$Nombre & lista.ecol$Apellidos == alumno$Apellidos)) > 0) {c_ecol <- 1} else {c_ecol <- 0}
  # ver si está matriculado en GENE
  if (length(which(lista.gene$Nombre == alumno$Nombre & lista.gene$Apellidos == alumno$Apellidos)) > 0) {c_gene <- 1} else {c_gene <- 0}
  # ver si está matriculado en MICR
  if (length(which(lista.micr$Nombre == alumno$Nombre & lista.micr$Apellidos == alumno$Apellidos)) > 0) {c_micr <- 1} else {c_micr <- 0}
  # ver si está matriculado en VEGE
  if (length(which(lista.vege$Nombre == alumno$Nombre & lista.vege$Apellidos == alumno$Apellidos)) > 0) {c_vege <- 1} else {c_vege <- 0}
  # anotar número de asignaturas y código
  lista.todos[i,4] <- c_anim + c_ecol + c_gene + c_micr + c_vege
  lista.todos[i,5] <- sprintf("%05d", 10000*c_anim + 1000*c_ecol + 100*c_gene + 10*c_micr + c_vege)
}


########################### P A S O  4 #############################
# ORDENAR LA LISTA POR ASIGNATURAS MATRICULADAS, PRIMERO LOS ALUMNOS
# CON MÁS ASIGNATURAS Y MÁS COMUNES, AL FINAL LOS EXCLUSIVOS DE UNA
# O POCAS ASIGNATURAS

# ordenar por asignaturas, código y finalmente por apellido
lista.todos <- lista.todos[order(-lista.todos$asignaturas, -as.numeric(lista.todos$codigo), lista.todos$Apellidos), ]
# exportar la lista total, por si acaso
write.table(lista.todos, file = "lista total A.txt",row.names = FALSE)


########################### P A S O  5 #############################
# REPARTIR EN GRUPOS EQUITATIVOS

# contar frecuencia de códigos
lotes <- as.data.frame(table(lista.todos$codigo))

# creamos los grupos vacíos para cada asignatura
A1.anim <- lista.todos[0,]
A2.anim <- A1.anim
A3.anim <- A1.anim
A4.anim <- A1.anim
minA <- 1
A1.ecol <- A1.anim
A2.ecol <- A1.anim
A3.ecol <- A1.anim
A4.ecol <- A1.anim
minE <- 1
A1.gene <- A1.anim
A2.gene <- A1.anim
A3.gene <- A1.anim
A4.gene <- A1.anim
minG <- 1
A1.micr <- A1.anim
A2.micr <- A1.anim
A3.micr <- A1.anim
A4.micr <- A1.anim
minM <- 1
A1.vege <- A1.anim
A2.vege <- A1.anim
A3.vege <- A1.anim
A4.vege <- A1.anim
minV <- 1

# escribimos el algoritmo de reparto (la madre del borrego, sin segundas...)
apuntame.en.anim.A <- function(ultimo, inicial, repartir){
  minimo <- 99999
  repartire <- repartir
  numa <- c(0,0,0,0)
  ii <- inicial 
  while (repartire > 0){
    i <- ii %% 4
    if (i == 0) {i <- 4}
    numa[i] <- numa[i] + 1
    repartire <- repartire - 1
    ii <- ii + 1
  }
  a <- numa[1]
  b <- numa[2]
  c <- numa[3]
  d <- numa[4]
  if (a > 0) {A1.anim <<- rbind(A1.anim, lista.todos[(ultimo+1):(ultimo+a), ])}
  if (b > 0) {A2.anim <<- rbind(A2.anim, lista.todos[(ultimo+a+1):(ultimo+a+b), ])}
  if (c > 0) {A3.anim <<- rbind(A3.anim, lista.todos[(ultimo+a+b+1):(ultimo+a+b+c), ])}
  if (d > 0) {A4.anim <<- rbind(A4.anim, lista.todos[(ultimo+a+b+c+1):(ultimo+a+b+c+d), ])}
  if (nrow(A1.anim) < minimo) {
    minimo <- nrow(A1.anim)
    minA <<- 1
  }
  if (nrow(A2.anim) < minimo) {
    minimo <- nrow(A2.anim)
    minA <<- 2
  }
  if (nrow(A3.anim) < minimo) {
    minimo <- nrow(A3.anim)
    minA <<- 3
  }
  if (nrow(A4.anim) < minimo) {
    minimo <- nrow(A4.anim)
    minA <<- 4
  }
}

apuntame.en.ecol.A <- function(ultimo, inicial, repartir){
  minimo <- 99999
  repartire <- repartir
  numa <- c(0,0,0,0)
  ii <- inicial 
  while (repartire > 0){
    i <- ii %% 4
    if (i == 0) {i <- 4}
    numa[i] <- numa[i] + 1
    repartire <- repartire - 1
    ii <- ii + 1
  }
  a <- numa[1]
  b <- numa[2]
  c <- numa[3]
  d <- numa[4]
  if (a > 0) {A1.ecol <<- rbind(A1.ecol, lista.todos[(ultimo+1):(ultimo+a), ])}
  if (b > 0) {A2.ecol <<- rbind(A2.ecol, lista.todos[(ultimo+a+1):(ultimo+a+b), ])}
  if (c > 0) {A3.ecol <<- rbind(A3.ecol, lista.todos[(ultimo+a+b+1):(ultimo+a+b+c), ])}
  if (d > 0) {A4.ecol <<- rbind(A4.ecol, lista.todos[(ultimo+a+b+c+1):(ultimo+a+b+c+d), ])}
  if (nrow(A1.ecol) < minimo) {
    minimo <- nrow(A1.ecol)
    minE <<- 1
  }
  if (nrow(A2.ecol) < minimo) {
    minimo <- nrow(A2.ecol)
    minE <<- 2
  }
  if (nrow(A3.ecol) < minimo) {
    minimo <- nrow(A3.ecol)
    minE <<- 3
  }
  if (nrow(A4.ecol) < minimo) {
    minimo <- nrow(A4.ecol)
    minE <<- 4
  }
}

apuntame.en.gene.A <- function(ultimo, inicial, repartir){
  minimo <- 99999
  repartire <- repartir
  numa <- c(0,0,0,0)
  ii <- inicial 
  while (repartire > 0){
    i <- ii %% 4
    if (i == 0) {i <- 4}
    numa[i] <- numa[i] + 1
    repartire <- repartire - 1
    ii <- ii + 1
  }
  a <- numa[1]
  b <- numa[2]
  c <- numa[3]
  d <- numa[4]
  if (a > 0) {A1.gene <<- rbind(A1.gene, lista.todos[(ultimo+1):(ultimo+a), ])}
  if (b > 0) {A2.gene <<- rbind(A2.gene, lista.todos[(ultimo+a+1):(ultimo+a+b), ])}
  if (c > 0) {A3.gene <<- rbind(A3.gene, lista.todos[(ultimo+a+b+1):(ultimo+a+b+c), ])}
  if (d > 0) {A4.gene <<- rbind(A4.gene, lista.todos[(ultimo+a+b+c+1):(ultimo+a+b+c+d), ])}
  if (nrow(A1.gene) < minimo) {
    minimo <- nrow(A1.gene)
    minG <<- 1
  }
  if (nrow(A2.gene) < minimo) {
    minimo <- nrow(A2.gene)
    minG <<- 2
  }
  if (nrow(A3.gene) < minimo) {
    minimo <- nrow(A3.gene)
    minG <<- 3
  }
  if (nrow(A4.gene) < minimo) {
    minimo <- nrow(A4.gene)
    minG <<- 4
  }
}

apuntame.en.micr.A <- function(ultimo, inicial, repartir){
  minimo <- 99999
  repartire <- repartir
  numa <- c(0,0,0,0)
  ii <- inicial 
  while (repartire > 0){
    i <- ii %% 4
    if (i == 0) {i <- 4}
    numa[i] <- numa[i] + 1
    repartire <- repartire - 1
    ii <- ii + 1
  }
  a <- numa[1]
  b <- numa[2]
  c <- numa[3]
  d <- numa[4]
  if (a > 0) {A1.micr <<- rbind(A1.micr, lista.todos[(ultimo+1):(ultimo+a), ])}
  if (b > 0) {A2.micr <<- rbind(A2.micr, lista.todos[(ultimo+a+1):(ultimo+a+b), ])}
  if (c > 0) {A3.micr <<- rbind(A3.micr, lista.todos[(ultimo+a+b+1):(ultimo+a+b+c), ])}
  if (d > 0) {A4.micr <<- rbind(A4.micr, lista.todos[(ultimo+a+b+c+1):(ultimo+a+b+c+d), ])}
  if (nrow(A1.micr) < minimo) {
    minimo <- nrow(A1.micr)
    minM <<- 1
  }
  if (nrow(A2.micr) < minimo) {
    minimo <- nrow(A2.micr)
    minM <<- 2
  }
  if (nrow(A3.micr) < minimo) {
    minimo <- nrow(A3.micr)
    minM <<- 3
  }
  if (nrow(A4.micr) < minimo) {
    minimo <- nrow(A4.micr)
    minM <<- 4
  }
}

apuntame.en.vege.A <- function(ultimo, inicial, repartir){
  minimo <- 99999
  repartire <- repartir
  numa <- c(0,0,0,0)
  ii <- inicial 
  while (repartire > 0){
    i <- ii %% 4
    if (i == 0) {i <- 4}
    numa[i] <- numa[i] + 1
    repartire <- repartire - 1
    ii <- ii + 1
  }
  a <- numa[1]
  b <- numa[2]
  c <- numa[3]
  d <- numa[4]
  if (a > 0) {A1.vege <<- rbind(A1.vege, lista.todos[(ultimo+1):(ultimo+a), ])}
  if (b > 0) {A2.vege <<- rbind(A2.vege, lista.todos[(ultimo+a+1):(ultimo+a+b), ])}
  if (c > 0) {A3.vege <<- rbind(A3.vege, lista.todos[(ultimo+a+b+1):(ultimo+a+b+c), ])}
  if (d > 0) {A4.vege <<- rbind(A4.vege, lista.todos[(ultimo+a+b+c+1):(ultimo+a+b+c+d), ])}
  if (nrow(A1.vege) < minimo) {
    minimo <- nrow(A1.vege)
    minV <<- 1
  }
  if (nrow(A2.vege) < minimo) {
    minimo <- nrow(A2.vege)
    minV <<- 2
  }
  if (nrow(A3.vege) < minimo) {
    minimo <- nrow(A3.vege)
    minV <<- 3
  }
  if (nrow(A4.vege) < minimo) {
    minimo <- nrow(A4.vege)
    minV <<- 4
  }
}

# Y recorremos la lista de códigos apuntando a la peña donde le corresponda
codigos <- unique(lista.todos$codigo)
ultimo <- 0
M <- matrix(c(2,1,3,2,2,3,1,2), nrow = 4, ncol = 2, byrow = TRUE)
for (codigo_i in codigos) {
  # calcular el grupo inicial optimo ponderando los mínimos de cada asignatura
  iniciales <- c(minA, minE, minG, minM, minG)
  participan <- (isTRUE(substr(codigo_i, 1, 1) == "1") +
                   isTRUE(substr(codigo_i, 2, 2) == "1") +
                   isTRUE(substr(codigo_i, 3, 3) == "1") +
                   isTRUE(substr(codigo_i, 4, 4) == "1") +
                   isTRUE(substr(codigo_i, 5, 5) == "1") )
  x <- 0
  y <- 0
  d <- c(minA, minE, minG, minM, minV)
  for (j in 1:5){
    if (substr(codigo_i, j, j) == "1"){
      x <- x + M[d[j],1]
      y <- y + M[d[j],2]
    }
  }
  x <- x/participan
  y <- y/participan
  cerca <- 9
  for (j in 1:4){
    distancia <- (M[j,1] - x)^2 + (M[j,2] - y)^2
    if (distancia  < cerca) {
      inicial <- j
      cerca <- distancia
    }
  }
  
  # repartir
  repartir <- lotes$Freq[which(lotes$Var1 == codigo_i)]
  if ( (as.numeric(substr(codigo_i, 1, 1)) + as.numeric(substr(codigo_i, 2, 2)) + as.numeric(substr(codigo_i, 3, 3)) + as.numeric(substr(codigo_i, 4, 4)) + as.numeric(substr(codigo_i, 5, 5))) > 1 ) {
    if (substr(codigo_i, 1, 1) == "1") {
      apuntame.en.anim.A(ultimo, inicial, repartir)
    }
    if (substr(codigo_i, 2, 2) == "1") {
      apuntame.en.ecol.A(ultimo, inicial, repartir)
    }
    if (substr(codigo_i, 3, 3) == "1") {
      apuntame.en.gene.A(ultimo, inicial, repartir)
    }
    if (substr(codigo_i, 4, 4) == "1") {
      apuntame.en.micr.A(ultimo, inicial, repartir)
    }
    if (substr(codigo_i, 5, 5) == "1") {
      apuntame.en.vege.A(ultimo, inicial, repartir)
    }
    ultimo <- ultimo + repartir
  } else {
    reparte <- repartir
    for (unico in 1:reparte){
      repartir <- 1
      if (substr(codigo_i, 1, 1) == "1") {
        inicial <- minA
        apuntame.en.anim.A(ultimo, inicial, repartir)
      }
      if (substr(codigo_i, 2, 2) == "1") {
        inicial <- minE
        apuntame.en.ecol.A(ultimo, inicial, repartir)
      }
      if (substr(codigo_i, 3, 3) == "1") {
        inicial <- minG
        apuntame.en.gene.A(ultimo, inicial, repartir)
      }
      if (substr(codigo_i, 4, 4) == "1") {
        inicial <- minM
        apuntame.en.micr.A(ultimo, inicial, repartir)
      }
      if (substr(codigo_i, 5, 5) == "1") {
        inicial <- minV
        apuntame.en.vege.A(ultimo, inicial, repartir)
      }
      ultimo <- ultimo + 1
    }
  }
}


########################### P A S O  6 #############################
# ORDENAR INTERNAMENTE POR ORDEN ANALFABÉTICO Y EXPORTAR LAS LISTAS
# EN FORMATO TEXTO

# listas ANIM
grupo <- "A1"
A1.anim <- cbind(A1.anim[order(A1.anim$Apellidos), ], grupo)
grupo <- "A2"
A2.anim <- cbind(A2.anim[order(A2.anim$Apellidos), ], grupo)
grupo <- "A3"
A3.anim <- cbind(A3.anim[order(A3.anim$Apellidos), ], grupo)
grupo <- "A4"
A4.anim <- cbind(A4.anim[order(A4.anim$Apellidos), ], grupo)
lista.anim.grupos <- rbind(A1.anim, A2.anim, A3.anim, A4.anim)
write.table(lista.anim.grupos, "Grupos A Fisiología Animal.txt", row.names = FALSE)

# listas ECOL
grupo <- "A1"
A1.ecol <- cbind(A1.ecol[order(A1.ecol$Apellidos), ], grupo)
grupo <- "A2"
A2.ecol <- cbind(A2.ecol[order(A2.ecol$Apellidos), ], grupo)
grupo <- "A3"
A3.ecol <- cbind(A3.ecol[order(A3.ecol$Apellidos), ], grupo)
grupo <- "A4"
A4.ecol <- cbind(A4.ecol[order(A4.ecol$Apellidos), ], grupo)
lista.ecol.grupos <- rbind(A1.ecol, A2.ecol, A3.ecol, A4.ecol)
write.table(lista.ecol.grupos, "Grupos A Ecología.txt", row.names = FALSE)

# listas GENE
grupo <- "A1"
A1.gene <- cbind(A1.gene[order(A1.gene$Apellidos), ], grupo)
grupo <- "A2"
A2.gene <- cbind(A2.gene[order(A2.gene$Apellidos), ], grupo)
grupo <- "A3"
A3.gene <- cbind(A3.gene[order(A3.gene$Apellidos), ], grupo)
grupo <- "A4"
A4.gene <- cbind(A4.gene[order(A4.gene$Apellidos), ], grupo)
lista.gene.grupos <- rbind(A1.gene, A2.gene, A3.gene, A4.gene)
write.table(lista.gene.grupos, "Grupos A Genética.txt", row.names = FALSE)

# listas MICR
grupo <- "A1"
A1.micr <- cbind(A1.micr[order(A1.micr$Apellidos), ], grupo)
grupo <- "A2"
A2.micr <- cbind(A2.micr[order(A2.micr$Apellidos), ], grupo)
grupo <- "A3"
A3.micr <- cbind(A3.micr[order(A3.micr$Apellidos), ], grupo)
grupo <- "A4"
A4.micr <- cbind(A4.micr[order(A4.micr$Apellidos), ], grupo)
lista.micr.grupos <- rbind(A1.micr, A2.micr, A3.micr, A4.micr)
write.table(lista.micr.grupos, "Grupos A Microbiología.txt", row.names = FALSE)

# listas VEGE
grupo <- "A1"
A1.vege <- cbind(A1.vege[order(A1.vege$Apellidos), ], grupo)
grupo <- "A2"
A2.vege <- cbind(A2.vege[order(A2.vege$Apellidos), ], grupo)
grupo <- "A3"
A3.vege <- cbind(A3.vege[order(A3.vege$Apellidos), ], grupo)
grupo <- "A4"
A4.vege <- cbind(A4.vege[order(A4.vege$Apellidos), ], grupo)
lista.vege.grupos <- rbind(A1.vege, A2.vege, A3.vege, A4.vege)
write.table(lista.vege.grupos, "Grupos A Fisiología Vegetal.txt", row.names = FALSE)



#########################################################################
#########################################################################
######################   T  U  R  N  O    B   ###########################
lista.anim <- lista.anim.B                                              #
lista.ecol <- lista.ecol.B                                          #   #   #
lista.gene <- lista.gene.B                                           #  #  #
lista.micr <- lista.micr.B                                            # # #
lista.vege <- lista.vege.B                                             # #
#
########################### P A S O  2 ############################
# LISTA CON TODOS LOS MATRICULADOS, ELIMINAR DUPLICADOS, ORDEN ANFB

lista.todos <- rbind(lista.anim, lista.ecol, lista.gene, lista.micr, lista.vege)
lista.todos <- unique(lista.todos)
lista.todos <- lista.todos[order(lista.todos$Apellidos), ]


########################### P A S O  3 ############################
# GENERAR CÓDIGOS POR ASIGNATURAS MATRICULADAS

lista.todos <- cbind(lista.todos, asignaturas = 0, codigo = 0)
for (i in 1:nrow(lista.todos)){
  alumno <- lista.todos[i,2:3]
  # ver si está matriculado en ANIM
  if (length(which(lista.anim$Nombre == alumno$Nombre & lista.anim$Apellidos == alumno$Apellidos)) > 0) {c_anim <- 1} else {c_anim <- 0}
  # ver si está matriculado en ECOL
  if (length(which(lista.ecol$Nombre == alumno$Nombre & lista.ecol$Apellidos == alumno$Apellidos)) > 0) {c_ecol <- 1} else {c_ecol <- 0}
  # ver si está matriculado en GENE
  if (length(which(lista.gene$Nombre == alumno$Nombre & lista.gene$Apellidos == alumno$Apellidos)) > 0) {c_gene <- 1} else {c_gene <- 0}
  # ver si está matriculado en MICR
  if (length(which(lista.micr$Nombre == alumno$Nombre & lista.micr$Apellidos == alumno$Apellidos)) > 0) {c_micr <- 1} else {c_micr <- 0}
  # ver si está matriculado en VEGE
  if (length(which(lista.vege$Nombre == alumno$Nombre & lista.vege$Apellidos == alumno$Apellidos)) > 0) {c_vege <- 1} else {c_vege <- 0}
  # anotar número de asignaturas y código
  lista.todos[i,4] <- c_anim + c_ecol + c_gene + c_micr + c_vege
  lista.todos[i,5] <- sprintf("%05d", 10000*c_anim + 1000*c_ecol + 100*c_gene + 10*c_micr + c_vege)
}


########################### P A S O  4 #############################
# ORDENAR LA LISTA POR ASIGNATURAS MATRICULADAS, PRIMERO LOS ALUMNOS
# CON MÁS ASIGNATURAS Y MÁS COMUNES, AL FINAL LOS EXCLUSIVOS DE UNA
# O POCAS ASIGNATURAS

# ordenar por asignaturas, código y finalmente por apellido
lista.todos <- lista.todos[order(-lista.todos$asignaturas, -as.numeric(lista.todos$codigo), lista.todos$Apellidos), ]
# exportar la lista total, por si acaso
write.table(lista.todos, file = "lista total B.txt",row.names = FALSE)


########################### P A S O  5 #############################
# REPARTIR EN GRUPOS EQUITATIVOS

# contar frecuencia de códigos
lotes <- as.data.frame(table(lista.todos$codigo))

# creamos los grupos vacíos para cada asignatura
B1.anim <- lista.todos[0,]
B2.anim <- B1.anim
B3.anim <- B1.anim
B4.anim <- B1.anim
minA <- 1
B1.ecol <- B1.anim
B2.ecol <- B1.anim
B3.ecol <- B1.anim
B4.ecol <- B1.anim
minE <- 1
B1.gene <- B1.anim
B2.gene <- B1.anim
B3.gene <- B1.anim
B4.gene <- B1.anim
minG <- 1
B1.micr <- B1.anim
B2.micr <- B1.anim
B3.micr <- B1.anim
B4.micr <- B1.anim
minM <- 1
B1.vege <- B1.anim
B2.vege <- B1.anim
B3.vege <- B1.anim
B4.vege <- B1.anim
minV <- 1

# escribimos el algoritmo de reparto (la madre del borrego, sin segundas...)
apuntame.en.anim.B <- function(ultimo, inicial, repartir){
  minimo <- 99999
  repartire <- repartir
  numa <- c(0,0,0,0)
  ii <- inicial 
  while (repartire > 0){
    i <- ii %% 4
    if (i == 0) {i <- 4}
    numa[i] <- numa[i] + 1
    repartire <- repartire - 1
    ii <- ii + 1
  }
  a <- numa[1]
  b <- numa[2]
  c <- numa[3]
  d <- numa[4]
  if (a > 0) {B1.anim <<- rbind(B1.anim, lista.todos[(ultimo+1):(ultimo+a), ])}
  if (b > 0) {B2.anim <<- rbind(B2.anim, lista.todos[(ultimo+a+1):(ultimo+a+b), ])}
  if (c > 0) {B3.anim <<- rbind(B3.anim, lista.todos[(ultimo+a+b+1):(ultimo+a+b+c), ])}
  if (d > 0) {B4.anim <<- rbind(B4.anim, lista.todos[(ultimo+a+b+c+1):(ultimo+a+b+c+d), ])}
  if (nrow(B1.anim) < minimo) {
    minimo <- nrow(B1.anim)
    minA <<- 1
  }
  if (nrow(B2.anim) < minimo) {
    minimo <- nrow(B2.anim)
    minA <<- 2
  }
  if (nrow(B3.anim) < minimo) {
    minimo <- nrow(B3.anim)
    minA <<- 3
  }
  if (nrow(B4.anim) < minimo) {
    minimo <- nrow(B4.anim)
    minA <<- 4
  }
}

apuntame.en.ecol.B <- function(ultimo, inicial, repartir){
  minimo <- 99999
  repartire <- repartir
  numa <- c(0,0,0,0)
  ii <- inicial 
  while (repartire > 0){
    i <- ii %% 4
    if (i == 0) {i <- 4}
    numa[i] <- numa[i] + 1
    repartire <- repartire - 1
    ii <- ii + 1
  }
  a <- numa[1]
  b <- numa[2]
  c <- numa[3]
  d <- numa[4]
  if (a > 0) {B1.ecol <<- rbind(B1.ecol, lista.todos[(ultimo+1):(ultimo+a), ])}
  if (b > 0) {B2.ecol <<- rbind(B2.ecol, lista.todos[(ultimo+a+1):(ultimo+a+b), ])}
  if (c > 0) {B3.ecol <<- rbind(B3.ecol, lista.todos[(ultimo+a+b+1):(ultimo+a+b+c), ])}
  if (d > 0) {B4.ecol <<- rbind(B4.ecol, lista.todos[(ultimo+a+b+c+1):(ultimo+a+b+c+d), ])}
  if (nrow(B1.ecol) < minimo) {
    minimo <- nrow(B1.ecol)
    minE <<- 1
  }
  if (nrow(B2.ecol) < minimo) {
    minimo <- nrow(B2.ecol)
    minE <<- 2
  }
  if (nrow(B3.ecol) < minimo) {
    minimo <- nrow(B3.ecol)
    minE <<- 3
  }
  if (nrow(B4.ecol) < minimo) {
    minimo <- nrow(B4.ecol)
    minE <<- 4
  }
}

apuntame.en.gene.B <- function(ultimo, inicial, repartir){
  minimo <- 99999
  repartire <- repartir
  numa <- c(0,0,0,0)
  ii <- inicial 
  while (repartire > 0){
    i <- ii %% 4
    if (i == 0) {i <- 4}
    numa[i] <- numa[i] + 1
    repartire <- repartire - 1
    ii <- ii + 1
  }
  a <- numa[1]
  b <- numa[2]
  c <- numa[3]
  d <- numa[4]
  if (a > 0) {B1.gene <<- rbind(B1.gene, lista.todos[(ultimo+1):(ultimo+a), ])}
  if (b > 0) {B2.gene <<- rbind(B2.gene, lista.todos[(ultimo+a+1):(ultimo+a+b), ])}
  if (c > 0) {B3.gene <<- rbind(B3.gene, lista.todos[(ultimo+a+b+1):(ultimo+a+b+c), ])}
  if (d > 0) {B4.gene <<- rbind(B4.gene, lista.todos[(ultimo+a+b+c+1):(ultimo+a+b+c+d), ])}
  if (nrow(B1.gene) < minimo) {
    minimo <- nrow(B1.gene)
    minG <<- 1
  }
  if (nrow(B2.gene) < minimo) {
    minimo <- nrow(B2.gene)
    minG <<- 2
  }
  if (nrow(B3.gene) < minimo) {
    minimo <- nrow(B3.gene)
    minG <<- 3
  }
  if (nrow(B4.gene) < minimo) {
    minimo <- nrow(B4.gene)
    minG <<- 4
  }
}

apuntame.en.micr.B <- function(ultimo, inicial, repartir){
  minimo <- 99999
  repartire <- repartir
  numa <- c(0,0,0,0)
  ii <- inicial 
  while (repartire > 0){
    i <- ii %% 4
    if (i == 0) {i <- 4}
    numa[i] <- numa[i] + 1
    repartire <- repartire - 1
    ii <- ii + 1
  }
  a <- numa[1]
  b <- numa[2]
  c <- numa[3]
  d <- numa[4]
  if (a > 0) {B1.micr <<- rbind(B1.micr, lista.todos[(ultimo+1):(ultimo+a), ])}
  if (b > 0) {B2.micr <<- rbind(B2.micr, lista.todos[(ultimo+a+1):(ultimo+a+b), ])}
  if (c > 0) {B3.micr <<- rbind(B3.micr, lista.todos[(ultimo+a+b+1):(ultimo+a+b+c), ])}
  if (d > 0) {B4.micr <<- rbind(B4.micr, lista.todos[(ultimo+a+b+c+1):(ultimo+a+b+c+d), ])}
  if (nrow(B1.micr) < minimo) {
    minimo <- nrow(B1.micr)
    minM <<- 1
  }
  if (nrow(B2.micr) < minimo) {
    minimo <- nrow(B2.micr)
    minM <<- 2
  }
  if (nrow(B3.micr) < minimo) {
    minimo <- nrow(B3.micr)
    minM <<- 3
  }
  if (nrow(B4.micr) < minimo) {
    minimo <- nrow(B4.micr)
    minM <<- 4
  }
}

apuntame.en.vege.B <- function(ultimo, inicial, repartir){
  minimo <- 99999
  repartire <- repartir
  numa <- c(0,0,0,0)
  ii <- inicial 
  while (repartire > 0){
    i <- ii %% 4
    if (i == 0) {i <- 4}
    numa[i] <- numa[i] + 1
    repartire <- repartire - 1
    ii <- ii + 1
  }
  a <- numa[1]
  b <- numa[2]
  c <- numa[3]
  d <- numa[4]
  if (a > 0) {B1.vege <<- rbind(B1.vege, lista.todos[(ultimo+1):(ultimo+a), ])}
  if (b > 0) {B2.vege <<- rbind(B2.vege, lista.todos[(ultimo+a+1):(ultimo+a+b), ])}
  if (c > 0) {B3.vege <<- rbind(B3.vege, lista.todos[(ultimo+a+b+1):(ultimo+a+b+c), ])}
  if (d > 0) {B4.vege <<- rbind(B4.vege, lista.todos[(ultimo+a+b+c+1):(ultimo+a+b+c+d), ])}
  if (nrow(B1.vege) < minimo) {
    minimo <- nrow(B1.vege)
    minV <<- 1
  }
  if (nrow(B2.vege) < minimo) {
    minimo <- nrow(B2.vege)
    minV <<- 2
  }
  if (nrow(B3.vege) < minimo) {
    minimo <- nrow(B3.vege)
    minV <<- 3
  }
  if (nrow(B4.vege) < minimo) {
    minimo <- nrow(B4.vege)
    minV <<- 4
  }
}

# Y recorremos la lista de códigos apuntando a la peña donde le corresponda
codigos <- unique(lista.todos$codigo)
ultimo <- 0
M <- matrix(c(2,1,3,2,2,3,1,2), nrow = 4, ncol = 2, byrow = TRUE)
for (codigo_i in codigos) {
  # calcular el grupo inicial optimo ponderando los mínimos de cada asignatura
  iniciales <- c(minA, minE, minG, minM, minG)
  participan <- (isTRUE(substr(codigo_i, 1, 1) == "1") +
                   isTRUE(substr(codigo_i, 2, 2) == "1") +
                   isTRUE(substr(codigo_i, 3, 3) == "1") +
                   isTRUE(substr(codigo_i, 4, 4) == "1") +
                   isTRUE(substr(codigo_i, 5, 5) == "1") )
  x <- 0
  y <- 0
  d <- c(minA, minE, minG, minM, minV)
  for (j in 1:5){
    if (substr(codigo_i, j, j) == "1"){
      x <- x + M[d[j],1]
      y <- y + M[d[j],2]
    }
  }
  x <- x/participan
  y <- y/participan
  cerca <- 9
  for (j in 1:4){
    distancia <- (M[j,1] - x)^2 + (M[j,2] - y)^2
    if (distancia  < cerca) {
      inicial <- j
      cerca <- distancia
    }
  }
  
  # repartir
  repartir <- lotes$Freq[which(lotes$Var1 == codigo_i)]
  if ( (as.numeric(substr(codigo_i, 1, 1)) + as.numeric(substr(codigo_i, 2, 2)) + as.numeric(substr(codigo_i, 3, 3)) + as.numeric(substr(codigo_i, 4, 4)) + as.numeric(substr(codigo_i, 5, 5))) > 1 ) {
    if (substr(codigo_i, 1, 1) == "1") {
      apuntame.en.anim.B(ultimo, inicial, repartir)
    }
    if (substr(codigo_i, 2, 2) == "1") {
      apuntame.en.ecol.B(ultimo, inicial, repartir)
    }
    if (substr(codigo_i, 3, 3) == "1") {
      apuntame.en.gene.B(ultimo, inicial, repartir)
    }
    if (substr(codigo_i, 4, 4) == "1") {
      apuntame.en.micr.B(ultimo, inicial, repartir)
    }
    if (substr(codigo_i, 5, 5) == "1") {
      apuntame.en.vege.B(ultimo, inicial, repartir)
    }
    ultimo <- ultimo + repartir
  } else {
    reparte <- repartir
    for (unico in 1:reparte){
      repartir <- 1
      if (substr(codigo_i, 1, 1) == "1") {
        inicial <- minA
        apuntame.en.anim.B(ultimo, inicial, repartir)
      }
      if (substr(codigo_i, 2, 2) == "1") {
        inicial <- minE
        apuntame.en.ecol.B(ultimo, inicial, repartir)
      }
      if (substr(codigo_i, 3, 3) == "1") {
        inicial <- minG
        apuntame.en.gene.B(ultimo, inicial, repartir)
      }
      if (substr(codigo_i, 4, 4) == "1") {
        inicial <- minM
        apuntame.en.micr.B(ultimo, inicial, repartir)
      }
      if (substr(codigo_i, 5, 5) == "1") {
        inicial <- minV
        apuntame.en.vege.B(ultimo, inicial, repartir)
      }
      ultimo <- ultimo + 1
    }
    #repartir <- reparte
  }
  #ultimo <- ultimo + repartir
}


########################### P A S O  6 #############################
# ORDENAR INTERNAMENTE POR ORDEN ANALFABÉTICO Y EXPORTAR LAS LISTAS
# EN FORMATO TEXTO

# listas ANIM
grupo <- "B1"
B1.anim <- cbind(B1.anim[order(B1.anim$Apellidos), ], grupo)
grupo <- "B2"
B2.anim <- cbind(B2.anim[order(B2.anim$Apellidos), ], grupo)
grupo <- "B3"
B3.anim <- cbind(B3.anim[order(B3.anim$Apellidos), ], grupo)
grupo <- "B4"
B4.anim <- cbind(B4.anim[order(B4.anim$Apellidos), ], grupo)
lista.anim.grupos <- rbind(B1.anim, B2.anim, B3.anim, B4.anim)
write.table(lista.anim.grupos, "Grupos B Fisiología Animal.txt", row.names = FALSE)

# listas ECOL
grupo <- "B1"
B1.ecol <- cbind(B1.ecol[order(B1.ecol$Apellidos), ], grupo)
grupo <- "B2"
B2.ecol <- cbind(B2.ecol[order(B2.ecol$Apellidos), ], grupo)
grupo <- "B3"
B3.ecol <- cbind(B3.ecol[order(B3.ecol$Apellidos), ], grupo)
grupo <- "B4"
B4.ecol <- cbind(B4.ecol[order(B4.ecol$Apellidos), ], grupo)
lista.ecol.grupos <- rbind(B1.ecol, B2.ecol, B3.ecol, B4.ecol)
write.table(lista.ecol.grupos, "Grupos B Ecología.txt", row.names = FALSE)

# listas GENE
grupo <- "B1"
B1.gene <- cbind(B1.gene[order(B1.gene$Apellidos), ], grupo)
grupo <- "B2"
B2.gene <- cbind(B2.gene[order(B2.gene$Apellidos), ], grupo)
grupo <- "B3"
B3.gene <- cbind(B3.gene[order(B3.gene$Apellidos), ], grupo)
grupo <- "B4"
B4.gene <- cbind(B4.gene[order(B4.gene$Apellidos), ], grupo)
lista.gene.grupos <- rbind(B1.gene, B2.gene, B3.gene, B4.gene)
write.table(lista.gene.grupos, "Grupos B Genética.txt", row.names = FALSE)

# listas MICR
grupo <- "B1"
B1.micr <- cbind(B1.micr[order(B1.micr$Apellidos), ], grupo)
grupo <- "B2"
B2.micr <- cbind(B2.micr[order(B2.micr$Apellidos), ], grupo)
grupo <- "B3"
B3.micr <- cbind(B3.micr[order(B3.micr$Apellidos), ], grupo)
grupo <- "B4"
B4.micr <- cbind(B4.micr[order(B4.micr$Apellidos), ], grupo)
lista.micr.grupos <- rbind(B1.micr, B2.micr, B3.micr, B4.micr)
write.table(lista.micr.grupos, "Grupos B Microbiología.txt", row.names = FALSE)

# listas VEGE
grupo <- "B1"
B1.vege <- cbind(B1.vege[order(B1.vege$Apellidos), ], grupo)
grupo <- "B2"
B2.vege <- cbind(B2.vege[order(B2.vege$Apellidos), ], grupo)
grupo <- "B3"
B3.vege <- cbind(B3.vege[order(B3.vege$Apellidos), ], grupo)
grupo <- "B4"
B4.vege <- cbind(B4.vege[order(B4.vege$Apellidos), ], grupo)
lista.vege.grupos <- rbind(B1.vege, B2.vege, B3.vege, B4.vege)
write.table(lista.vege.grupos, "Grupos B Fisiología Vegetal.txt", row.names = FALSE)









