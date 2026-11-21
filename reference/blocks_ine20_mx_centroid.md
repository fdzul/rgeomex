# Blocks centroids from México of the National Electoral Institute 2020 A dataset containing of centroid data of blocks from México

Blocks centroids from México of the National Electoral Institute 2020 A
dataset containing of centroid data of blocks from México

## Usage

``` r
blocks_ine20_mx_centroid
```

## Format

A dataframe with 1556070 rows and 4 variables:

- cve_ent:

  the numeric key state

- cve_geo:

  is the numeric key for each block centroid.The key included the key of
  state, municipality, locality, sector and blocks.

- x:

  is the longitude

- y:

  is the latitude

## Source

[INE](https://pautas.ine.mx/transparencia/mapas/)

## Note

Downloaded from the GeoParquet release of rgeomex-py the first time it
is used; see
[`rgeomex_load()`](https://fdzul.github.io/rgeomex/reference/rgeomex_load.md).
