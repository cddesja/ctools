
# This file is automatically generated, you probably don't want to edit this

ztestOptions <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "ztestOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            phat = NULL,
            p0 = NULL,
            n = NULL,
            ha = "notequal", ...) {

            super$initialize(
                package="ctools",
                name="ztest",
                requiresData=FALSE,
                ...)

            private$..phat <- jmvcore::OptionNumber$new(
                "phat",
                phat)
            private$..p0 <- jmvcore::OptionNumber$new(
                "p0",
                p0)
            private$..n <- jmvcore::OptionInteger$new(
                "n",
                n)
            private$..ha <- jmvcore::OptionList$new(
                "ha",
                ha,
                options=list(
                    "notequal",
                    "lessthan",
                    "greaterthan"),
                default="notequal")

            self$.addOption(private$..phat)
            self$.addOption(private$..p0)
            self$.addOption(private$..n)
            self$.addOption(private$..ha)
        }),
    active = list(
        phat = function() private$..phat$value,
        p0 = function() private$..p0$value,
        n = function() private$..n$value,
        ha = function() private$..ha$value),
    private = list(
        ..phat = NA,
        ..p0 = NA,
        ..n = NA,
        ..ha = NA)
)

ztestResults <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "ztestResults",
    inherit = jmvcore::Group,
    active = list(
        ztest = function() private$.items[["ztest"]]),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="One-Sample Z-Test")
            self$add(jmvcore::Table$new(
                options=options,
                name="ztest",
                title="One-Sample Z-Test",
                rows=1,
                columns=list(
                    list(
                        `name`="phat", 
                        `type`="number", 
                        `title`="Sample Proportion"),
                    list(
                        `name`="z", 
                        `type`="number"),
                    list(
                        `name`="se", 
                        `type`="number"),
                    list(
                        `name`="p", 
                        `type`="number", 
                        `title`="p-value", 
                        `format`="zto,pvalue")),
                clearWith=list(
                    "phat",
                    "p0",
                    "n",
                    "ha")))}))

ztestBase <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "ztestBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = "ctools",
                name = "ztest",
                version = c(1,0,0),
                options = options,
                results = ztestResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE,
                requiresMissings = FALSE)
        }))

#' One-Sample Z-Test
#'
#' 
#' @param phat .
#' @param p0 .
#' @param n .
#' @param ha .
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$ztest} \tab \tab \tab \tab \tab a table \cr
#' }
#'
#' Tables can be converted to data frames with \code{asDF} or \code{\link{as.data.frame}}. For example:
#'
#' \code{results$ztest$asDF}
#'
#' \code{as.data.frame(results$ztest)}
#'
#' @export
ztest <- function(
    phat,
    p0,
    n,
    ha = "notequal") {

    if ( ! requireNamespace("jmvcore", quietly=TRUE))
        stop("ztest requires jmvcore to be installed (restart may be required)")


    options <- ztestOptions$new(
        phat = phat,
        p0 = p0,
        n = n,
        ha = ha)

    analysis <- ztestClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}

