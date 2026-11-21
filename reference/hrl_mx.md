# hrl_mx

High risk localities of Mexico

## Usage

``` r
hrl_mx
```

## Format

A sf object with 150 rows and 8 variables:

- cvegeo:

  the ids.

- loc:

  name of the localitie

- ambito:

  type of localities

- geometry:

  geometry column

## Source

<https://geosis.mx/Aplicaciones/EntomologiayControl/Home/IndexNacional>

## Details

This database was built using the SIMN annual goals dataset

## Note

Downloaded from the GeoParquet release of rgeomex-py the first time it
is used; see
[`rgeomex_load()`](https://fdzul.github.io/rgeomex/reference/rgeomex_load.md).
