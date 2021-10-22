# data frame to docx
dftodocx <- function(dataframe) {
  require(dplyr)
  require(pander)
  dataframe %>% 
  pander::pandoc.table.return() %>%
  pander::Pandoc.convert(text = ., format= "docx", footer = F)
}