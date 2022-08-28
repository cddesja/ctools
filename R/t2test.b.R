
# This file is a generated template, your changes will not be overwritten

t2testClass <- if (requireNamespace('jmvcore', quietly=TRUE)) R6::R6Class(
    "t2testClass",
    inherit = t2testBase,
    private = list(
      .run = function() {
        restab <- self$results$get("restab")
        conftab <- self$results$get("conftab")
        
        ## the standard results table
        diff_xbar <- self$options$xbar1 - self$options$xbar2
        se <- sqrt(self$options$s1^2 / self$options$n1 + self$options$s2^2 / self$options$n2)
        tstat <- diff_xbar / se
        ha <- self$options$ha
        if (ha == "lessthan")
          p <- pt(tstat, df = min(self$options$n1, self$options$n2) - 1, lower.tail = TRUE)
        if (ha == "greaterthan")
          p <- pt(tstat, df = min(self$options$n1, self$options$n2) - 1, lower.tail = FALSE)
        if (ha == "notequal")
          p <- pt(abs(tstat), df = min(self$options$n1, self$options$n2) - 1, lower.tail = FALSE) * 2
        
        if(!(0 %in% c(self$options$xbar1, self$options$s1, self$options$n1, self$options$xbar2, self$options$s2, self$options$n2))){
          restab$setRow(rowNo=1, values=list(
            diff_xbar = self$options$xbar1 - self$options$xbar2, 
            tstat=tstat,
            se=se,
            p=p))
          if(self$options$showci){
            lvl <- (100 - ((100 - self$options$cilevel) / 2)) / 100
            lwr <-  diff_xbar - qt(lvl, df = min(self$options$n1, self$options$n2) - 1) * se
            uppr <- diff_xbar + qt(lvl, df = min(self$options$n1, self$options$n2) - 1) * se
            conftab$setRow(rowNo=1, values=list(
              lvl = paste0(self$options$cilevel, "%"),
              lwr = lwr,
              uppr = uppr))
            
            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)
            
          }
        }
      })
)
