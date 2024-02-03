for f in *.gpx
do



    shp2pgsql -s 4326 %f public.`basename $f .shp` | psql -d bd_natural_earth > /dev/null
done
