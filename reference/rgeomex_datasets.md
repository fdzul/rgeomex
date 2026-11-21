# Table of the available datasets

Table of the available datasets

## Usage

``` r
rgeomex_datasets()
```

## Value

a data.frame with the name of each dataset, whether it is split by state
and whether it has geometry.

## Examples

``` r
rgeomex_datasets()
#>                     dataset by_state geometry
#> 1           AGEE_inegi19_mx    FALSE     TRUE
#> 2           AGEM_inegi19_mx    FALSE     TRUE
#> 3           AGEM_inegi25_mx    FALSE     TRUE
#> 4            loc_inegi19_mx    FALSE     TRUE
#> 5                    hrl_mx    FALSE     TRUE
#> 6                    pua_mx    FALSE     TRUE
#> 7                     ua_mx    FALSE     TRUE
#> 8             iter_2020_loc    FALSE    FALSE
#> 9           AGEB_inegi_2019     TRUE     TRUE
#> 10          blocks_ine20_mx     TRUE     TRUE
#> 11 blocks_ine20_mx_centroid     TRUE     TRUE
#> 12        sectores_ine20_mx     TRUE     TRUE
```
