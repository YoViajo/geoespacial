library(exifr)
library(data.table)

# Definir área de trabajo
my_photo_dir <- '/home/yoviajo/Documentos/lab/geom/99/f/b'
file_names <- list.files(my_photo_dir)
paths <- paste0(my_photo_dir,'/',file_names)

# Extraer metadatos EXIF
exifs <- read_exif(paths, tags = c('GPSLatitude','GPSLongitude'))
exifs <- data.table(exifs)

# Exportar a CSV
t <- as.data.frame(exifs)
write.csv(t, "/home/yoviajo/Documentos/lab/geom/99/f/b/imgs_exifs_3.csv")
