# Clear plots
if(!is.null(dev.list())) dev.off()
# Clear console
cat("\014") 
# Clean workspace
rm(list=ls())


# Ref: https://mappinggis.com/2020/01/como-integrar-postgresql-postgis-en-r/
# Cómo integrar PostgreSQL – PostGIS en R

# 1.0 Instalación y carga de paquetes
# interfaz compatible con DBI para gestionar Postgres/Postgis
#install.packages("RPostgres")
# funciones para el acceso a varios SGBD
#install.packages("DBI")
# para la representación de objetos geográficos
#install.packages("sf")
library(DBI)
library(RPostgres)
library(sf)

# CONEXIÓN A UNA BASE DE DATOS
# 2.0 Parámetros de conexión a PostgreSQL
dvr <- RPostgres::Postgres()
db <- 'bd_bolivia_base'  ##Nombre de la BBDD
host_db <- 'localhost'
db_port <- '5432' 
db_user <- 'postgres'  ##Tu usuario
db_password <- 'postgres' ##Tu contraseña 

# 3.0 Conexión
con <- dbConnect(dvr, dbname = db, host=host_db, port=db_port,
                 user=db_user, password=db_password)

# 4.0 Listado de tablas de la Base de Datos
dbListTables(con)

# 5.0 Lectura de una tabla
lim_dptos <- st_read(con, layer = "bo_limite_departamental_ed")
print(lim_dptos)

# 6.0 Query --> Selección de algunos elementos de la tabla
consulta <- "SELECT \"NOM_DPTO\", pob2012 FROM \"bo_limite_departamental_ed\""
res <- dbSendQuery(con, consulta)
dbFetch(res)
dbClearResult(res)

# Duplicar una tabla que será borrada después
consulta <- "CREATE TABLE \"bo_limite_departamental_ed_dup\" as (SELECT * FROM \"bo_limite_departamental_ed\")"
res <- dbSendQuery(con, consulta)
dbClearResult(res)

# 7.0 Query --> Borrado de un elemento de la tabla duplicada
res <- dbSendQuery(con, "DELETE FROM \"bo_limite_departamental_ed_dup\" WHERE \"NOM_DPTO\" = \'Beni\'") 
dbFetch(res)
dbClearResult(res)

# 8.0 Cerrar conexión 
dbDisconnect(con)
