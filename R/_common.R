# source: https://github.com/aml4td/website/blob/main/R/_common.R
# Misc options for chunks and printing

# set_options <- function() {
#   options(digits = 4, width = 84)
#   options(dplyr.print_min = 6, dplyr.print_max = 6)
#   options(cli.width = 85)
#   options(crayon.enabled = FALSE)
#   options(pillar.advice = FALSE, pillar.min_title_chars = Inf)
#   invisible(NULL)
# }

# source: https://github.com/hadley/r4ds/blob/main/_common.R
set.seed(1014)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  # cache = TRUE,
  fig.retina = 2,
  fig.width = 6,
  fig.asp = 2 / 3,
  fig.show = "hold"
)

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  stringr.view_n = 6,
  # Temporarily deactivate cli output for quarto
  cli.num_colors = 0,
  cli.hyperlink = FALSE,
  pillar.bold = TRUE,
  width = 77 # 80 - 3 for #> comment
)

# ggplot2::theme_set(ggplot2::theme_minimal())
# ggplot2::theme_set(hmsidwR::theme_hmsid())

# use results: "asis" when setting a status for a chapter
status <- function(type) {
  status <- switch(type,
    polishing = "should be readable but is currently undergoing final polishing",
    restructuring = "is undergoing heavy restructuring and may be confusing or incomplete",
    drafting = "is currently a dumping ground for ideas, and we don't recommend reading it",
    complete = "is largely complete and just needs final proof reading",
    stop("Invalid `type`", call. = FALSE)
  )

  class <- switch(type,
    polishing = "note",
    restructuring = "important",
    drafting = "important",
    complete = "note"
  )

  cat(paste0(
    "\n",
    ":::: status\n",
    "::: callout-", class, " \n",
    "You are reading the work-in-progress.",
    "This chapter ", status, ". ",
    "",
    ":::\n",
    "::::\n"
  ))
}
