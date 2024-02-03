# Nombre: recortar_raster_SA.py
# Descripci�n: Extrae las celdas de un r�ster que corresponde con las
#     �reas definidas por una m�scara.
# Requerimientos: Extensi�n Spatial Analyst

# Importa m�dulos del sistema
import arcpy
from arcpy import env
from arcpy.sa import *

import arcgisscripting
gp = arcgisscripting.create()

# Establece la configuraci�n del ambiente
env.workspace = r"E:\tmp\PROAGRO\analisis\geodat\orig\worldclim\A1B\2030s\2_5min\tmin"
gp.workspace = r"E:\tmp\PROAGRO\analisis\geodat\orig\worldclim\A1B\2030s\2_5min\tmin"

#Establece las variables locales
entMascDatos = r"E:\tmp\PROAGRO\analisis\geodat\latlon\limite_region_Chaco_ai2km_ll.shp"

# Verifica la licencia de la extensi�n Spatial Analyst
arcpy.CheckOutExtension("Spatial")

# Obtiene la lista de r�sters en la carpeta
rasList = gp.ListRasters()

cuenta = 0
entRaster = rasList.next()

while entRaster != None:
    nomsalida = "E:/tmp/PROAGRO/analisis/geodat/pryctd/proagro_importac.gdb/Chaco_A1B_2030s_" + entRaster
    
    # Ejecuta ExtractByMask
    salExtractByMask = ExtractByMask(entRaster, entMascDatos)

    # Guarda la salida
    salExtractByMask.save(nomsalida)
    
    cuenta = cuenta + 1
    entRaster = rasList.next()


