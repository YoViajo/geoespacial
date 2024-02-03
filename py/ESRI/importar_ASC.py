#Importa archivos ASCII (.ASC) a raster

# Import system modules
import arcgisscripting, os

# Create the Geoprocessor object
gp = arcgisscripting.create()

# Set local variables
InAsciiFile = None
inDir = r"C:\temp\salida\PROAGRO\worldclim\A1B 2070s\tmax\ASC"
OutRaster = r"C:\temp\salida\PROAGRO\worldclim\A1B 2070s\tmax"
gp.outputCoordinateSystem = r"C:\Program Files (x86)\ArcGIS\Desktop10.0\Coordinate Systems\Geographic Coordinate Systems\World\WGS 1984.prj"

for InAsciiFile in os.listdir(inDir):
   for InAsciiFile in os.listdir(inDir):
        print InAsciiFile
        # Process: ASCIIToRaster_conversion
        gp.ASCIIToRaster_conversion(os.path.join(inDir,InAsciiFile), os.path.join(OutRaster,InAsciiFile.rsplit(".")[0]), "FLOAT")