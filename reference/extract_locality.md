# Extract the boundary of a locality

Extract the boundary of a locality

## Usage

``` r
extract_locality(cve_edo, locality)
```

## Arguments

- cve_edo:

  INEGI key of the state, from `"01"` to `"32"`.

- locality:

  name of the locality (INEGI 2019); the most similar name is used, so
  accents and capital letters do not matter. For Mexico City
  (`cve_edo = "09"`) the whole city is returned.

## Value

a sf object with the boundary of the locality.

## Author

Felipe Antonio Dzul Manzanilla <felipe.dzul.m@gmail.com>.

## Examples

``` r
# \donttest{
merida <- extract_locality(cve_edo = "31", locality = "Merida")
# }
```
