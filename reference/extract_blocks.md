# Extract the blocks of a locality

Extracts the blocks (manzanas, INE 2020) that intersect the boundary of
a locality.

## Usage

``` r
extract_blocks(locality, cve_edo)
```

## Arguments

- locality:

  name of the locality (INEGI 2019); the most similar name is used, so
  accents and capital letters do not matter. For Mexico City
  (`cve_edo = "09"`) the whole city is returned.

- cve_edo:

  INEGI key of the state, from `"01"` to `"32"`.

## Value

a list with two sf objects: `locality` (the boundary of the locality)
and `block` (its blocks).

## Author

Felipe Antonio Dzul Manzanilla <felipe.dzul.m@gmail.com>.

## Examples

``` r
# \donttest{
x <- extract_blocks(cve_edo = "31", locality = "Merida")
plot(sf::st_geometry(x$block))

# }
```
