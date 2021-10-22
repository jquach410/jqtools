getfreq <-
  function(data, variable) {
    require(dplyr)
    var <- enquo(variable)
    label <- deparse(substitute(variable))
    x <-
      data %>%
      group_by(!!var) %>%
      summarise(frequency = n()) %>%
      mutate(item = label) %>% 
      rename(response = 1)
    return(x)
  }
