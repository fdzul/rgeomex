# Polygons of localities from México of the National Institute of Geography and Statistics 2019 A spatial dataset containing of polygon data of localities from México

Polygons of localities from México of the National Institute of
Geography and Statistics 2019 A spatial dataset containing of polygon
data of localities from México

## Usage

``` r
loc_inegi19_mx
```

## Format

A sf object with 49981 rows and 7 variables:

- CVEGEO:

  the numeric key. The key included the CVE_ENT and the CVE_MUN.

- CVE_ENT:

  is the numeric key for each state.

- CVE_MUN:

  is the string key to the Municipality.

- CVE_LOC:

  is the string key of locality.

- NOMGEO:

  is a string value. Its the name of locality.

- Ambito:

  is a binary variable with two values, Urbana and Rural.

- geometry:

  simple feature.

## Source

<https://www.inegi.org.mx/temas/mg/#Descargas>

## Details

This datasets were published in september 2019.

## Note

Downloaded from the GeoParquet release of rgeomex-py the first time it
is used; see
[`rgeomex_load()`](https://fdzul.github.io/rgeomex/reference/rgeomex_load.md).
