# Clear plots
if(!is.null(dev.list())) dev.off()
# Clear console
cat("\014") 
# Clean workspace
rm(list=ls())


#install.packages("rgdal")
#install.packages("sp")
#install.packages("sf")
#install.packages("ggplot2")
#install.packages("RPostgreSQL")
#install.packages("DBI")

library(rgdal)
library(sp)
library(sf)
library(ggplot2)
library(RPostgreSQL)
library(DBI)


# Replace "path/to/your/file.gpx" with the actual path to your GPX file
gpx_file <- "/home/yoviajo/OneDrive/LAB/geomat/gps/garmin/bici/2023-04-26 07.39.00 Día.gpx"

# Read the GPX file
tracks <- readOGR(dsn=gpx_file, layer="tracks", verbose=FALSE)

# Convertir las trazas en un objeto 'sf'
tracks_sf <- st_as_sf(tracks)

# Get the bounding box of the tracks
tracks_bbox <- st_bbox(tracks_sf)

# Database connection parameters
host <- "localhost"
port <- "5432"
dbname <- "bd_bicicleta"
user <- "postgres"
password <- "postgres"

# Create a connection to the database
con <- dbConnect(RPostgreSQL::PostgreSQL(), host=host, port=port, dbname=dbname, user=user, password=password)

# Leer la capa de fondo de la bd postgis
query <- paste0("SELECT * FROM base_scz_calles")
additional_layer <- st_read(con, query = query)


# Graficar las trazas
ggplot() +
  geom_sf(data = additional_layer, color = "lightgray") + # Move additional_layer first
  geom_sf(data = tracks_sf, color = "blue") +             # Move tracks layer after additional_layer
  coord_sf(xlim = c(tracks_bbox["xmin"], tracks_bbox["xmax"]),
           ylim = c(tracks_bbox["ymin"], tracks_bbox["ymax"])) +
  theme(
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.x = element_blank(),
    axis.ticks.y = element_blank(),
    axis.title.x = element_blank(), # Remove x-axis label
    axis.title.y = element_blank()  # Remove y-axis label
  ) +
  labs(title = "GPX Tracks and Additional Layer",
       x = "Longitude",
       y = "Latitude")

