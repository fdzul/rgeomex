# rgeomex

**English** \| [Español](https://fdzul.github.io/rgeomex/README.es.md)

rgeomex provides the geographic boundaries of Mexico from
[INEGI](https://www.inegi.org.mx/temas/mg) and
[INE](https://pautas.ine.mx/transparencia/mapas/) at several resolutions
(states, municipalities, localities, urban AGEB, blocks and electoral
sections), and functions to extract the AGEB, blocks and sections of a
locality.

rgeomex is part of the
[dengueverse](https://fdzul.github.io/dengueverse/). Its Python version
is [rgeomex-py](https://fdzul.github.io/rgeomex-py/); both use the same
files.

## Installation

``` r

install.packages("rgeomex",
                 repos = c("https://fdzul.r-universe.dev",
                           "https://cloud.r-project.org"))

# or from GitHub
# install.packages("pak")
pak::pkg_install("fdzul/rgeomex")
```

## Data

Since version 0.2.0 the datasets are not shipped inside the package.
They are GeoParquet files that are downloaded the first time they are
used and kept in a local cache
([`rgeomex_cache_dir()`](https://fdzul.github.io/rgeomex/reference/rgeomex_cache_dir.md)),
so the installation is small and only the states you use are downloaded.
The names of the previous versions still work (for example
[`rgeomex::AGEM_inegi19_mx`](https://fdzul.github.io/rgeomex/reference/AGEM_inegi19_mx.md)).

| Dataset | Content | Source |
|:---|:---|:---|
| `AGEE_inegi19_mx` | states | INEGI 2019 |
| `AGEM_inegi19_mx`, `AGEM_inegi25_mx` | municipalities | INEGI 2019, 2025 |
| `loc_inegi19_mx` | urban localities | INEGI 2019 |
| `AGEB_inegi_2019` | urban AGEB (by state) | INEGI 2019 |
| `blocks_ine20_mx` | blocks (by state) | INE 2020 |
| `blocks_ine20_mx_centroid` | centroids of the blocks (by state) | INE 2020 |
| `sectores_ine20_mx` | electoral sections (by state) | INE 2020 |
| `hrl_mx`, `pua_mx`, `ua_mx` | other urban boundaries | INEGI |
| `iter_2020_loc` | population of the localities (table) | INEGI 2020 |

## Example

``` r

library(rgeomex)

# boundary of a locality
merida <- extract_locality(cve_edo = "31", locality = "Merida")

# AGEB, blocks and electoral sections of a locality
ageb     <- extract_ageb(cve_edo = "31", locality = "Merida")
blocks   <- extract_blocks(cve_edo = "31", locality = "Merida")
sections <- extract_sectores(cve_edo = "31", locality = "Merida")

# a whole dataset, or the rows of some states
rgeomex_datasets()
yucatan <- rgeomex_load("AGEM_inegi19_mx", cve_edo = "31")
```

To work offline, or to share the files among several users, set the
environment variable `RGEOMEX_DATA_DIR` to a folder that has the files.

## Credits

The original shapefiles are created by official government institutions
([INEGI](https://www.inegi.org.mx/temas/mg) and
[INE](https://pautas.ine.mx/transparencia/mapas/)).

## License

MIT; see [LICENSE.md](https://fdzul.github.io/rgeomex/LICENSE.md).

## Help

If you find a bug, please file a minimal reproducible example on
[GitHub](https://github.com/fdzul/rgeomex/issues). For questions,
contact <felipe.dzul.m@gmail.com>.
