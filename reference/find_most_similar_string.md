# find_most_similar_string

Returns a vector of most similar string in another vector. Returns a
vector of the same length as input vector '.s'.

## Usage

``` r
find_most_similar_string(
  .s,
  .t,
  max_dist = Inf,
  verbose = TRUE,
  ignore_case = TRUE,
  feeling_lucky = FALSE,
  ...
)
```

## Arguments

- .s:

  a character vector to be matched.

- .t:

  a character vector to be matched against.

- max_dist:

  the maximum string distance

- verbose:

  should warnings be printed in the console.

- ignore_case:

  should case be ignored? Default is TRUE.

- feeling_lucky:

  if multiple most similar strings are found. Should the first one be
  returned?

- ...:

  other arguments passed to utils::adist.

## Value

a character vector

## Details

Uses the generalized Levenshtein distance. For more information type
[`?utils::adist`](https://rdrr.io/r/utils/adist.html) in the console.
the original source is
https://github.com/davidsjoberg/similiars/blob/master/R/similiars.R

## Examples

``` r
find_most_similar_string("merida", c("Merida", "Mexicali", "Monterrey"))
#> [1] "Merida"

```
