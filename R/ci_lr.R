# function to get OR and IRR
ci_lr <- function(GLM.RESULT, digits = 4) {
  
  if (GLM.RESULT$family$family == "binomial") {
    LABEL <- "OR"
  } else if (GLM.RESULT$family$family == "poisson") {
    LABEL <- "RR"
  } else if (GLM.RESULT$family$family == "quasibinomial")
    LABEL <- "OR"
  
  COEF      <- stats::coef(GLM.RESULT)
  CONFINT   <- stats::confint.default(GLM.RESULT)
  TABLE     <- cbind(coef=COEF, CONFINT)
  TABLE.EXP <- round(exp(TABLE), digits)
  
  colnames(TABLE.EXP)[1] <- LABEL
  
  TABLE.EXP
}
