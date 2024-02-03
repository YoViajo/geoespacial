
#recortar_ras_shp_lotes

import os, fnmatch

CLIP= "/home/yoviajo/Documentos/lab/geom/geodat/vector/bo_limite_nacional_b.shp"
INPUT_FOLDER= "/home/yoviajo/Descargas/d/FABDEM/geodat/orig"
OUTPUT= "/home/yoviajo/Descargas/d/FABDEM/geodat/recortado"


def findRasters (path, filter):
    for root, dirs, files in os.walk(path):
        for file in fnmatch.filter(files, filter):
            yield file

for raster in findRasters(INPUT_FOLDER, '*.tif'):
    inRaster = INPUT_FOLDER + '/' + raster
    outRaster = OUTPUT_FOLDER + '/rec_' + raster
    cmd = 'gdalwarp -q -cutline %s -crop_to_cutline %s %s' % (CLIP, inRaster, outRaster)
    os.system(cmd)
