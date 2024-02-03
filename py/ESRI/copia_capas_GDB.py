import os
import arcpy 
arcpy.env.workspace = ws = 'C:\\WorkSpace\\sahie_saipe\\sahie_saipe.gdb'
dictionary_Layer = {'co06_Layer':'co06', 'co07_Layer':'co07', 'cnty08_Layer':'co08', 'co09_Layer':'co09', 'co10_Layer':'co10', 'co11_Layer':'co11', 'co12_Layer':'co12', 'st_Select':'state'}
for layer in arcpy.mapping.ListLayers(mxd):
    if layer.name in dictionary_Layer.keys():
        old = os.path.join(ws, layer.name)
        new = os.path.join(ws, dictionary_Layer[layer.name])
        try:
            arcpy.CopyFeatures_management(old,new,"")
            print 'copy %s to %s' %(layer.name, dictionary_Layer[layer.name])
        except:
            print 'Could not copy %s'(layer.name)

            print 'Could not copy %s'
