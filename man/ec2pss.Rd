\name{ec2pss}
\Rdversion{1.1}
\alias{ec2pss}
\alias{R2pss}

\title{
Convert conductivity to salinity
}

\description{
Electrical conductivity data are converted to salinity using the Practical Salinity Scale and an extension for salinities below 2.
}

\usage{
ec2pss(ec, t, p = 0)
R2pss(R, t, p = 0)
}

\arguments{
  \item{ec}{
conductivity, mS/cm
}
  \item{t}{
temperature, Celsius
}
  \item{p}{
gauge pressure, decibar
}
  \item{R}{
conductivity ratio, dimensionless
}
}

\details{
\code{ec2pss} converts electrical conductivity data to salinity using the Practical Salinity Scale 1978 in the range of 2-42 (Fofonoff and Millard 1983). Salinities below 2 are calculated using the extension of the Practical Salinity Scale (Hill et al. 1986).

\code{R2pss} is the same function, except that conductivity ratios rather than conductivities are used as input.
}

\value{
\code{ec2pss} and \code{R2pss} both return salinity values on the Practical Salinity Scale.
}

\references{
Fofonoff N.P. and Millard Jr R.C. (1983) \emph{Algorithms for Computation of Fundamental Properties of Seawater.} UNESCO Technical Papers in Marine Science 44. UNESCO, Paris, 53 p.

Hill K.D., Dauphinee T.M. and Woods D.J. (1986) The extension of the Practical Salinity Scale 1978 to low salinities. \emph{IEEE Journal of Oceanic Engineering} \bold{11,} 109-112.
}

\note{
Input pressures are not absolute pressures but rather gauge pressures. Gauge pressures are measured relative to 1 standard atmosphere, so the gauge pressure at the surface is 0.
}

\examples{
# Check values from Fofonoff and Millard (1983):
R = c(1, 1.2, 0.65) 
t = c(15, 20, 5)
p = c(0, 2000, 1500)
R2pss(R, t, p)  # 35.000 37.246 27.995
# Repeat calculation with equivalent conductivity values by setting 
# ec <- R * C(35, 15, 0):
ec = c(1, 1.2, 0.65) * 42.9140
ec2pss(ec, t, p)  # same results
}

\keyword{manip}
\keyword{utilities}
