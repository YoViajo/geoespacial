ogr2ogr se-20-06_pol.shp se-20-06.dgn -where "OGR_GEOMETRY = 'POLYGON'" -nln se-20-06_pol

ogr2ogr se-20-06_lin.shp se-20-06.dgn -where "OGR_GEOMETRY = 'LINESTRING'" -nln se-20-06_lin

ogr2ogr se-20-06_pto.shp se-20-06.dgn -where "OGR_GEOMETRY = 'POINT'" -nln se-20-06_pto
