# Polygons of AGEBs from México of the National Institute of Geography and Statistics 2019

A spatial dataset containing of polygon data of AGEBs from México

## Usage

``` r
AGEB_inegi_2019_a
```

## Format

A sf object with 80202 rows and 10 variables:

- OBJECTID:

  the ids.

- CVEGEO:

  the string key. The key included the CVE_ENT, CVE_MUN, CVE_LOC and
  CVE_AGEB

- CVE_ENT:

  is the string key for each state.

- CVE_MUN:

  is the string key to the Municipality.

- CVE_LOC:

  is string the key of locality.

- CVE_AGEB:

  is the string key of AGEB.

- Ambito:

  is a binary variable with two values, Urbana and Rural. The dataset is
  inly AGEB Urban

- Shape_Leng:

  is the length of polygon

- geometry:

  simple feature.

## Source

<https://www.inegi.org.mx/temas/mg/#Descargas>

## Details

AGEB (Areas GeoEstadisticas Basicas) is stand for basic geostatistical
areas. This datasets were published in september 2019.

## Note

Downloaded from the GeoParquet release of rgeomex-py the first time it
is used; see
[`rgeomex_load()`](https://fdzul.github.io/rgeomex/reference/rgeomex_load.md).
