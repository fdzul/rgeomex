# Polygons of blocks from México of the National Electoral Institute 2020

A spatial dataset containing of polygon data of blocks from México

## Usage

``` r
blocks_ine20_mx_d
```

## Format

A sf object with 2278337 rows and 19 variables:

- gid:

  the ids.

- id:

  the ids.

- entidad:

  is the numeric key of state.

- distrito:

  is the numeric key of federal district.

- municipio:

  is the numeric key to the Municipality

- seccion:

  is the numeric key to the Sectors

- localidad:

  is numeric the key of locality

- manzana:

  is the numeric key of blocks

- geometry:

  simple feature.

## Source

<https://pautas.ine.mx/transparencia/mapas/>

## Details

This datasets were published in october 2020.

## Note

Downloaded from the GeoParquet release of rgeomex-py the first time it
is used; see
[`rgeomex_load()`](https://fdzul.github.io/rgeomex/reference/rgeomex_load.md).
