
<!-- README.md is generated from README.Rmd. Please edit that file -->

# **rgeomex**

[![Build
Status](https://travis-ci.com/fdzul/rgeomex.svg?branch=main)](https://travis-ci.com/fdzul/rgeomex)
[![HitCount](https://hits.dwyl.com/fdzul/fdzul/rgeomex.svg?style=flat-square)](http://hits.dwyl.com/fdzul/fdzul/rgeomex)
![GitHub all
releases](https://img.shields.io/github/downloads/fdzul/rgeomex/total)
[![Codecov test
coverage](https://codecov.io/gh/fdzul/rgeomex/branch/master/graph/badge.svg)](https://codecov.io/gh/fdzul/rgeomex?branch=master)

<img align="center" src="https://github.com/fdzul/rgeomex/blob/main/rgeomex_logo.png?raw=true" alt="logo" width="140">

**rgeomex** is a package developed in the
[CENAPRECE](https://www.gob.mx/salud/cenaprece) dengue prevention and
control program in collaboration with
[INDRE](https://www.gob.mx/salud/acciones-y-programas/instituto-de-diagnostico-y-referencia-epidemiologicos-mision-vision-y-politica-de-calidad-181639?state=published),
and the states of Veracruz and Yucatan.

## **overview**

**rgeomex**. Geographic data and geographical datasets from the
[INEGI](https://www.inegi.org.mx/temas/mg) and
[INE](https://pautas.ine.mx/transparencia/mapas/) are available in the R
package **rgeomex**. Geographical data at various resolutions (states,
municipalities, localities, agebs, blocks, sectors, and neighborhoods)
constitute the majority of the package’s content.

**rgeomex** constitutes a transversal package of the **ETVerse** and
**IVAverse** initiatives. **rgeomex**, together with denepikit,
denhotspots, deneggs, and dencontrol packages, constitute a universe of
packages that make up the dengueverse of the dengue prevention and
control program in Mexico.

The package has six spatial datasets.

- **`AGEB_inegi_2019_mx`** spatial dataset containing polygon data of
  AGEBs (Area Geostadística Basica) from Mexico (INEGI 2019). The urban
  AGEBs are split in two files.

<img src="man/figures/README-agebs-1.png" width="100%" />

- **`blocks_ine20_mx`** spatial dataset containing polygon data of
  blocks from Mexico (INE 2020). The blocks of the urban cities are
  split in five files from a to e.

<img src="man/figures/README-blocks-1.png" width="100%" />

- **`sectores_ine20_mx`** spatial dataset containing polygon data
  sectores INE from Mexico.

<img src="man/figures/README-sectores-1.png" width="100%" />

- **`loc_inegi19_mx`** spatial dataset containing polygon data of
  localities from Mexico (INEGI 2019).

- **`AGEE_inegi19_mx`** spatial dataset containing polygon data of AGEE
  (Area Geostadística Estatal) from Mexico (INEGI 2019).

- **`AGEM_inegi19_mx`** spatial dataset containing polygon data of AGEM
  (Area Geostadística Municipal) from Mexico (INEGI 2019).

This package is currently available only in R, and we hope that it will
soon become available in Python.

## Installation R

You can install the released version of rgeomex from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("rgeomex")
```

And the development version from [GitHub](https://github.com/) with:

``` r
devtools::install_github("fdzul/rgeomex")
```

or

``` r
pak::pkg_install("fdzul/rgeomex")
```

## Authors

- **Felipe Antonio Dzul Manzanilla** -**<https://github.com/fdzul>** -
  Packages developed in github:

  1)  [denhotspots](https://github.com/fdzul/denhotspots).
  2)  [boldenr](https://github.com/fdzul/boldenr).
  3)  [dendata](https://github.com/fdzul/dendata).
  4)  [deneggs](https://github.com/fdzul/deneggs).

- **Fabián Correa Morales**

- **Luis Hernández Herrera**

- **Arturo Baez-Hernández**

- **Evaristo Morales Ríos**

- **Heron Huerta**

- **Dorothy Dzul**

See also the list of
[contributors](https://github.com/fdzul/geomex/contributors) who
participated in this project.

## Credits

Original shapefiles are created by official government institutions
(INEGI & INE).

## License

This project is licensed under the MIT License - see the
[LICENSE.md](LICENSE.md) file for details

## Inspiration

The package was inspired by the need to contribute toward making
decisions in the dengue prevention and control program, specifically
through the identification of dengue vector hotspots and use the
entomological information generated by the program.

## Getting help

If you encounter a clear bug, please file a minimal reproducible example
on [github](https://github.com/fdzul/rgeomex/issues). For questions and
other discussion, feel free to contact me (<felipe.dzul.m@gmail.com>)

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of
Conduct](https://dplyr.tidyverse.org/CODE_OF_CONDUCT). By participating
in this project you agree to abide by its terms.
