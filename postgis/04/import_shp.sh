for f in *.shp
do
    shp2pgsql -s 4326 %f public.`basename $f .shp` | psql -d bd_rocky > /dev/null
donel
