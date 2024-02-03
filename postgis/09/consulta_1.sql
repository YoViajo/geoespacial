SELECT fuente AS autor, count(fuente) AS registros
FROM PUBLIC.LISTA_AVES_JBSC_ED
GROUP BY fuente
ORDER BY registros DESC