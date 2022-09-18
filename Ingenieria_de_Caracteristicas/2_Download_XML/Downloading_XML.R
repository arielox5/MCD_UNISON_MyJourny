# Prerequsites: Donwload XML package
# install.packages("XML")
# Source of information gather on: https://www.tutorialspoint.com/r/r_xml_files.htm

# Load the package required to read XML files.
library("XML")
library("methods")
library("arrow")

# Url of the XML file
urlString <- "https://raw.githubusercontent.com/mcd-unison/ing-caract/main/ejemplos/integracion/ejemplos/wikipedia-poetas.xml"
pathFolder <- "C:/Users/DELL/Documents/Trabajos/Maestria/Repositorio/MCD_UNISON_MyJourny/Ingenieria_de_Caracteristicas/2_Download_XML"

# NOTE: On Windows getwd() do not get the full path of the current script
# Set mannually the "pathFolder" variable


filePath <- paste(pathFolder,"/gitMCD.xml", sep="")
#filePath2 <- paste(pathFolder,"/test.xml", sep="")

# Download file if does not exist
if (!file.exists(filePath)){
  download.file(urlString, filePath)
}

# Give the input file name to the function.
# result <- xmlParse(file = filePath)
docXML <- xmlParse(file = filePath, encoding = "UTF-8")
rootnodeXML <- xmlRoot(docXML)
# Remove site info node to got all node as "Page"
removeNodes(rootnodeXML[names(rootnodeXML) == "siteinfo"])
totalNodes <- xmlSize(rootnodeXML)

# Function to get values from revision tag
GetContributeInfo <- function(currRow){
  
  totalRows2 <- xmlSize(rootnodeXML[[currRow]][[4]][[4]])
  
  for(j in 1:totalRows2){
    
    nameTag2 <- xmlName(rootnodeXML[[currRow]][[4]][[4]][[j]])
    valueTag2 <- xmlValue(rootnodeXML[[currRow]][[4]][[4]][[j]])
    
    switch (nameTag2,
            "username" = vectorTemp[7] <<- valueTag2,
            "id" = vectorTemp[8] <<- valueTag2,
            "ip" = vectorTemp[9] <<- valueTag2,
    )
  }
}

# --------------------------------------------------- 
# Set element of the table
# 1 Title , 2 = ns, 3 = id, 4 = r_id, 5 = r_parent_id, 6 = r_tiemstamp, 7 = c_UserName, 8 = c_ID,
# 9 = IP, 10 = c_Comment, 11 = Model, 12 = format, 13 = c_text, 14 = sha1

df <- data.frame()
vectorTemp <- c("","", "", "", "","", "", "", "","","", "", "" ,"")

for (x in 1:totalNodes){
  
  vectorTemp <- c("","", "", "", "","", "", "", "","","", "", "" ,"")
  
  vectorTemp[1] <- xmlValue(rootnodeXML[[x]][[1]])
  vectorTemp[2] <- xmlValue(rootnodeXML[[x]][[2]])
  vectorTemp[3] <- xmlValue(rootnodeXML[[x]][[3]])
  
  # Revision values - Sub of 
  totalRows <- xmlSize(rootnodeXML[[x]][[4]])
  # loop for all the values on "Revision" TAG
  for(n in  1:totalRows){
    
    nameTag <- xmlName(rootnodeXML[[x]][[4]][[n]])
    valueTag <- xmlValue(rootnodeXML[[x]][[4]][[n]])
    
    switch (nameTag,
        "id" = vectorTemp[4] <- valueTag,
        "parentid" = vectorTemp[5] <- valueTag,
        "timestamp" = vectorTemp[6] <- valueTag,
        "contributor" = GetContributeInfo(x),
        "comment" = vectorTemp[10] <- valueTag,
        "model" = vectorTemp[11] <- valueTag,
        "format" = vectorTemp[12] <- valueTag,
        "text" = vectorTemp[13] <- valueTag,
        "sha1" = vectorTemp[14] <- valueTag,
    )
  }
  df <- rbind(df, vectorTemp)
  
}

# Set new titles names
colnames(df) <- vectorTemp <- c("Title","ns", "ID", "Revision_ID", "ParentID","timestamp", "UserName", "Id_User", "IP","Comment","model", "Format", "Text" ,"sha1")

# Create parquet file

tempf1 <- tempfile(fileext = ".parquet", tmpdir = pathFolder, pattern = "xml_")

write_parquet(df, tempf1)
