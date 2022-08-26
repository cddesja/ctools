# This file is a generated template, your changes will not be overwritten

ztestClass <- if (requireNamespace('jmvcore', quietly=TRUE)) R6::R6Class(
    "ztestClass",
    inherit = ztestBase,
    private = list(
        .run = function() {
          restab <- self$results$get("restab")
          conftab <- self$results$get("conftab")
          
          ## the standard results table
          se <- sqrt((self$options$p0 * (1 - self$options$p0) / self$options$n))
          z <- (self$options$phat - self$options$p0) / se
          ha <- self$options$ha
          if (ha == "lessthan")
            p <- pnorm(z, lower.tail = TRUE)
          if (ha == "greaterthan")
            p <- pnorm(z, lower.tail = FALSE)
          if (ha == "notequal")
            p <- pnorm(abs(z), lower.tail = FALSE) * 2
          
          if(!(0 %in% c(self$options$phat, self$options$p0, self$options$n))){
            restab$setRow(rowNo=1, values=list(
              phat = self$options$phat, 
              z=z,
              se=se,
              p=p))
            if(self$options$showci){
              se_ci <- sqrt((self$options$phat * (1 - self$options$phat) / self$options$n))
              lvl <- (100 - ((100 - self$options$cilevel) / 2)) / 100
              lwr <-  self$options$phat - qnorm(lvl) * se_ci
              uppr <- self$options$phat + qnorm(lvl) * se_ci
              conftab$setRow(rowNo=1, values=list(
                lvl = paste0(self$options$cilevel, "%"),
                lwr = lwr,
                uppr = uppr))
            }
          }

          
        })
)
