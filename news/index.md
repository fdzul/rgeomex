# Changelog

## rgeomex 0.2.0

- The datasets are no longer shipped in the package (they made it more
  than 500 MB, too large for R-universe). They are the GeoParquet files
  of the release `data-v1` of
  [rgeomex-py](https://github.com/fdzul/rgeomex-py), downloaded the
  first time they are used, verified with SHA-256 and kept in a local
  cache.
- New functions
  [`rgeomex_load()`](https://fdzul.github.io/rgeomex/reference/rgeomex_load.md),
  [`rgeomex_datasets()`](https://fdzul.github.io/rgeomex/reference/rgeomex_datasets.md),
  [`rgeomex_cache_dir()`](https://fdzul.github.io/rgeomex/reference/rgeomex_cache_dir.md)
  and
  [`rgeomex_clear_cache()`](https://fdzul.github.io/rgeomex/reference/rgeomex_clear_cache.md).
- The names of the previous versions
  ([`rgeomex::AGEM_inegi19_mx`](https://fdzul.github.io/rgeomex/reference/AGEM_inegi19_mx.md),
  [`rgeomex::blocks_ine20_mx_a`](https://fdzul.github.io/rgeomex/reference/blocks_ine20_mx_a.md),
  …) still work: they download and read their files on first use.
- The text of the datasets is UTF-8 (accents in `NOMGEO`), and `hrl_mx`
  has its CRS (EPSG:4326).
- [`extract_locality()`](https://fdzul.github.io/rgeomex/reference/extract_locality.md),
  [`extract_ageb()`](https://fdzul.github.io/rgeomex/reference/extract_ageb.md),
  [`extract_blocks()`](https://fdzul.github.io/rgeomex/reference/extract_blocks.md)
  and
  [`extract_sectores()`](https://fdzul.github.io/rgeomex/reference/extract_sectores.md)
  read only the state that is requested, so they are faster.
- Fewer dependencies: mapview, ggplot2, lifecycle and magrittr are no
  longer imported; nanoparquet and jsonlite are.
- Vignettes in English and Spanish, precomputed.
- Authors updated.
