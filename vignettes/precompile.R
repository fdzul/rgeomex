# The vignettes download data, so they are knitted beforehand (not when the
# package is built). Run from the root of the package after a change:
#   source("vignettes/precompile.R")
# To only clean the figures of the knitted .Rmd, without knitting again:
#   CLEAN_ONLY=1 Rscript vignettes/precompile.R

# knitr writes each figure as <div class="figure"> with the caption
# "plot of chunk <label>"; keep only the image, with a short alt text.
clean_figures <- function(f) {
  x <- paste(readLines(f, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
  x <- gsub(paste0('<div class="figure">\\s*(<img [^>]*?)alt="plot of chunk ([^"]+)"',
                   '([^>]*/>)\\s*<p class="caption">[^<]*</p>\\s*</div>'),
            '\\1alt="\\2"\\3', x, perl = TRUE)
  writeLines(x, f, useBytes = TRUE)
}

old <- setwd("vignettes")
for (f in list.files(pattern = "\\.Rmd\\.orig$")) {
  out <- sub("\\.orig$", "", f)
  if (!identical(Sys.getenv("CLEAN_ONLY"), "1")) knitr::knit(f, out)
  clean_figures(out)
}
setwd(old)
