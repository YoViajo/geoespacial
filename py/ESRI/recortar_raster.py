import arcgisscripting
gp = arcgisscripting.create()

gp.workspace = "C:/PROF/CONS/PROAGRO/analisis/compilDat/IPCC4_CIAT/A1B/2030s/prec"

rasList = gp.ListRasters()

cuenta = 0
nombre = rasList.next()
while nombre != None:
    nomsalida = "Chaco_" + nombre.split(".")[0] + ".tif"
    gp.Clip_management(nombre, "#", nomsalida,"limite_region_Chaco_ai2km_ll", "0", "ClippingGeometry")
    cuenta = cuenta + 1
    nombre = rasList.next()


