# get a neat coxregression summary
cox_summary <-
  function(model){
    require(tibble)
    require(dplyr)
    HRs <-
      model %>%
      summary %>%
      coef %>%
      as.data.frame %>%
      tibble::rownames_to_column() %>%
      bind_cols(model %>% confint() %>% exp() %>%  as_data_frame()) %>%
      select(rowname, `exp(coef)`, `2.5 %`, `97.5 %`) %>%
      rename(Variable = rowname,
             HR = `exp(coef)`,
             CI_low = `2.5 %`,
             CI_high = `97.5 %`)
    number <-
      tibble(n = model$n,
             nevent = model$nevent)

    return(HRs)
  }
