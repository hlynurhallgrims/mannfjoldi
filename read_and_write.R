library(pxweb)
library(tidyverse)

na_i_mannfjolda <- function() {
  
  px_gogn <- pxweb_get(
    url = "http://px.hagstofa.is/pxis/api/v1/is/Ibuar/mannfjoldi/1_yfirlit/Yfirlit_mannfjolda/MAN00109.px",
    query = "json_queries/mannfjoldi_statice.json"
  )
  
  return(px_gogn$data)
  
}

mannfjoldi_raw <- na_i_mannfjolda()

mannfjoldi_raw %>% write_rds(here::here("cache", "mannfjoldi_raw.rds"))

