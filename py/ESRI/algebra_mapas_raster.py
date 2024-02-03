import arcpy  
import arcpy.sa as sa  
  
# input raster  
ras1 = sa.Raster(r"d:\ma1\Soil_Type.tif")   
  
# value of ras1 to be evaluated as true  
class1 = 3  
  
# Define output layer  
ras_output = (r"D:\mal\soils.gdb\soiltype_overlap")  
  
ras3 = sa.Con(ras1 == class1, 1, 0)  
  
ras3.save(ras_output)  