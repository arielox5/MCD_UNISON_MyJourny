library(psych)
# Load files
pathFolder <- "C:/Users/DELL/Documents/Trabajos/Maestria/Repositorio/MCD_UNISON_MyJourny/Matematicas_para_Ciencia_de_Datos/03_Ejercicio_03"

fileCSVPath <- paste(pathFolder,"/dataset_sin_redondeo.csv", sep="")


matrix <- read.csv(file = fileCSVPath)

describe(matrix)

cor(matrix)
