# Extract the blocks of one or several localities

Extracts the blocks (manzanas, INE 2020) that intersect the boundary of
one or several localities.

## Usage

``` r
extract_blocks(locality, cve_edo)
```

## Arguments

- locality:

  name of the locality (INEGI 2019), or a vector of names for several
  localities, e.g. a metropolitan area. The most similar name is used,
  so accents and capital letters do not matter. For Mexico City
  (`cve_edo = "09"`) the whole city is returned.

- cve_edo:

  INEGI key of the state, from `"01"` to `"32"`.

## Value

a list with two sf objects: `locality` (the boundary of the localities)
and `block` (its blocks).

## Author

Felipe Antonio Dzul Manzanilla <felipe.dzul.m@gmail.com>.

## Examples

``` r
# \donttest{
x <- extract_blocks(cve_edo = "31", locality = "Merida")
#> Downloading blocks_ine20_mx_31.parquet (first use only)
plot(sf::st_geometry(x$block))


# several localities: metropolitan area of Guadalajara
gdl <- extract_blocks(cve_edo = "14",
    locality = c("Guadalajara", "Zapopan", "Tonala", "Tlaquepaque"))
#> Warning: No single most similar string found for 'Tonala'. Returning NA. Most similar strings were 'Tonalá', 'Tonaya', 'Tonila'.
#> Downloading blocks_ine20_mx_14.parquet (first use only)
# }
```
