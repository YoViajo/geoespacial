for f in *.shp
    do shp2pgsql -c -D -s 4326 -I $f public.${f%.*} | psql -h localhost -d bd_natural_earth -U postgres -W
done
