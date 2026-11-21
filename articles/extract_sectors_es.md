# Extraer secciones electorales

``` r

library(rgeomex)
library(ggplot2)
```

[`extract_sectores()`](https://fdzul.github.io/rgeomex/reference/extract_sectores.md)
extrae las secciones electorales que intersectan el polígono de una
localidad. Tiene dos argumentos: la clave del estado (`cve_edo`) y el
nombre de la localidad (`locality`). Regresa una lista con dos objetos
sf: `locality` (el polígono de la localidad) y `sectores`.

Solo se descarga el archivo del estado que se pide.

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

![plot of chunk merida_map](figures/extract_sectors_es-merida_map-1.png)

plot of chunk merida_map

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

![plot of chunk
guadalajara_map](figures/extract_sectors_es-guadalajara_map-1.png)

plot of chunk guadalajara_map

## Ciudad de México

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

![plot of chunk cdmx_map](figures/extract_sectors_es-cdmx_map-1.png)

plot of chunk cdmx_map

## Con código

Los mismos pasos que hace la función:

``` r

# 1. la localidad
loc <- extract_locality(cve_edo = "31", locality = "Merida")

# 2. la base del estado
x <- rgeomex_load("sectores_ine20_mx", cve_edo = "31") |>
  sf::st_make_valid()

# 3. lo que intersecta la localidad
x <- x[loc, ]
nrow(x)
#> [1] 465
```
