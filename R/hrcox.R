hrcox <- function(coxmod) {
  require(dplyr)
  require(broom)
  
  coxmod %>% 
    broom::tidy(exponentiate = T, conf.int = T) %>% 
    mutate_if(is.numeric, formatC, digits =2, format = "f") %>% 
    mutate(hr = paste0(estimate, " (",conf.low, ",", conf.high, ")")) 
}