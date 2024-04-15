## code to prepare `DATASET` dataset goes here

comms <- tidyquant::tq_get(c("HG=F", "SI=F", "GC=F", "PL=F"), get = "stock.prices", from = "2000-01-01") %>%
  dplyr::mutate(cmdty = dplyr::case_when(symbol == "HG=F" ~ "Copper",
                                         symbol == "SI=F" ~ "Silver",
                                         symbol == "GC=F" ~ "Gold",
                                         symbol == "PL=F" ~ "Platinum"),
                value = adjusted) %>%
  dplyr::select(date, cmdty, value)
usethis::use_data(comms, overwrite = TRUE)

stocks <- tidyquant::tq_get(c("BHP", "PAAS", "GOLD", "SPSW"), get = "stock.prices", from = "2000-01-01") %>%
  dplyr::mutate(cmdty = dplyr::case_when(symbol == "BHP" ~ "Copper",
                                         symbol == "PAAS" ~ "Silver",
                                         symbol == "GOLD" ~ "Gold",
                                         symbol == "SBSW" ~ "Platinum"),
                value = adjusted) %>%
  dplyr::select(date, cmdty, value)
usethis::use_data(stocks, overwrite = TRUE)
