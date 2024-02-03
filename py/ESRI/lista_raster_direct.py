The code segment:

#Find the input  Grid feature classes
for root, dirs, files in os.walk(InputFolder):
    for targetdir in dirs:
        targetworkspace = root + "\\" + targetdir
        arcpy.env.workspace = targetworkspace
        rasterInDir = arcpy.ListRasters("*", "GRID")
        if len(rasterInDir) > 0:
            for raster in rasterInDir:
                rasterList.append(targetworkspace + "\\" + raster)
            
for raster in rasterList:
        print raster

 

The output of the print statement, in part:

c:\avdata\PythonTest\ClipLidar\TestData\Input\BareEarth\hillsha_tane1
..
..
c:\avdata\PythonTest\ClipLidar\TestData\Input\BareEarth\hillsha_tane1\hillsha_tane1