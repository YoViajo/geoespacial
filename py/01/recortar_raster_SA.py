# Nombre: recortar_raster_SA.py
# Descripción: Extrae las celdas de un ráster que corresponde con las
#     áreas definidas por una máscara.
# Requerimientos: Extensión Spatial Analyst

# Importa módulos del sistema
import arcpy
from arcpy import env
from arcpy.sa import *

import arcgisscripting
gp = arcgisscripting.create()

# Establece la configuración del ambiente
env.workspace = r"E:\tmp\PROAGRO\analisis\geodat\orig\worldclim\A1B\2030s\2_5min\tmin"
gp.workspace = r"E:\tmp\PROAGRO\analisis\geodat\orig\worldclim\A1B\2030s\2_5min\tmin"

#Establece las variables locales
entMascDatos = r"E:\tmp\PROAGRO\analisis\geodat\latlon\limite_region_Chaco_ai2km_ll.shp"

# Verifica la licencia de la extensión Spatial Analyst
arcpy.CheckOutExtension("Spatial")

# Obtiene la lista de rásters en la carpeta
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
