library(rnaturalearthdata)
library(tidyverse)
library(sf)

# Representar país en versión 1:50 millones
countries50 %>% 
  st_as_sf() %>% 
  filter(admin == "Bolivia") %>% 
  ggplot() +
  geom_sf(size = 0,
          color = NA,
          fill = "red")

# Instalar paquete para geodatos de alta resolución de Natural Earth
#install.packages("rnaturalearthhires", repos = "http://packages.ropensci.org", type = "source")
library(rnaturalearthhires)

# Lista funciones y objetos de un paquete
ls("package:rnaturalearthhires")

# Representar país en versión 1:10 millones
countries10 %>% 
  st_as_sf() %>% 
  filter(ADMIN == "Bolivia") %>% 
  ggplot() +
  geom_sf(size = 0,
          color = NA,
          fill = "green")
