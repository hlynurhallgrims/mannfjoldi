library(tidyverse)
source(here::here("read_and_write.R"))

method_1 <- function() {
  mannfjoldi_raw %>%
    tibble(
      key = map(., "key"),
      values = map(., "values")
    ) %>%
    transmute(
      key1 = map_chr(.x = key, ~ pluck(.x[[1]])),
      key2 = map_chr(.x = key, ~ pluck(.x[[2]])),
      key3 = map_chr(.x = key, ~ pluck(.x[[3]])),
      values = map_chr(.x = values, ~ pluck(.x[[1]]))
    )
}

method_2 <- function() {
  mannfjoldi_raw %>% 
    map(~unlist(., recursive = FALSE)) %>% 
    bind_rows()
}

bench::mark("manual" = method_1(),
            "auto" = method_2(), iterations = 10)