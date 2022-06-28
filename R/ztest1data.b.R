
# This file is a generated template, your changes will not be overwritten

ztest1dataClass <- if (requireNamespace('jmvcore', quietly=TRUE)) R6::R6Class(
    "ztest1dataClass",
    inherit = ztest1dataBase,
    private = list(
        .run = function() {
            tmp <- subset(self$data, select = self$options$var, drop = TRUE)
            tmp.tab <- table(tmp)
            phat <- tmp.tab[2]/sum(tmp.tab)
            se <- sqrt((phat * (1 - self$options$p0) / length(na.omit(tmp))))
            z <- (phat - self$options$p0) / se
            ha <- self$options$ha
            if (ha == "lessthan") {
                  p <- pnorm(z, lower.tail = TRUE)
              }
            if (ha == "greaterthan") {
                  p <- pnorm(z, lower.tail = FALSE)
              }
            if (ha == "notequal") {
                  p <- pnorm(abs(z), lower.tail = FALSE) * 2
            }
            res <- paste0("The sample proportion of ", unique(tmp)[2], " is: ", round(phat, 4),
                "\nThe z-statistic is: ", round(z, 4),
                "\nThe SE is: ", round(se, 4),
                "\nThe p-value is: ", round(p, 4), "\n")
            
            self$results$text$setContent(res)
            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)

        })
)
