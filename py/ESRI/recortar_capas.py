import arcpy

arcpy.env.workspace = r'D:\Projects\GDBs\slowbutter.gdb\IPAS'
rows = arcpy.SearchCursor('HspAOI')
for row in rows:
    feat = row.Shape
    arcpy.Clip_analysis('HspWBD_HU12', feat, 'HspWBD_HU12_' + str(row.getValue('NAME')), '')