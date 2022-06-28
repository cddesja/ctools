
# This file is a generated template, your changes will not be overwritten

ztestClass <- if (requireNamespace('jmvcore', quietly=TRUE)) R6::R6Class(
    "ztestClass",
    inherit = ztestBase,
    private = list(
        .run = function() {
                se <- sqrt((self$options$p0 * (1 - self$options$p0) / self$options$n))
                z <- (self$options$phat - self$options$p0) / se
                ha <- self$options$ha
                if (ha == "lessthan")
                    p <- pnorm(z, lower.tail = TRUE)
                if (ha == "greaterthan")
                    p <- pnorm(z, lower.tail = FALSE)
                if (ha == "notequal")
                    p <- pnorm(abs(z), lower.tail = FALSE) * 2
                res <- paste0("The z-statistic is: ", round(z, 4),
                              "\nThe SE is: ", round(se, 4),
                              "\nThe p-value is: ", round(p, 4), "\n")
                self$results$text$setContent(res)
            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)

        })
)
