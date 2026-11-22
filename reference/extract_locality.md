# Extract the boundary of one or several localities

Extract the boundary of one or several localities

## Usage

``` r
extract_locality(cve_edo, locality)
```

## Arguments

- cve_edo:

  INEGI key of the state, from `"01"` to `"32"`.

- locality:

  name of the locality (INEGI 2019), or a vector of names for several
  localities, e.g. a metropolitan area. The most similar name is used,
  so accents and capital letters do not matter. For Mexico City
  (`cve_edo = "09"`) the whole city is returned.

## Value

a sf object with the boundary of the locality (one row per locality).

## Author

Felipe Antonio Dzul Manzanilla <felipe.dzul.m@gmail.com>.

## Examples

``` r
# \donttest{
merida <- extract_locality(cve_edo = "31", locality = "Merida")

# metropolitan area of Guadalajara
gdl <- extract_locality(cve_edo = "14",
                        locality = c("Guadalajara", "Zapopan",
                                     "Tonala", "Tlaquepaque"))
#> Warning: No single most similar string found for 'Tonala'. Returning NA. Most similar strings were 'Tonalá', 'Tonaya', 'Tonila'.
# }
```
