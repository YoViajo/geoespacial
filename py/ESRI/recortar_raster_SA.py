# Nombre: recortar_raster_SA.py
# Descripción: Extrae las celdas de un ráster que corresponde con las
#     áreas definidas por una máscara.
# Requerimientos: Extensión Spatial Analyst

# Importa módulos del sistema
import arcpy
from arcpy import env
from arcpy.sa import *

# Establece la configuración del ambiente
env.workspace = "C:/PROF/CONS/PROAGRO/analisis/compilDat/IPCC4_CIAT/A1B/2030s/prec"

#Establece las variables locales
entRaster = "rain_01"
entMascDatos = "limite_region_Chaco_ai2km_ll.shp"

# Verifica la licencia de la extensión Spatial Analyst
arcpy.CheckOutExtension("Spatial")

# Ejecuta ExtractByMask
salExtractByMask = ExtractByMask(entRaster, entMascDatos)

# Guarda la salida
salExtractByMask.save("C:/PROF/CONS/PROAGRO/analisis/geodat/pryctd/PROAGRO.gdb/Chaco_A1B_2030s_rain_01")


