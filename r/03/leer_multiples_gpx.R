#install.packages("sf")
#install.packages("ggplot2")
#install.packages("dplyr")

library(sf)
library(ggplot2)
library(dplyr)

# Función para leer las trazas de archivos GPX
read_gpx_tracks <- function(gpx_file) {
  gpx_data <- st_read(gpx_file, layer = "tracks", quiet = TRUE)
  gpx_data <- st_coordinates(st_cast(gpx_data, "LINESTRING"))
  gpx_df <- as.data.frame(gpx_data)
  colnames(gpx_df) <- c("lon", "lat")
  return(gpx_df)
}

# Listar todos los archivos GPX en un directorio y leerlos en un solo DF 
gpx_directory <- "/home/yoviajo/OneDrive/LAB/geomat/gps/garmin/bici"
gpx_files <- list.files(gpx_directory, pattern = "\\.gpx$", full.names = TRUE)
gpx_data_list <- lapply(gpx_files, read_gpx_tracks)
gpx_data_all <- bind_rows(gpx_data_list)

# Graficar las trazas GPX combinadas
ggplot(gpx_data_all, aes(x = lon, y = lat, group = factor(row.names(gpx_data_all)))) +
  geom_path(color = "blue") +
  theme_minimal() +
  coord_quickmap() +
  labs(title = "Combined GPX Tracks",
       x = "Longitude",
       y = "Latitude")
