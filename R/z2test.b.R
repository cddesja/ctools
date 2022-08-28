# This file is a generated template, your changes will not be overwritten

z2testClass <- if (requireNamespace('jmvcore', quietly=TRUE)) R6::R6Class(
    "z2testClass",
    inherit = z2testBase,
    private = list(
      .run = function() {
        z2restab <- self$results$get("z2restab")
        z2conftab <- self$results$get("z2conftab")
        
        ## the standard results table
        phat1 <- self$options$c1 / self$options$n1
        phat2 <- self$options$c2 / self$options$n2
        pooled_p <- (self$options$c1 + self$options$c2) / (self$options$n1 + self$options$n2)
        se <- sqrt(pooled_p * (1 - pooled_p) / self$options$n1 + pooled_p * (1 - pooled_p) / self$options$n2)
        z <- (phat1 - phat2) / se
        ha <- self$options$ha
        
        if (ha == "lessthan")
          p <- pnorm(z, lower.tail = TRUE)
        if (ha == "greaterthan")
          p <- pnorm(z, lower.tail = FALSE)
        if (ha == "notequal")
          p <- pnorm(abs(z), lower.tail = FALSE) * 2
        
        if(!(0 %in% c(self$options$c1, self$options$c2, self$options$n1, self$options$n2))){
          z2restab$setRow(rowNo=1, values=list(
            diff_phat = phat1 - phat2, 
            z=z,
            se=se,
            p=p))
          if(self$options$showci){
            se_ci <- sqrt((phat1 * (1 - phat1) / self$options$n1) + (phat2 * (1 - phat2) / self$options$n2))
            lvl <- (100 - ((100 - self$options$cilevel) / 2)) / 100
            lwr <-  (phat1 - phat2) - qnorm(lvl) * se_ci
            uppr <- (phat1 - phat2) + qnorm(lvl) * se_ci
            z2conftab$setRow(rowNo=1, values=list(
              lvl = paste0(self$options$cilevel, "%"),
              lwr = lwr,
              uppr = uppr))
          }
        }
        
        
      })
)
