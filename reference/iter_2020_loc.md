# Iter 2020

A spatial dataset containing of the National Institute of Geography and
Statistics INEGI ITER 2020

## Usage

``` r
iter_2020_loc
```

## Format

A sf object with 189432 rows and 10 variables:

- entidad:

  the ids.

- nom_ent:

  the ids.

- mun:

  is the numeric key of state.

- nom_mun:

  is the numeric key of federal district.

- nom_loc:

  is the numeric key of federal district.

- loc:

  is the numeric key to the Municipality

- longitud:

  is the numeric key to the Sectors

- latitud:

  is numeric the key of tipo

- altitud:

  is the simple feature

- pobtot:

## Source

<https://www.inegi.org.mx/programas/ccpv/2020/#datos_abiertos>

## Details

This datasets were published in July 26 2021.

## Note

Downloaded from the GeoParquet release of rgeomex-py the first time it
is used; see
[`rgeomex_load()`](https://fdzul.github.io/rgeomex/reference/rgeomex_load.md).
