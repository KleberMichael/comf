\name{calcCOEFF}
\alias{calcCOEFF}
\alias{calcapCoeff}
\alias{calcepCoeff}
\alias{calcasCoeff}
\alias{calcesCoeff}
\title{
Calculation of Coefficients for aPMV, ePMV, aPTS, ePTS
}
\description{
The functions \code{calcCOEFF} calculate the coefficients necessary for apmv, epmv, apts, and epts based on a given dataset with actual comfort votes. \code{calcapCoeff} calculates lambda the adaptive coefficient for apmv, \code{calcepCoeff} calculates e the expectancy factor for epmv, \code{calcasCoeff} calculates lambda the adaptive coefficient for apts, \code{calcesCoeff} calculates e the expectancy factor for epts.
}
\usage{
calcapCoeff(lsCond)
calcepCoeff(lsCond)
calcasCoeff(lsCond)
calcesCoeff(lsCond)
}
\arguments{
  \item{lsCond}{
a list with vectors for the necessary variables (see details)
}
}
\details{
For \code{calcapCoeff} and \code{calcepCoeff}, lsCond should contain the following variables: ta, tr, vel, rh, clo, met, wme, asv (see \code{\link{createCond}} for details). In case one or more of these variables are not included in the list, standard values will be used.
For \code{calcasCoeff} and \code{calcesCoeff}, lsCond should contain the following variables: ta, tr, vel, rh, clo, met, wme, pb, ltime, ht, wt, asv (see \code{\link{createCond}} for details). In case one or more of these variables are not included in the list, standard values will be used.
}
\value{
\code{calcCOEFF} returns the adaptive coefficient lambda or expectancy factor depending on its call.
}
\references{
Coefficients are calculated based on Gao, J.; Wang, Y. and Wargocki, P. Comparative analysis of modified PMV models and set models to predict human thermal sensation in naturally ventilated buildings Building and Environment, 2015, 92, 200-208.

The apmv concept was introduced by Yao, R.; Li, B. and Liu, J. A theoretical adaptive model of thermal comfort - Adaptive Predicted mean Vote (apmv) Building and Environment, 2009, 44, 2089-2096.

The epmv concept was introudced by Fanger, P. and Toftum, J. Extension of the PMV model to non-air-conditioned buildings in warm climates Energy and Buildings, 2002, 34, 533-536.
}
\author{
Marcel Schweiker
}

\seealso{
see also \code{\link{calcaPMV}}, \code{\link{calcePMV}}, \code{\link{calcPtsa}}, \code{\link{calcPtse}}
}
\examples{
## Note. Due to random generated asv values. The values for the coefficients will not be meaningful.
## Create sample data
ta  <- 20:24      # vector with air temperature values
tr  <- ta         # vector with radiant temperature values
vel <- rep(.1,5)  # vector with air velocities
rh  <- rep(50,5)  # vector with relative humidity values
clo <- rep(1.0,5) # vector with clo values
met <- rep(1.1,5) # vector with metabolic rates
asv <- rnorm(5)   # vector with actual sensation votes

lsCond <- as.list(data.frame(ta,tr,vel,rh,clo,met,asv))

## Calculate coefficients

calcapCoeff(lsCond)
calcepCoeff(lsCond)
calcasCoeff(lsCond)
calcesCoeff(lsCond)

## use coefficients to calculate apmv
lsCond$apCoeff[1] <- calcapCoeff(lsCond)$apCoeff
calcComfInd(lsCond, request="apmv")
}
\keyword{ manip }