library(psych)
# Load files
pathFolder <- "C:/Users/DELL/Documents/Trabajos/Maestria/Repositorio/MCD_UNISON_MyJourny/Matematicas_para_Ciencia_de_Datos/03_Ejercicio_03"

fileCSVPath <- paste(pathFolder,"/dataset_sin_redondeo.csv", sep="")


matrix <- read.csv(file = fileCSVPath)

describe(matrix)

cor(matrix)


mat1.data <- c(1,2,3,4,5,6,7,8,9)
mat1 <- matrix(mat1.data,nrow=3,ncol=3,byrow=TRUE)
mat1
