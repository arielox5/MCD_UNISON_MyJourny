
# One hot encoding
library(mltools)
library(data.table)

pathFolder <- "C:/Users/DELL/Documents/Trabajos/Maestria/Repositorio/MCD_UNISON_MyJourny/Ingenieria_de_Caracteristicas/3_CodificacionVariablesR"
urlJSON <- "https://datamexico.org/api/data?Municipality=26030&Year=2020&cube=inegi_population&drilldowns=Indigenous+Dialect&measures=Population&parents=false&sort=Population.desc"

dataF <- fromJSON(urlJSON)
dataF2 <- dataF[["data"]]
#fileCSVPath <- paste(pathFolder,"/dataset_sin_redondeo.csv", sep="")



#set.seed(555)
dataF <- data.frame(
  Outcome = seq(1,100,by=1),
  Variable = sample(c("Red","Green","Blue"), 100, replace = TRUE)
)

newdata <- one_hot(as.data.table(dataF))

dataF$Variable <- as.factor(dataF$Variable)
newdata <- one_hot(as.data.table(dataF))


#
