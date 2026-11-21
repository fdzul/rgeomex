# Polygons of AGEMs from México of the National Institute of Geography and Statistics 2019 A spatial dataset containing of polygon data of AGEM from México

Polygons of AGEMs from México of the National Institute of Geography and
Statistics 2019 A spatial dataset containing of polygon data of AGEM
from México

## Usage

``` r
AGEM_inegi19_mx
```

## Format

A sf object with 2465 rows and 5 variables:

- CVEGEO:

  the numeric key. The key included the CVE_ENT and the CVE_MUN.

- CVE_ENT:

  is the numeric key for each state.

- CVE_MUN:

  is the string key to the Municipality.

- NOMGEO:

  is a string value. Its the name of municipality.

- geometry:

  simple feature.

## Source

<https://www.inegi.org.mx/temas/mg/#Descargas>

## Details

AGEM (Areas GeoEstadisticas Municipales) is stand for Municipality
Geostatistical Areas. This datasets were update 2025.

## Note

Downloaded from the GeoParquet release of rgeomex-py the first time it
is used; see
[`rgeomex_load()`](https://fdzul.github.io/rgeomex/reference/rgeomex_load.md).
