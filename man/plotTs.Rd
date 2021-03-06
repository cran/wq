\name{plotTs}
\alias{plotTs}

\title{
Time series plot
}
\description{
Creates line plot of vector or matrix time series, including any data surrounded by NAs as additional points.
}
\usage{
plotTs(x, dot.size = 1, xlab = NULL, ylab = NULL,
       strip.labels = colnames(x), ...)
}
\arguments{
  \item{x}{
matrix or vector time series
}
  \item{dot.size}{
size of dots representing isolated data points
}
  \item{xlab}{
optional x-axis label
}
  \item{ylab}{
optional y-axis label
}
  \item{strip.labels}{
labels for individual time series plots
}
  \item{...}{
additional options
}
}

\details{
The basic time series line plot ignores data points that are adjacent to missing data, i.e., not directly connected to other observations. This can lead to an uninformative plot when there are many missing data. If one includes both a point and line plot, the resulting graph can be cluttered and difficult to decipher. \code{plotTs} plots only isolated points as well as lines joining adjacent observations.

Options are passed to the underlying \code{facet_wrap} function in \pkg{ggplot2}. The main ones of interest are \code{ncol} for setting the number of plotting columns and \code{scales = "free_y"} for allowing the y scales of the different plots to be independent.
}

\value{
A plot or plots and corresponding object of class \dQuote{ggplot}.
}

\seealso{
\code{\link{plotTsAnom}}
}

\examples{
# Chlorophyll at 4 stations in SF Bay
chl <- sfbayChla[, 1:4]
plotTs(chl, dot.size = 1.5, ylab = 'Chl-a', strip.labels = paste('Station',
  substring(colnames(chl), 2, 3)), ncol = 1, scales = "free_y")
}

\keyword{Graphics}
\keyword{ts}
