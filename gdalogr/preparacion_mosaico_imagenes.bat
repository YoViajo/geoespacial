gdalbuildvrt mosaico.vrt *.

gdal_translate -of GTiff mosaico.vrt mosaico2007.tif

gdalwarp -cutline "C:\temp\OneDrive\LAB\geomat\geodat\base\bo-limite_departamental.shp" -crop_to_cutline -dstalpha mosaico2007.tif rec_mosaico2007.tif