
library(magrittr) #For pipelines
library(dplyr)
library(kableExtra) #For tables
library(corrplot)
library(plotly)

# https://www.inegi.org.mx/programas/accidentes/#Datos_abiertos
# Url of File
urlString <- "https://www.inegi.org.mx/contenidos/programas/accidentes/datosabiertos/atus_anual_csv.zip"
pathFolder <- "C:/Users/DELL/Documents/Trabajos/Maestria/Repositorio/MCD_UNISON_MyJourny/Ingenieria_de_Caracteristicas/Proyecto_1"


filePath <- paste(pathFolder,"/atus_anual_csv.zip", sep="")

# Download file if does not exist
if (!file.exists(filePath)){
  download.file(urlString, filePath)
}



outDir<- pathFolder # Define the folder where the zip file should be unzipped to 
unzip(filePath,exdir=outDir)  # unzip your file 

pathDatos <- paste(pathFolder, "/conjunto_de_datos", sep = "")

df_1997 <- read.csv(paste(pathDatos,"/atus_anual_1997.csv", sep=""), sep = ",", header = TRUE, dec = ".", row.names = NULL, encoding = "UTF-8")
df_global <- data.frame()
df_global <- df_1997
df_temp <- data.frame()

# Fusion tables
f_GetAllCSV <- function(pathFile){
  
  for (x in list.files(pathDatos)){
    df_temp <<- read.csv(paste(pathDatos,"/", x, sep=""), sep = ",", header = TRUE, dec = ".", row.names = NULL, encoding = "UTF-8")
    print(x)
    # Modify column name, due has extra column with no data
    if(ncol(df_temp) == 46){
      print("Es = 46")
      colnames(df_temp) <<- colnames(df_temp)[2:ncol(df_temp)]
      df_temp <<- df_temp[1:(ncol(df_temp) - 1)]
    }
    print("Debe fusionar")
    df_global <<- rbind(df_global, df_temp)
    
  }
  
}

f_GetAllCSV(pathDatos)
# Get information from Sonora
df_sonora <- df_global[df_global$ID_ENTIDAD == 26,]
unique(df_sonora["TIPACCID"])

nrow(df_sonora["CONDMUERTO"])
nrow(df_sonora["TIPACCID"])

unique(df_sonora["CONDMUERTO"])
df_sonora[,"TIPACCID"]

plot(df_sonora[,"TIPACCID"], df_sonora[,"CONDMUERTO"])

df_temp <- df_sonora[,c("TIPACCID", "CONDMUERTO")]
df_temp <- df_temp[order(df_temp$CONDMUERTO),]

unique(df_sonora[,"TIPACCID"])
df_temp <- df_sonora[,"TIPACCID"]


df_temp %>%
  plot_ly(
    y = ~CONDMUERTO,
    x = ~TIPACCID,
    type = 'bar'
  )

df_sonora %>%
  plot_ly(
    y = ~CONDMUERTO,
    x = ~TIPACCID,
    type = 'bar'
  ) %>% layout(xaxis = list(categoryorder = "total descending")) %>% 
  layout(yaxis = list(title = "Conductores Muertos"))



nrow(df_sonora)

df_1997 <- data.frame
lsimn <- data.frame()
df_temp <- data.frame()








# Keep only numerical values to make a correlation 
df_test <- select(df_1997, -c(1,DIASEMANA,URBANA,SUBURBANA,TIPACCID,CAUSAACCI,CAPAROD,SEXO,ALIENTO,CINTURON,CLASACC,ESTATUS))
# Check missing data
df_global %>% a
  sapply(function(no_NA) sum(is.na(no_NA))) %>% 
  kbl() %>% 
  kable_styling() %>% 
  scroll_box(width = "100%", height = "400px")



corrplot(cor(df_test),        # Matriz de correlación
         method = "color", # Método para el gráfico de correlación
         type = "full",    # Estilo del gráfico (también "upper" y "lower")
         diag = TRUE,      # Si TRUE (por defecto), añade la diagonal
         tl.col = "black", # Color de las etiquetas
         bg = "white",     # Color de fondo
         title = "",       # Título
         col = NULL)       # Paleta de colores


  unique(df_global[,"ANIO"])
  unique(df_1997[,2])
  ncol(df_1997)

  
  
  
  
