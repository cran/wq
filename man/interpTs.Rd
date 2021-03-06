\name{interpTs}
\Rdversion{1.1}
\alias{interpTs}

\title{
Interpolate or substitute missing time series values
}

\description{
Imterpolates or substitutes missing data in a time series for gaps up to a specified size.
}

\usage{
interpTs(x, type = c("linear", "series.median", "series.mean", "cycle.median",
  "cycle.mean"), gap = NULL)
}

\arguments{
  \item{x}{
object of class \code{"ts"} or \code{"mts"}
}
  \item{type}{
method of interpolation or substitution
}
  \item{gap}{
maximum gap to be replaced
}
}

\details{
When \code{type = "linear"}, the function performs linear interpolation of any \code{NA} runs of length smaller than or equal to \code{gap}. When \code{gap = NULL}, gaps of any size will be replaced. Does not change leading or trailing \code{NA} runs. This interpolation approach is best for periods of low biological activity when sampling is routinely suspended. 

When \code{type = "series.median"} or \code{"series.mean"}, missing values are replaced by the overall median or mean, respectively. This may be desirable when missing values are not allowed but one wants, for example, to avoid spurious enhancement of trends. 

When \code{type = "cycle.median"} or \code{type = "cycle.mean"}, missing values are replaced by the median or mean, respectively, for the same cycle position (i.e., same month, quarter, etc., depending on the frequency). This may give more realistic series than using the overall mean or median.

Intended for time series but first three types will work with any vector or matrix. Matrices will be interpolated by column.
}
\value{
The time series with some or all missing values replaced.
}

\seealso{
\code{\link{decompTs}}
}

\examples{
### Interpolate a vector time series and highlight the imputed data
chl27 <- sfbayChla[, 's27']
x1 <- interpTs(chl27, gap = 3)
plot(x1, col = 'red')
lines(chl27, col = 'blue')
x2 <- interpTs(chl27, type = "series.median", gap = 3)
plot(x2, col = 'red')
lines(chl27, col = 'blue')

### Interpolate a matrix time series and plot results
x3 <- interpTs(sfbayChla, type = "cycle.mean", gap = 1)
plot(x3[, 1:10], main = "SF Bay Chl-a\n(gaps of 1 month replaced)")
}

\keyword{utilities}
\keyword{manip}