# Polygons of sectores from México of the National Electoral Institute 2020

A spatial dataset containing of polygon data of sectores from México

## Usage

``` r
sectores_ine20_mx_c
```

## Format

A sf object with 23175 rows and 11 variables:

- gid:

  the ids.

- id:

  the ids.

- entidad:

  is the numeric key of state.

- distrito:

  is the numeric key of federal district.

- distrito_l:

  is the numeric key of federal district.

- municipio:

  is the numeric key to the Municipality

- seccion:

  is the numeric key to the Sectors

- tipo:

  is numeric the key of tipo

- geometry1\_:

  is the simple feature

- ln:

- pad:

- geometry:

  simple feature.

## Source

<https://pautas.ine.mx/transparencia/mapas/>

## Details

This datasets were published in october 2023.

## Note

Downloaded from the GeoParquet release of rgeomex-py the first time it
is used; see
[`rgeomex_load()`](https://fdzul.github.io/rgeomex/reference/rgeomex_load.md).
