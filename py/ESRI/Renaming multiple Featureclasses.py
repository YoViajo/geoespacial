import arcpy  
from arcpy import env  
env.workspace = r"C:\temp\python\test.gdb"  
  
lstDatasets = arcpy.ListDatasets("*")  
for dataset in lstDatasets:  
    lstFCs = arcpy.ListFeatureClasses("road_*", "", dataset)  
    for fc in lstFCs:  
        oldName = str(fc)  
        newName = oldName.replace("road", "RD")  
        newName = newName.replace("ns", "_NS12_13")  
        arcpy.Rename_management(fc, newName) 