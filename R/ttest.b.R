
# This file is a generated template, your changes will not be overwritten

ttestClass <- if (requireNamespace('jmvcore', quietly=TRUE)) R6::R6Class(
    "ttestClass",
    inherit = ttestBase,
    private = list(
        .run = function() {
          restab <- self$results$get("restab")
          conftab <- self$results$get("conftab")
          
          ## the standard results table
          se <- self$options$s / sqrt(self$options$n)
          tstat <- (self$options$xbar - self$options$mu0) / se
          ha <- self$options$ha
          if (ha == "lessthan")
            p <- pt(tstat, df = self$options$n - 1, lower.tail = TRUE)
          if (ha == "greaterthan")
            p <- pt(tstat, df = self$options$n - 1, lower.tail = FALSE)
          if (ha == "notequal")
            p <- pt(abs(tstat), df = self$options$n - 1, lower.tail = FALSE) * 2
          
          if(!(0 %in% c(self$options$xbar, self$options$s, self$options$n))){
            restab$setRow(rowNo=1, values=list(
              xbar = self$options$xbar, 
              tstat=tstat,
              se=se,
              p=p))
            if(self$options$showci){
              lvl <- (100 - ((100 - self$options$cilevel) / 2)) / 100
              lwr <-  self$options$xbar - qt(lvl, df = self$options$n - 1) * se
              uppr <- self$options$xbar + qt(lvl, df = self$options$n - 1) * se
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
