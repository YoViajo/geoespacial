# Import native arcgisscripting module
#
import arcgisscripting

# Create the geoprocessor object
#
gp = arcgisscripting.create(10.2)


# Set the workspace. List all of the feature classes that start with 'G'
#
gp.Workspace = "C:/temp/salida/prueba"
tiffs = gp.ListRasters("*","TIF")

# For each raster in the list of rasters
#
for tiff in tiffs: 
    # Create pyramids
    #
    gp.BuildPyramids(tiff)
    
    
