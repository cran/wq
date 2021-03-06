\name{seasonTrend}
\alias{seasonTrend}
\title{
Determine seasonal trends
}
\description{
Finds the trend for each season and each variable in a time series.
}
\usage{
seasonTrend(x, plot = FALSE, type = c("slope", "relative"), pval = .05, ...) 
}
\arguments{
\item{x}{
Time series vector, or time series matrix with column names
}
\item{plot}{
Should the results be plotted?
}
\item{type}{
Type of trend to be plotted, actual or relative to series median
}
\item{pval}{
p-value for significance
}
\item{...}{
Further options to pass to plotting function
}
}

\details{
The Mann-Kendall test is applied for each season and series (in the case of a matrix). The actual and relative Sen slope (actual divided by median for that specific season and series); the p-value for the trend; and the fraction of missing slopes involving the first and last fifths of the data are calculated (see \code{\link{mannKen}}).

If \code{plot = TRUE}, each season for each series is represented by a bar showing the trend. The fill colour indicates whether \eqn{p < 0.05} or not. If the fraction of missing slopes is 0.5 or more, the corresponding trends are omitted.

Parameters can be passed to the plotting function, in particular, to \code{facet_wrap} in \pkg{ggplot2}. The most useful parameters here are \code{ncol} (or \code{nrow}), which determines the number of columns (or rows) of plots, and \code{scales}, which can be set to \code{"free_y"} to allow the y-axis to change for each time series. Like all \pkg{ggplot2} objects, the plot output can also be customized extensively by modifying and adding layers.
}

\value{
A data frame with the following fields:
\item{series}{series names}
\item{season}{season number}
\item{sen.slope}{Sen slope in original units per year}
\item{sen.slope.rel}{Sen slope divided by median for that specific season and series}
\item{p}{p-value for the trend according to the Mann-Kendall test.}
\item{missing}{Proportion of slopes joining first and last fifths of the data that are missing}
}

\seealso{
\code{\link{mannKen}}, \code{\link{plotSeason}}, \code{\link[ggplot2]{facet_wrap}}
}

\examples{
x <- sfbayChla
seasonTrend(x)
seasonTrend(x, plot = TRUE, ncol = 4)
}

\keyword{Graphics}
\keyword{ts}
