# Load a dataset

Reads a dataset of rgeomex. The file is downloaded the first time it is
used (see
[`rgeomex_cache_dir()`](https://fdzul.github.io/rgeomex/reference/rgeomex_cache_dir.md));
later it is read from the cache.

## Usage

``` r
rgeomex_load(dataset, cve_edo = NULL)
```

## Arguments

- dataset:

  name of the dataset (see
  [`rgeomex_datasets()`](https://fdzul.github.io/rgeomex/reference/rgeomex_datasets.md)),
  for example `"AGEM_inegi19_mx"` or `"blocks_ine20_mx"`.

- cve_edo:

  INEGI state key(s), from `"01"` to `"32"` (numbers are also accepted).
  It is required for the datasets split by state (`"AGEB_inegi_2019"`,
  `"blocks_ine20_mx"`, `"blocks_ine20_mx_centroid"`,
  `"sectores_ine20_mx"`); for the other datasets it filters the rows of
  the state(s).

## Value

a sf object (a data.frame for `"iter_2020_loc"`).

## Author

Felipe Antonio Dzul Manzanilla <felipe.dzul.m@gmail.com>.

## Examples

``` r
# \donttest{
yuc <- rgeomex_load("AGEM_inegi19_mx", cve_edo = "31")
blocks <- rgeomex_load("blocks_ine20_mx", cve_edo = "31")
# }
```
