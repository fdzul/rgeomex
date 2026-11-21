# Polygons of AGEEs from México of the National Institute of Geography and Statistics 2019 A spatial dataset containing of polygon data of AGEE from México

Polygons of AGEEs from México of the National Institute of Geography and
Statistics 2019 A spatial dataset containing of polygon data of AGEE
from México

## Usage

``` r
AGEE_inegi19_mx
```

## Format

A sf object with 32 rows and 4 variables:

- CVEGEO:

  the numeric key. The key included the CVE_ENT.

- CVE_ENT:

  is the numeric key for each state.

- NOMGEO:

  is a string value. Its the name of state.

- geometry:

  simple feature.

## Source

<https://www.inegi.org.mx/temas/mg/#Descargas>

## Details

AGEE (Areas GeoEstadisticas Estatales) is stand for State Geostatistical
Areas. This datasets were published in september 2019.

## Note

Downloaded from the GeoParquet release of rgeomex-py the first time it
is used; see
[`rgeomex_load()`](https://fdzul.github.io/rgeomex/reference/rgeomex_load.md).
