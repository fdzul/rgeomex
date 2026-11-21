
<!-- README.es.md se genera desde README.es.Rmd. Edita ese archivo -->

# rgeomex <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->

[![r-universe](https://fdzul.r-universe.dev/badges/rgeomex)](https://fdzul.r-universe.dev/rgeomex)
[![R-CMD-check](https://github.com/fdzul/rgeomex/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/fdzul/rgeomex/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

[English](README.md) \| **Español**

rgeomex proporciona los polígonos de México del
[INEGI](https://www.inegi.org.mx/temas/mg) y del
[INE](https://pautas.ine.mx/transparencia/mapas/) en varias resoluciones
(estados, municipios, localidades, AGEB urbanos, manzanas y secciones
electorales), y funciones para extraer los AGEB, manzanas y secciones de
una localidad.

rgeomex es parte del
[dengueverse](https://fdzul.github.io/dengueverse/es/). Su versión en
Python es [rgeomex-py](https://fdzul.github.io/rgeomex-py/); ambas usan
los mismos archivos.

## Instalación

``` r
install.packages("rgeomex",
                 repos = c("https://fdzul.r-universe.dev",
                           "https://cloud.r-project.org"))

# o desde GitHub
# install.packages("pak")
pak::pkg_install("fdzul/rgeomex")
```

## Datos

Desde la versión 0.2.0 las bases no vienen dentro del paquete. Son
archivos GeoParquet que se descargan la primera vez que se usan y se
guardan en un caché local (`rgeomex_cache_dir()`), así la instalación es
ligera y solo se descargan los estados que usas. Los nombres de las
versiones anteriores siguen funcionando (por ejemplo
`rgeomex::AGEM_inegi19_mx`).

| Base | Contenido | Fuente |
|:---|:---|:---|
| `AGEE_inegi19_mx` | estados | INEGI 2019 |
| `AGEM_inegi19_mx`, `AGEM_inegi25_mx` | municipios | INEGI 2019, 2025 |
| `loc_inegi19_mx` | localidades urbanas | INEGI 2019 |
| `AGEB_inegi_2019` | AGEB urbanos (por estado) | INEGI 2019 |
| `blocks_ine20_mx` | manzanas (por estado) | INE 2020 |
| `blocks_ine20_mx_centroid` | centroides de las manzanas (por estado) | INE 2020 |
| `sectores_ine20_mx` | secciones electorales (por estado) | INE 2020 |
| `hrl_mx`, `pua_mx`, `ua_mx` | otros límites urbanos | INEGI |
| `iter_2020_loc` | población de las localidades (tabla) | INEGI 2020 |

## Ejemplo

``` r
library(rgeomex)

# polígono de una localidad
merida <- extract_locality(cve_edo = "31", locality = "Merida")

# AGEB, manzanas y secciones electorales de una localidad
ageb      <- extract_ageb(cve_edo = "31", locality = "Merida")
manzanas  <- extract_blocks(cve_edo = "31", locality = "Merida")
secciones <- extract_sectores(cve_edo = "31", locality = "Merida")

# una base completa, o las filas de algunos estados
rgeomex_datasets()
yucatan <- rgeomex_load("AGEM_inegi19_mx", cve_edo = "31")
```

Para trabajar sin conexión, o para compartir los archivos entre varios
usuarios, define la variable de entorno `RGEOMEX_DATA_DIR` con una
carpeta que tenga los archivos.

## Créditos

Los shapefiles originales son de instituciones oficiales
([INEGI](https://www.inegi.org.mx/temas/mg) e
[INE](https://pautas.ine.mx/transparencia/mapas/)).

## Licencia

MIT; ver [LICENSE.md](LICENSE.md).

## Ayuda

Si encuentras un error, abre un issue con un ejemplo mínimo reproducible
en [GitHub](https://github.com/fdzul/rgeomex/issues). Para preguntas,
escribe a <felipe.dzul.m@gmail.com>.
