## Ref: https://wcjochem.github.io/sfarrow/index.html
## sfarrow: Read/Write Simple Feature Objects (sf) with ‘Apache’ ‘Arrow’

devtools::install_github("wcjochem/sfarrow@main")

library(sf)
library(sfarrow)

# load Natural Earth low-res dataset. 
# Created in Python with geopandas.to_parquet()
path <- system.file("extdata", "world.parquet", package = "sfarrow")

world <- st_read_parquet(path)

world

plot(sf::st_geometry(world))

# Cargar geodatos
nz <- st_read_parquet("/home/yoviajo/Documentos/lab/geom/python/86/geodat/nz-building-outlines.parquet")

plot(sf::st_geometry(nz))
