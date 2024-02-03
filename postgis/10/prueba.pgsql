SELECT distinct fecha_mes AS mes, count(fecha_dia) AS paseos
FROM "combin_2022_m0102030405"
GROUP BY fecha_mes;