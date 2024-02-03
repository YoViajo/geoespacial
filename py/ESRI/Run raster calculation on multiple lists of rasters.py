from arcpy.sa import *   
arcpy.workspace = path  # direct where the input and output is  
  
# list inputs  
demlist = arcpy.ListRasters('DEM_ext*')  
minlist = arcpy.ListRasters('ZonalMin*')  
maxlist = arcpy.ListRasters('ZonalMax*')  
  
# Starting from the first raster of each type and iterate through to the sixth [0] - [5]  
# Start at index [0]     
for k in range(6): # 0,1,2... 5  
    outrast = 100.0 * ((Raster(demlist[k]) - Raster(minlist[k])) / \  
                    (Raster(maxlist[k]) - Raster(minlist[k]))     
    outrastName = 'Rel_elv%s' % k # grid names should be < 13 chars  
    outrast.save(outrastName)