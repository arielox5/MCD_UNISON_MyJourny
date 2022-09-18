# Modified to download and put all files in a sigle folder. Take note that using this script from another OS can make the folder being in another place
import os  # Para manejo de archivos y directorios
import sys
import urllib.request # Una forma estandard de descargar datos
# import requests # Otra forma no de las librerías de uso comun

import datetime # Fecha de descarga
#import pandas as pd # Solo para ver el archivo descargado
import zipfile # Descompresión de archivos
import pathlib as pLib

#pwd
print(os.getcwd())

# Estos son los datos que vamos a descargar y donde vamos a guardarlos
desaparecidos_RNPDNO_url = "http://www.datamx.io/dataset/fdd2ca20-ee70-4a31-9bdf-823f3c1307a2/resource/d352810c-a22e-4d72-bb3b-33c742c799dd/download/desaparecidos3ago.zip"
desaparecidos_RNPDNO_archivo = "desaparecidosRNPDNO.zip"
desaparecidos_corte_nacional_url = "http://www.datamx.io/dataset/fdd2ca20-ee70-4a31-9bdf-823f3c1307a2/resource/4865e244-cf59-4d39-b863-96ed7f45cc70/download/nacional.json"
desaparecidos_corte_nacional_archivo = "desaparecidos_nacional.json"
# subdir = "./data/"

print ("Subdirectorio -> " + subdir)
print ("ZIP FIle -> " + desaparecidos_RNPDNO_archivo)
# Gets current folder of the current file
print (os.path.abspath(__file__))

folderData = os.path.dirname(sys.argv[0])
fileCombined = os.path.join(folderData,desaparecidos_RNPDNO_archivo)
subdir = os.path.join(folderData, "data/")



if not os.path.exists(fileCombined):
    if not os.path.exists(subdir):
        os.makedirs(subdir)
    urllib.request.urlretrieve(desaparecidos_RNPDNO_url, subdir + desaparecidos_RNPDNO_archivo)  
    with zipfile.ZipFile(subdir + desaparecidos_RNPDNO_archivo, "r") as zip_ref:
        zip_ref.extractall(subdir)
    
    urllib.request.urlretrieve(desaparecidos_corte_nacional_url, subdir + desaparecidos_corte_nacional_archivo)  

    with open(subdir + "info.txt", 'w') as f:
        f.write("Archivos sobre personas desaparecidas\n")
        info = """
        Datos de desaparecidos, corte nacional y desagregación a nivel estatal, por edad, por sexo, 
        por nacionalidad, por año de desaparición y por mes de desaparición para los últimos 12 meses.

        Los datos se obtuvieron del RNPDNO con fecha de 03 de agosto de 2021 (la base de datos se actualiza constantemente) 

        """ 
        f.write(info + '\n')
        f.write("Descargado el " + datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") + "\n")
        f.write("Desde: " + desaparecidos_RNPDNO_url + "\n")
        f.write("Nombre: " + desaparecidos_RNPDNO_archivo + "\n")
        f.write("Agregados nacionales descargados desde: " + desaparecidos_corte_nacional_url + "\n")
        f.write("Nombre: " + desaparecidos_corte_nacional_archivo + "\n")

    

