\name{calcHbExUnsteady}
\alias{calcHbExUnsteady}
\title{
Calculates Human Body Exergy Consumption Rate using Unsteady State Method
}
\description{
\code{calcHbExUnsteady} calculates the human body exergy consumPtion rate using unsteady state method based on a series of environmental variables.
}
\usage{
calcHbExUnsteady(ta, tr, rh, vel, clo, met, tao, rho, frad = 0.7, eps = 0.95, 
ic = 1.085, ht = 171, wt = 70, tcr = 37, tsk = 36, basMet = 58.2, warmUp = 60, 
cdil = 100, sigmatr = 0.25, dateTime)
}
\arguments{
  \item{ta}{
a numeric vector presenting air temperature in [degree C] 
}
  \item{tr}{
a numeric vector presenting mean radiant temperature in [degree C] 
}
  \item{vel}{
a numeric vector presenting air velocity in [m/s] 
}
  \item{rh}{
a numeric vector presenting relative humidity [\%]
}
  \item{clo}{
a numeric vector presenting clothing insulation level in [clo] 
}
  \item{met}{
a numeric vector presenting metabolic rate in [met] 
}
  \item{tao}{
a numeric vector presenting outdoor air temperature in [degree C] 
}
  \item{rho}{
a numeric vector presenting outdoor relative humidity [\%]
}
  \item{frad}{
a numeric vector presenting the fraction of body exposed to radiation 0.7(for seating), 0.73(for standing) [-]
}
  \item{eps}{
a numeric vector presenting emissivity [-]
}
  \item{ic}{
a numeric vector presenting permeability of clothing: 1.084 (average permeability), 0.4 (low permeability) 
}
  \item{ht}{
a numeric vector presenting body height in [cm] 
}
  \item{wt}{
a numeric vector presenting body weight in [kg] 
}
  \item{tcr}{
a numeric vector presenting initial value for core temperature in [degree C] 
}
  \item{tsk}{
a numeric vector presenting initial value for skin temperature in [degree C] 
}
  \item{basMet}{
a numeric vector presenting basal metabolic rate in [met]
}
  \item{warmUp}{
a numeric vector presenting length of warm up period, i.e. number of times, loop is running for HBx calculation
}
  \item{cdil}{
a numeric vector presenting value for cdil in 2-node model of Gagge
}
  \item{sigmatr}{
a numeric vector presenting value for cdil in 2-node model of Gagge
}
  \item{dateTime}{
a POsIxct vector of the times of measurement
}
}
\details{
This function requires vectors of data including the corresponding time stamp. In case the time between two measurements is more than a minute, intermediate values are interpolated.
}
\value{
Returns a data.frame with the following columns

Exergy input
  \item{xInmetu }{Exergy input through metabolism}
  \item{xInmetwcu }{Label warm/ cold for exergy input through metabolism}
  \item{xInAIRwcu }{Exergy input through inhaled humid air}
  \item{xInAIRwcwcu }{Label warm/ cold for exergy input through inhaled humid air}
  \item{xInAIRwdu }{Exergy input through inhaled dry air}
  \item{xInAIRwdwdu }{Label wet/ dry for exergy input through inhaled dry air}
  \item{xInLUNGwcu }{Exergy input through water lung}
  \item{xInLUNGwcwcu }{Label warm/ cold for exergy input through water lung}
  \item{xInLUNGwdu }{Exergy input through water lung}
  \item{xInLUNGwdwdu }{Label wet/ dry for exergy input through water lung}
  \item{xInsheLLwcu }{Exergy input through water from sweat}
  \item{xInsheLLwcwcu }{Label warm/ cold for exergy input through water from sweat}
  \item{xInsheLLwdu }{Exergy input through water from sweat}
  \item{xInsheLLwdwdu }{Label wet/ dry for exergy input through water from sweat}
  \item{xInraDu }{Exergy input through radiation}
  \item{xInraDwcu }{Label warm/ cold for exergy input through radiation}
  \item{xIntotaLu }{total exergy input}
		
Exergy output
  \item{xoutstorecoreu }{Exergy stored in core}
  \item{xoutstoreshelu }{Exergy stored in shell}
  \item{xoutaIRwcu }{Exergy output through exhaled humid air}
  \item{xoutaIRwcwcu }{Label warm/ cold for exergy output through exhaled humid air}
  \item{xoutaIRwdu }{Exergy output through exhaled dry air}
  \item{xoutaIRwdwdu }{Label wet/ dry for exergy output through exhaled dry air}
  \item{xoutswEATwcu }{Exergy output through water vapour from sweat}
  \item{xoutswEATwcwcu }{Label warm/ cold for exergy output through water vapour from sweat}
  \item{xoutswEATwdu }{Exergy output through water vapour from sweat}
  \item{xoutswEATwdwdu }{Label wet/ dry for exergy output through water vapour from sweat}
  \item{xoutraDu }{Exergy output through radiation}
  \item{xoutraDwcu }{Label warm/ cold for exergy output through radiation}
  \item{xoutCONVu }{Exergy output through convection}
  \item{xoutCONVwcu }{Label warm/ cold for exergy output through convection}
  \item{xouttotaLu }{total exergy output}

Exergy balance
  \item{xconsu }{total exergy consumPtion}

Additional values
  \item{tsku }{Calculated skin temperature}
  \item{tcru }{Calculated core temperature}
  \item{wu }{Calculated skin wettedness}
}
\references{
Schweiker, M., Kolarik, J., Dovjak, M. and Shukuya, M. Unsteady-state human-body exergy consumption rate and its relation to subjective assessment of dynamic thermal environments, Energy and Buildings , 2016, 116, 164 - 180

Shukuya, M. Calculation of human body-core and skin-layer temperatures under unsteady-state conditions-for unsteady-state human-body exergy analysis-, internal report of exergy-research group, Tech. rep., KIT/TCU, 2015.
}
\author{
This function is based on a VBA code developed by masanori Shukuya. transformation of VBA-code and Excel procedures into R syntax by Marcel Schweiker.
}
\note{
According to Gagge's paper (1973), the value of 'cdil' may vary between 75 and 225 and 'sigma-tr' between 0.25 and 0.75. There is a note in the appendix of his paper saying two things:  1) whatever the values taken for cdil and sigma-tr, there must be no significant change in resulting thermal equilibrium. But, the values taken for cdil and sigmaTr do affect time to equilibrium. According to the analysis of schweiker et al. (2015), the values of 100 and .25 lead to the best fit of calculated and observed skin temperature. 
}

%% ~make other sections like warning with \section{warning }{....} ~

\seealso{
see also \code{\link{calcComfInd}}, \code{\link{calcHbExSteady}}
}
\examples{
## Define environmental parameters
ta <- seq(20,25,.1)
tr <- ta
rh <- rep(50, length(ta))
vel <- rep(.1, length(ta))
clo <- rep(.8, length(ta))
met <- rep(1.2, length(ta))
tao <- rep(5, length(ta))
rho <- rep(80, length(ta))
dateTime <- as.POSIXct(seq(0,by=60,length.out=length(ta)), origin="1970-01-01")

## Calculation of human body exergy consumPtion rate
calcHbExUnsteady(ta, tr, rh, vel, clo, met, tao, rho, dateTime = dateTime)$xconsu
}
\keyword{ manip }
