## Ref: https://dominicroye.github.io/en/2022/hillshade-effects/
## Hillshade effects


## PAQUETES

# install the packages if necessary
if(!require("tidyverse")) install.packages("tidyverse")
if(!require("sf")) install.packages("sf")
if(!require("elevatr")) install.packages("elevatr")
if(!require("terra")) install.packages("terra")
if(!require("whitebox")) install.packages("whitebox")
if(!require("tidyterra")) install.packages("tidyterra")
if(!require("giscoR")) install.packages("giscoR")
if(!require("ggnewscale")) install.packages("ggnewscale")

# packages
library(sf)
library(elevatr)
library(tidyverse)
library(terra)
library(whitebox)
library(ggnewscale)
library(tidyterra)
library(units)
library(raster)

## DATOS

tari <- st_read("/home/yoviajo/Documentos/lab/geom/r/97/geodat/lim_dpto_tarija.shp")
plot(tari)


## MODELO DIGITAL DE ELEVACIÓN

# get the DEM with
mdt <- get_elev_raster(tari, z = 10)
mdt # old RasterLayer class
plot(mdt)

# filtrar valores negativos
tmpfilter <- mdt < 0
mdt2 <- mask(mdt, tmpfilter, maskvalue=1)
plot(mdt2)

# calcular valores mínimos y máximos
a <- setMinMax(mdt2)
# dpto. de Tarija, mín = 114 msnm, máx 4671 msnm
a

# plot histogram
hist(mdt2,
     main = "Distribución de valores de elevación",
     xlab = "Elevación (metros)", ylab = "Frecuencia",
     col = "springgreen")

# convert to terra and mask area of interest
mdt <- rast(mdt) %>% 
  mask(vect(tari)) 

# reproject
mdt <- project(mdt, "+proj=utm +zone=20 +south +datum=WGS84 +units=m +no_defs")

# reproject vect
tari <- st_transform(tari, "+proj=utm +zone=20 +south +datum=WGS84 +units=m +no_defs")

# convert the raster into a data.frame of xyz
mdtdf <- as.data.frame(mdt, xy = TRUE)
names(mdtdf)[3] <- "alt"

# map
p <- ggplot() +
  geom_raster(data = mdtdf,
              aes(x, y, fill = alt)) +
  scale_fill_hypso_tint_c(breaks = c(180, 250, 500, 1000,
                                     1500,  2000, 2500,
                                     3000, 3500, 4000)) +
  guides(fill = guide_colorsteps(barwidth = 20,
                                 barheight = .5,
                                 title.position = "right")) +
  labs(fill = "m") +
  coord_sf() +
  theme_void() +
  theme(legend.position = "bottom")
p

## CALCULAR EL RELIEVE SOMBREADO

# estimate the slope
sl <- terrain(mdt, "slope", unit = "radians")
plot(sl)

# estimate the aspect or orientation
asp <- terrain(mdt, "aspect", unit = "radians")
plot(asp)

# calculate the hillshade effect with 45º of elevation
hill_single <- shade(sl, asp, 
                     angle = 45, 
                     direction = 300,
                     normalize= TRUE)

# final hillshade 
plot(hill_single, col = grey(1:100/100))


## COMBINAR EL EFECTO DE RELIEVE Y SOMBRA

# convert the hillshade to xyz
hilldf_single <- as.data.frame(hill_single, xy = TRUE)

# map 
p <- ggplot() +
  geom_raster(data = hilldf_single,
              aes(x, y, fill = lyr1),
              show.legend = FALSE) +
  scale_fill_distiller(palette = "Greys") +
  new_scale_fill() +
  geom_raster(data = mdtdf,
              aes(x, y, fill = alt),
              alpha = .7) +
  scale_fill_hypso_tint_c(breaks = c(180, 250, 500, 1000,
                                     1500,  2000, 2500,
                                     3000, 3500, 4000)) +
  guides(fill = guide_colorsteps(barwidth = 20,
                                 barheight = .5,
                                 title.position = "right")) +
  labs(fill = "m") +
  coord_sf() +
  theme_void() +
  theme(legend.position = "bottom")
p


## SOMBRAS MULTIDIRECCIONALES

# pass multiple directions to shade()
hillmulti <- map(c(270, 15, 60, 330), function(dir){ 
  shade(sl, asp, 
        angle = 45, 
        direction = dir,
        normalize= TRUE)}
)

# create a multidimensional raster and reduce it by summing up
hillmulti <- rast(hillmulti) %>% sum()

# multidirectional
plot(hillmulti, col = grey(1:100/100))

# unidirectional
plot(hill_single, col = grey(1:100/100))


# convert the hillshade to xyz
hillmultidf <- as.data.frame(hillmulti, xy = TRUE)

# map
p <- ggplot() +
  geom_raster(data = hillmultidf,
              aes(x, y, fill = sum),
              show.legend = FALSE) +
  scale_fill_distiller(palette = "Greys") +
  new_scale_fill() +
  geom_raster(data = mdtdf,
              aes(x, y, fill = alt),
              alpha = .7) +
  scale_fill_hypso_tint_c(breaks = c(180, 250, 500, 1000,
                                     1500,  2000, 2500,
                                     3000, 3500, 4000)) +
  guides(fill = guide_colorsteps(barwidth = 20,
                                 barheight = .5,
                                 title.position = "right")) +
  labs(fill = "m") +
  coord_sf() +
  theme_void() +
  theme(legend.position = "top")
p


## OTRA ALTERNATIVA PARA SOMBRAS MULTIDIRECCIONALES

# install whitebox
install_whitebox()

# export the DEM
writeRaster(mdt, "mdt.tiff", overwrite = TRUE)

# launch whitebox
wbt_init()

# create the hillshade
wbt_multidirectional_hillshade("mdt.tiff",
                               "hillshade.tiff")

# re-import the hillshade
hillwb <- rast("hillshade.tiff")
plot(hillwb)

# remask 
hillwb <- mask(hillwb, vect(tari))
plot(hillwb)


# convert the hillshade to xyz
hillwbdf <- as.data.frame(hillwb, xy = TRUE)

# map
p <- ggplot() +
  geom_raster(data = hillwbdf,
              aes(x, y, fill = hillshade),
              show.legend = FALSE) +
  scale_fill_distiller(palette = "Greys") +
  new_scale_fill() +
  geom_raster(data = mdtdf,
              aes(x, y, fill = alt),
              alpha = .7) +
  scale_fill_hypso_tint_c(breaks = c(180, 250, 500, 1000,
                                     1500,  2000, 2500,
                                     3000, 3500, 4000)) +
  guides(fill = guide_colorsteps(barwidth = 20,
                                 barheight = .5,
                                 title.position = "right")) +
  labs(fill = "m") +
  coord_sf() +
  theme_void()  +
  theme(legend.position = "top")
p
