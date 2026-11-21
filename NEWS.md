# rgeomex 0.2.0

* The datasets are no longer shipped in the package (they made it more than 500 MB, too large for R-universe). They are the GeoParquet files of the release `data-v1` of [rgeomex-py](https://github.com/fdzul/rgeomex-py), downloaded the first time they are used, verified with SHA-256 and kept in a local cache.
* New functions `rgeomex_load()`, `rgeomex_datasets()`, `rgeomex_cache_dir()` and `rgeomex_clear_cache()`.
* The names of the previous versions (`rgeomex::AGEM_inegi19_mx`, `rgeomex::blocks_ine20_mx_a`, ...) still work: they download and read their files on first use.
* The text of the datasets is UTF-8 (accents in `NOMGEO`), and `hrl_mx` has its CRS (EPSG:4326).
* `extract_locality()`, `extract_ageb()`, `extract_blocks()` and `extract_sectores()` read only the state that is requested, so they are faster.
* Fewer dependencies: mapview, ggplot2, lifecycle and magrittr are no longer imported; nanoparquet and jsonlite are.
* Vignettes in English and Spanish, precomputed.
* Authors updated.
