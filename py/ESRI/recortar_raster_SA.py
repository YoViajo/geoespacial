# Nombre: recortar_raster_SA.py
# Descripci�n: Extrae las celdas de un r�ster que corresponde con las
#     �reas definidas por una m�scara.
# Requerimientos: Extensi�n Spatial Analyst

# Importa m�dulos del sistema
import arcpy
from arcpy import env
from arcpy.sa import *

# Establece la configuraci�n del ambiente
env.workspace = "C:/PROF/CONS/PROAGRO/analisis/compilDat/IPCC4_CIAT/A1B/2030s/prec"

#Establece las variables locales
entRaster = "rain_01"
entMascDatos = "limite_region_Chaco_ai2km_ll.shp"

# Verifica la licencia de la extensi�n Spatial Analyst
arcpy.CheckOutExtension("Spatial")

# Ejecuta ExtractByMask
salExtractByMask = ExtractByMask(entRaster, entMascDatos)

# Guarda la salida
salExtractByMask.save("C:/PROF/CONS/PROAGRO/analisis/geodat/pryctd/PROAGRO.gdb/Chaco_A1B_2030s_rain_01")


