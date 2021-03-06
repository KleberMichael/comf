\name{calctadapt}
\alias{calctadapt}
\alias{calctAdapt15251}
\alias{calctAdaptASHRAE}
\alias{calctnAuliciems}
\alias{calctnHumphreysNV}
\alias{calctnHumphreysAC}
\alias{tadapt}
\alias{tAdapt}
\alias{tAdapt15251}
\alias{tAdaptASHRAE}
\alias{tnAuliciems}
\alias{tnHumphreysNV}
\alias{tnHumphreysAC}
\title{
Calculating Adaptive Comfort Temperatures or Neutral Temperatures
}
\description{
\code{calctadapt} are three functions to calculate adaptive comfort or neutral temperatures based on a given outdoor temperature value.
}
\usage{
calctAdapt15251(trm = 20)
calctAdaptASHRAE(tmmo)
calctnAuliciems(ta, tmmo)
calctnHumphreysNV(tmmo)
calctnHumphreysAC(tmmo)
}
\arguments{
  \item{ta}{
numerical value presenting the indoor air temperature in [degree C] 
}
  \item{trm}{
numerical value presenting the running mean outdoor temperature in [degree C] 
}
  \item{tmmo}{
numerical value presenting the mean monthly outdoor temperature in [degree C] 
}
}
\value{
returns the adaptive comfort or neutral temperature with respect to the given outdoor temperature value
}
\references{
\code{calctAdapt15251} is based on DIN EN 15251 Indoor environmental input parameters for design and assessment of energy performance of buildings addressing indoor air quality, thermal environment, lighting and acoustics; German version EN 15251:2012 2012.

\code{calcAdaptASHRAE} is based on Brager, G. S. & de Dear, R. Climate, comfort, & natural ventilation: a new adaptive comfort standard for ASHRAE standard 55 Center for the Built Environment. UC Berkeley, 2001.

\code{calctnAuliciems} is based on Auliciems, A. Psycho-physiological criteria for global thermal zones of building design Int J Biometeorol, springer, 1981, 26, 69-86.

\code{calctnHumphreysNV} and \code{calctnHumphreysAC} are based on Humphreys, M. A., Outdoor temperatures and comfort indoors. Batiment International, Building Research and Practice, Taylor and Francis, 1978, 6, 92-92.
}
\author{
Marcel Schweiker
}
\note{
The difference between \code{calctnHumphreysNV} and \code{calctnHumphreysAC} is that the former was found for natural ventilated buildings (NV), while the latter was found for climate-controlled buildings (AC).
}
\seealso{
see also \code{\link{calcComfInd}}
}
\examples{
## define variable
trm <- 21.2

## calculate adaptive comfort temperature
calctAdapt15251(trm)
}
\keyword{ manip }
