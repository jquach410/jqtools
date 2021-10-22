glimpseJack <-
  function(data, x) {
    require(finalfit)
    require(dplyr)
    f <-
      data %>%
      ff_glimpse() %>%
      as.data.frame() %>%
      select(1, 3, 4, 5)
    
    colnames(f) <-
      c("Label",
        paste0("N_", x),
        paste0("Missing_", x),
        paste0("Missing_Perc_", x))
    
    return(f)
  }