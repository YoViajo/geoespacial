for %%f in (*.dgn) do ogr2ogr -f "ESRI Shapefile" ".\pto\%%~nf.shp" "%%f" -where "OGR_GEOMETRY = 'POINT'" -skipfailures

for %%f in (*.dgn) do ogr2ogr -f "ESRI Shapefile" ".\lin\%%~nf.shp" "%%f" -where "OGR_GEOMETRY = 'LINESTRING'" -skipfailures

for %%f in (*.dgn) do ogr2ogr -f "ESRI Shapefile" ".\pol\%%~nf.shp" "%%f" -where "OGR_GEOMETRY = 'POLYGON'" -skipfailures