# Folder of the downloaded datasets

The datasets of rgeomex are downloaded the first time they are used and
kept in this folder. By default it is the user cache folder of R
(`tools::R_user_dir("rgeomex", "cache")`). Set the environment variable
`RGEOMEX_DATA_DIR` (or the option `rgeomex.data_dir`) to use another
folder, for example a shared folder or a folder that already has the
files (offline use).

## Usage

``` r
rgeomex_cache_dir()
```

## Value

the path of the folder.

## Examples

``` r
rgeomex_cache_dir()
#> [1] "/home/runner/.cache/R/rgeomex"
```
