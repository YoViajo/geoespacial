#
# Para ejecutar desde la Consola de Python de QGIS
#

miDir = 'C:/temp/OneDrive/LAB/geomat/gps/bici/2019_sem2/'


for vLayer in iface.mapCanvas().layers():
    QgsVectorFileWriter.writeAsVectorFormat( vLayer, 
        miDir + vLayer.name() + ".shp", "utf-8", 
        vLayer.crs(), "ESRI Shapefile" )
		