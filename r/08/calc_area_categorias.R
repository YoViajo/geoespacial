## Ref: https://gis.stackexchange.com/questions/229455/calculating-areas-of-different-raster-classes-in-r
## Ref: https://rdrr.io/cran/raster/man/projectRaster.html


# Clear plots
if(!is.null(dev.list())) dev.off()
# Clear console
cat("\014") 
# Clean workspace
rm(list=ls())
setwd("/home/yoviajo/Documentos/lab/proy/30dmc/geodat/esa_worldcover_2020/Bolivia/SC/")

r <- raster("ct_scz.tif")

# proj.4 projection description
pry_utm20s <- "+proj=utm +zone=20 +south +datum=WGS84 +units=m +no_defs"

# Cambiar proyección
r_pry <- projectRaster(r, crs=pry_utm20s, res=10)

# Calcular área de categorías
vals <- getValues(r_pry)
length(subset(vals, vals == 100)) * res(r_pry)^2
