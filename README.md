
<!-- README.md is generated from README.Rmd. Please edit that file -->

# **geomex**

[![Build
Status](https://travis-ci.org/pages-themes/cayman.svg?branch=master)](https://travis-ci.org/pages-themes/cayman)
[![Gem
Version](https://badge.fury.io/rb/jekyll-theme-cayman.svg)](https://badge.fury.io/rb/jekyll-theme-cayman)[![Github
All
Releases](https://img.shields.io/github/downloads/fdzul/geomex/total.svg)]()

**deneggs is a package developed in the department of prevention and
control of diseases transmitted by vector of the [Secretary of Health of
Veracruz](https://www.ssaver.gob.mx/) and with colaboration of the
[CENAPRECE](https://www.gob.mx/salud/cenaprece)**

## **overview**

**geomex** is a package to provides spatial dataset (areal data)
available and published homepage of
[INE](https://pautas.ine.mx/transparencia/mapas/) and
[INEGI](https://www.inegi.org.mx/temas/mg). These spatial dataset are
useful for visualization and spatial analysis of diseases. The secondary
objective of the package is to provide spatial bases for the calculation
of dengue hotspots and their vector. the package have six spatial
datasets.

-   **`blocks_ine10_mx`** A spatial dataset containing of polygon data
    of blocks from México (INE 2010).
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
install.packages("geomex")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fdzul/geomex")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
#library(geomex)
## basic example code
1+1
#> [1] 2
```

## Authors

-   **Felipe Antonio Dzul Manzanilla** -**<https://github.com/fdzul>** -
    Packages developed in github:

    1.  [denhotspots](https://github.com/fdzul/denhotspots).
    2.  [boldenr](https://github.com/fdzul/boldenr).
    3.  [dendata](https://github.com/fdzul/dendata).
    4.  [deneggs](https://github.com/fdzul/dendata).

-   **Fabian Correa Morales**

-   **Luis Hernández Herrera**

-   **Arturo Baez-Hernández**

-   **Evaristo Morales Rios**

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
on [github](https://github.com/fdzul/geomex/issues). For questions and
other discussion, please feel free to contact me
(<felipe.dzul.m@gmail.com>)

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of
Conduct](https://dplyr.tidyverse.org/CODE_OF_CONDUCT). By participating
in this project you agree to abide by its terms.