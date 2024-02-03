# MAPA INTERACTIVO DE MUNICIPIOS DE BOLIVIA
#
# basado en:
# Ref: https://www.helenmakesmaps.com/post/how-to-make-your-first-interactive-map-in-r-gis
# How-to: Make your first interactive map in R


# Clear plots
if(!is.null(dev.list())) dev.off()
# Clear console
cat("\014") 
# Clean workspace
rm(list=ls())

library(utils)
library(leaflet)
library(rgdal)
#install.packages("RColorBrewer")
library(RColorBrewer)

# Cargar datos de repositorio remoto
munBo <- readOGR("/vsitar//vsicurl/https://github.com/YoViajo/geodatos/raw/master/bol_municipios_339_pob2012_ed.geojson.tar.gz")
plot(munBo)

# Mapa interactivo básico
m <- leaflet() %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addPolygons(data = munBo,
              stroke = TRUE,
              weight = 0.5,
              color = "#37B1ED",
              opacity = 1,
              fillColor = "#37B1ED",
              fillOpacity = 0.5)
m

# Revisar conjunto de datos
names(munBo)
summary(munBo)

# Limpieza de datos: quitar polígonos sin población (lagos mayores, salares,...)
munBo <-subset(munBo, munBo$pob2012_> 0)

# Definir rampas de colores
munBoBins <- c(0, 12273, 29518, 53062, 137029, 630587, 848840, 1453550)
munBoPal <- colorBin("YlGnBu", domain = munBo$pob2012_, bins = munBoBins)

# Rampas alternativas de colores: Cuantil y Continuo
#munBoPal <- colorQuantile(palette = "YlGnBu", munBo$pob2012_, n=7)
#munBoPal <- colorNumeric(
#  palette = "YlGnBu",
#  domain = munBo$pob2012_)

# Mapa interactivo mejorado
m <- leaflet() %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addPolygons(data = munBo,
              stroke = TRUE,
              weight = 0.2,
              color = "#ABABAB",
              smoothFactor = 0.3, # añadir factor de suavizado
              opacity = 0.9,
              fillColor = ~munBoPal(pob2012_),  # aplicar el esquema de color
              fillOpacity = 0.8)
m

# Añadir una leyenda

m <- leaflet() %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addPolygons(data = munBo,
              stroke = TRUE,
              weight = 0.2,
              color = "#ABABAB",
              smoothFactor = 0.3, # añadir factor de suavizado
              opacity = 0.9,
              fillColor = ~munBoPal(pob2012_),  # aplicar el esquema de color
              fillOpacity = 0.8) %>%
  addLegend("bottomright",opacity = 1,
            colors =c("#ffffcc","#c7e9b4","#7fcdbb","#41b6c4","#1d91c0","#225ea8","#0c2c84"),
            title = "Población</br>2012, municipios",
            labels= c("<12.273","12.273 - 29.518","29.518 - 53.062","53.062 - 137.029","137.029 - 630.587", "630.587 - 848.840", "848.840 - 1.453.550")
  )
m
