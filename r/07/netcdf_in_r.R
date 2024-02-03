## Ref: https://pjbartlein.github.io/REarthSysSci/netCDF.html#introduction
## netCDF in R

# load the ncdf4 package
library(ncdf4)

# set path and filename
ncpath <- "/home/yoviajo/Documentos/lab/geom/97/dat/"
ncname <- "spei01"  
ncfname <- paste(ncpath, ncname, ".nc", sep="")
dname <- "spei"  # Standardized Precipitation-Evapotranspiration Index

## Abrir el archivo netCDF

# open a netCDF file
ncin <- nc_open(ncfname)
print(ncin)

## Abrir las variables de coordenadas

# get longitude and latitude
lon <- ncvar_get(ncin,"lon")
nlon <- dim(lon)
head(lon)

lat <- ncvar_get(ncin,"lat")
nlat <- dim(lat)
head(lat)

print(c(nlon,nlat))

# Obtener la variable tiempo y sus atributos

# get time
time <- ncvar_get(ncin,"time")
time

tunits <- ncatt_get(ncin,"time","units")
nt <- dim(time)
nt

tunits

# Obtener una variable

# obtener SPEI
tmp_array <- ncvar_get(ncin,dname)
dlname <- ncatt_get(ncin,dname,"long_name")
dunits <- ncatt_get(ncin,dname,"units")
fillvalue <- ncatt_get(ncin,dname,"_FillValue")
dim(tmp_array)

# get global attributes
title <- ncatt_get(ncin,0,"title")
institution <- ncatt_get(ncin,0,"institution")
datasource <- ncatt_get(ncin,0,"source")
references <- ncatt_get(ncin,0,"references")
history <- ncatt_get(ncin,0,"history")
Conventions <- ncatt_get(ncin,0,"Conventions")

# Revisar lo que hay en el espacio de trabajo actual
ls()


## Reestructuración de ráster a rectangular

# load some packages
library(chron)

library(lattice)
library(RColorBrewer)

# Convertir la variable tiempo

# convert time -- split the time units string into fields
tustr <- strsplit(tunits$value, " ")
tdstr <- strsplit(unlist(tustr)[3], "-")
tmonth <- as.integer(unlist(tdstr)[2])
tday <- as.integer(unlist(tdstr)[3])
tyear <- as.integer(unlist(tdstr)[1])
chron(time,origin=c(tmonth, tday, tyear))

# Sustituir los valores de llenado de netCDF por NA de R

# replace netCDF fill values with NA's
tmp_array[tmp_array==fillvalue$value] <- NA

length(na.omit(as.vector(tmp_array[,,1])))

# Obtener una sola porción de datos

# get a single slice or layer (January)
m <- 1
tmp_slice <- tmp_array[,,m]

# quick map
image(lon,lat,tmp_slice, col=brewer.pal(10,"RdBu"))

# Un mejor mapa con levelplot

# levelplot of the slice
grid <- expand.grid(lon=lon, lat=lat)
cutpts <- c(-2.33, -1.65, -1.28, -0.84, 0, 0.84, 1.28, 1.65, 2.33)
levelplot(tmp_slice ~ lon * lat, data=grid, at=cutpts, cuts=9, pretty=T, 
          col.regions=(brewer.pal(9,"RdBu")))

# Crear un data frame

# create dataframe -- reshape data
# matrix (nlon*nlat rows by 2 cols) of lons and lats
lonlat <- as.matrix(expand.grid(lon,lat))
dim(lonlat)

# vector of `spei` values
tmp_vec <- as.vector(tmp_slice)
length(tmp_vec)

# create dataframe and add names
tmp_df01 <- data.frame(cbind(lonlat,tmp_vec))
names(tmp_df01) <- c("lon","lat",paste(dname,as.character(m), sep="_"))
head(na.omit(tmp_df01), 10)

# Escribir el data frame

# set path and filename
csvpath <- "/home/yoviajo/Documentos/lab/geom/97/dat/"
csvname <- "spei_1.csv"
csvfile <- paste(csvpath, csvname, sep="")
write.table(na.omit(tmp_df01),csvfile, row.names=FALSE, sep=",")


# reshape the array into vector
tmp_vec_long <- as.vector(tmp_array)
length(tmp_vec_long)

# reshape the vector into a matrix
tmp_mat <- matrix(tmp_vec_long, nrow=nlon*nlat, ncol=nt)
dim(tmp_mat)


# Filtrar contenido a cobertura de Bolivia
library(dplyr)

bo_tmp_df01 <- tmp_df01 %>% filter(lat >= -22.906568380000000 & lat <= -9.669632999999999) %>% filter(lon >= -69.644826519999995 & lon <= -57.454433280000003)

# Convertir DF Bolivia a ráster y mostrar
library(raster)
dfr <- rasterFromXYZ(bo_tmp_df01)  #Convert first two columns as lon-lat and third as value                
plot(dfr)
dfr 

summary(dfr)


# Un mejor mapa

library(ggplot2)

shp = ggplot2::fortify(shapefile("/home/yoviajo/Documentos/lab/geom/geodat/vector/bo_limite_nacional_b.shp"))

my_col <- brewer.pal(9,"RdBu")

ggplot() +  
  ggplot2::geom_raster(data = bo_tmp_df01 , aes(x = lon, y = lat, fill = spei_1)) +
  #ggplot2::scale_fill_manual(values = my_col, name = "SPEI")
  ggplot2::coord_quickmap() +
  ggplot2::geom_path(data=shp,aes(long, lat),colour="black")

