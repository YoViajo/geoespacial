## Ref: https://www.earthdatascience.org/courses/earth-analytics/lidar-raster-data-r/crop-raster-data-in-r/
## Ref: https://gis.stackexchange.com/questions/61243/clipping-raster-in-r
## Recorte de datos ráster

# Clear plots
if(!is.null(dev.list())) dev.off()
# Clear console
cat("\014") 
# Clean workspace
rm(list=ls())
setwd("/home/yoviajo/Documentos/lab/proy/30dmc/geodat/esa_worldcover_2020/Bolivia/SC/")

# load the raster and rgdal libraries
library(raster)
library(rgdal)

# open raster layer
capa_ras_1 <- raster("/home/yoviajo/Documentos/lab/proy/30dmc/geodat/esa_worldcover_2020/Bolivia/bol_s18w63.tif")
capa_ras_2 <- raster("/home/yoviajo/Documentos/lab/proy/30dmc/geodat/esa_worldcover_2020/Bolivia/bol_s18w66.tif")
capa_ras_3 <- raster("/home/yoviajo/Documentos/lab/proy/30dmc/geodat/esa_worldcover_2020/Bolivia/bol_s21w63.tif")

# import the vector boundary
extens_rec <- readOGR("/home/yoviajo/Documentos/lab/proy/30dmc/geodat/vector/mun_santacruzdelasierra.shp")

# plot imported shapefile
# notice that you use add = T to add a layer on top of an existing plot in R.
plot(extens_rec,
     main = "Archivo shape importado en R - extensión de recorte",
     axes = TRUE,
     border = "blue")

# recortar el ráster cobertura de la tierra usando la extensión del vector
capa_ras_rec_1 <- crop(capa_ras_1, extent(extens_rec))
masc_capa_ras_rec_1 <- mask(capa_ras_rec_1, extens_rec)
plot(masc_capa_ras_rec_1, main = "Cobertura de la tierra - Municipio Santa Cruz de la Sierra")
writeRaster(masc_capa_ras_rec_1, filename="mun_scz_1.tif", overwrite=TRUE)

capa_ras_rec_2 <- crop(capa_ras_2, extens_rec)
masc_capa_ras_rec_2 <- mask(capa_ras_rec_2, extens_rec)
plot(masc_capa_ras_rec_2, main = "Cobertura de la tierra - Municipio Santa Cruz de la Sierra")
writeRaster(masc_capa_ras_rec_2, filename="mun_scz_2.tif", overwrite=TRUE)

capa_ras_rec_3 <- crop(capa_ras_3, extens_rec)
masc_capa_ras_rec_3 <- mask(capa_ras_rec_3, extens_rec)
plot(masc_capa_ras_rec_3, main = "Cobertura de la tierra - Municipio Santa Cruz de la Sierra")
writeRaster(masc_capa_ras_rec_3, filename="mun_scz_3.tif", overwrite=TRUE)


# MOSAICO DE IMÁGENES PREVIAS

library(easypackages)
library(gdalUtils)

imgs <- c('mun_scz_1.tif', 'mun_scz_2.tif', 'mun_scz_3.tif')

e <- extent(-63.2870833, -62.7626667, -18.0179167, -17.5080833)
plantilla <- raster(e)

proj4string(plantilla) <- CRS('+init=epsg:4326')

writeRaster(plantilla, file="ct_scz.tif", format="GTiff", overwrite=TRUE)
mosaic_rasters(gdalfile=imgs,dst_dataset="ct_scz.tif",of="GTiff")
gdalinfo("ct_scz.tif")

capa_mosaico <- raster("ct_scz.tif")
plot(capa_mosaico, main = "Cobertura de la tierra - Municipio Santa Cruz de la Sierra")
