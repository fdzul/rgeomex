
<!-- README.md is generated from README.Rmd. Please edit that file -->

# **rgeomex**

[![Build
Status](https://travis-ci.org/pages-themes/cayman.svg?branch=master)](https://travis-ci.org/pages-themes/cayman)
[![Gem
Version](https://badge.fury.io/rb/jekyll-theme-cayman.svg)](https://badge.fury.io/rb/jekyll-theme-cayman)[![Github
All
Releases](https://img.shields.io/github/downloads/fdzul/geomex/total.svg)]()

**rgeomex is a package developed in the department of prevention and
control of diseases transmitted by vector of the [Secretary of Health of
Veracruz](https://www.ssaver.gob.mx/) with colaboration of the
[CENAPRECE](https://www.gob.mx/salud/cenaprece) and
[INDRE](https://www.gob.mx/salud/acciones-y-programas/instituto-de-diagnostico-y-referencia-epidemiologicos-mision-vision-y-politica-de-calidad-181639?state=published)**

## **overview**

**rgeomex** is a package to provides spatial dataset (areal data)
available and published homepage of
[INE](https://pautas.ine.mx/transparencia/mapas/) and
[INEGI](https://www.inegi.org.mx/temas/mg). These spatial dataset are
useful for visualization and spatial analysis of diseases. The secondary
objective of the package is to provide spatial bases for the calculation
of dengue hotspots and their vector. the package have six spatial
datasets.

-   **`blocks_ine20_mx`** A spatial dataset containing of polygon data
    of blocks from México (INE 2020).
-   **`localities_inegi19_mx`** A spatial dataset containing of polygon
    data of localities from México (INEGI 2019).
-   **`AGEB_inegi19_mx`** A spatial dataset containing of polygon data
    of AGEBs from México (INEGI 2019).
-   **`AGEE_inegi19_mx`** A spatial dataset containing of polygon data
    of AGEE from México (INEGI 2019).
-   **`AGEM_inegi19_mx`** A spatial dataset containing of polygon data
    of AGEM from México (INEGI 2019).

## Installation

You can install the released version of geomex from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("rgeomex")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fdzul/rgeomex")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(rgeomex)
library(sf)
#> Linking to GEOS 3.8.0, GDAL 3.0.4, PROJ 6.3.1
head(rgeomex::loc_inegi19_mx)
#> Simple feature collection with 6 features and 6 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -102.3605 ymin: 21.78448 xmax: -102.1749 ymax: 22.00303
#> geographic CRS: WGS 84
#>      CVEGEO CVE_ENT CVE_MUN CVE_LOC
#> 1 010010001      01     001    0001
#> 2 010010239      01     001    0239
#> 3 010010293      01     001    0293
#> 4 010010357      01     001    0357
#> 5 010010479      01     001    0479
#> 6 010011025      01     001    1025
#>                                              NOMGEO AMBITO
#> 1                                    Aguascalientes Urbana
#> 2 General José María Morelos y Pavón (Cañada Honda) Urbana
#> 3                             Norias de Ojocaliente Urbana
#> 4                             Norias del Paso Hondo Urbana
#> 5         Villa Licenciado Jesús Terán (Calvillito) Urbana
#> 6                                           Pocitos Urbana
#>                         geometry
#> 1 MULTIPOLYGON (((-102.2628 2...
#> 2 MULTIPOLYGON (((-102.1977 2...
#> 3 MULTIPOLYGON (((-102.212 21...
#> 4 MULTIPOLYGON (((-102.2089 2...
#> 5 MULTIPOLYGON (((-102.1869 2...
#> 6 MULTIPOLYGON (((-102.3379 2...
```

## Authors

-   **Felipe Antonio Dzul Manzanilla** -**<https://github.com/fdzul>** -
    Packages developed in github:

    1.  [denhotspots](https://github.com/fdzul/denhotspots).
    2.  [boldenr](https://github.com/fdzul/boldenr).
    3.  [dendata](https://github.com/fdzul/dendata).
    4.  [deneggs](https://github.com/fdzul/deneggs).

-   **Fabián Correa Morales**

-   **Luis Hernández Herrera**

-   **Arturo Baez-Hernández**

-   **Evaristo Morales Ríos**

-   **Heron Huerta**

See also the list of
[contributors](https://github.com/fdzul/geomex/contributors) who
participated in this project.

## License

This project is licensed under the MIT License - see the
[LICENSE.md](LICENSE.md) file for details

## Inspiration

The package was inspired by the need to contribute to making decisions
in the dengue prevention and control program, specifically to identify
dengue vector hotspots and use the entomological information generated
by the program.

## Getting help

If you encounter a clear bug, please file a minimal reproducible example
on [github](https://github.com/fdzul/rgeomex/issues). For questions and
other discussion, please feel free to contact me
(<felipe.dzul.m@gmail.com>)

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of
Conduct](https://dplyr.tidyverse.org/CODE_OF_CONDUCT). By participating
in this project you agree to abide by its terms.
