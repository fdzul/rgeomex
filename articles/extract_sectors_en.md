# Extract electoral sections

``` r

library(rgeomex)
library(ggplot2)
```

[`extract_sectores()`](https://fdzul.github.io/rgeomex/reference/extract_sectores.md)
extracts the electoral sections that intersect the boundary of a
locality. It has two arguments: the state key (`cve_edo`) and the name
of the locality (`locality`). It returns a list with two sf objects:
`locality` (the boundary of the locality) and `sectores`.

Only the file of the requested state is downloaded.

## Mérida

``` r

merida <- extract_sectores(cve_edo = "31", locality = "Merida")
nrow(merida$sectores)
#> [1] 465
```

``` r

ggplot() +
  geom_sf(data = merida$sectores, fill = "#E01A59", col = "white", lwd = 0.05) +
  geom_sf(data = merida$locality, fill = NA, col = "black", lwd = 0.3) +
  theme_void()
```

![merida_map](figures/extract_sectors_en-merida_map-1.png)

## Guadalajara

``` r

gdl <- extract_sectores(cve_edo = "14",
                  locality = c("Guadalajara", "Zapopan", "Tonalá", "Tlaquepaque"))
nrow(gdl$sectores)
#> [1] 1696
```

``` r

ggplot() +
  geom_sf(data = gdl$sectores, fill = "#E01A59", col = "white", lwd = 0.05) +
  geom_sf(data = gdl$locality, fill = NA, col = "black", lwd = 0.3) +
  theme_void()
```

![guadalajara_map](figures/extract_sectors_en-guadalajara_map-1.png)

## Mexico City

``` r

cdmx <- extract_sectores(cve_edo = "09", locality = "cdmx")
nrow(cdmx$sectores)
#> [1] 5536
```

``` r

ggplot() +
  geom_sf(data = cdmx$sectores, fill = "#E01A59", col = "white", lwd = 0.05) +
  theme_void()
```

![cdmx_map](figures/extract_sectors_en-cdmx_map-1.png)

## Step by step

The same steps the function does:

``` r

# 1. the locality
loc <- extract_locality(cve_edo = "31", locality = "Merida")

# 2. the dataset of the state
x <- rgeomex_load("sectores_ine20_mx", cve_edo = "31") |>
  sf::st_make_valid()

# 3. what intersects the locality
x <- x[loc, ]
nrow(x)
#> [1] 465
```
