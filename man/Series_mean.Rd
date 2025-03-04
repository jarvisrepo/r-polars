% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/series__series.R
\name{Series_mean}
\alias{Series_mean}
\title{Mean}
\usage{
Series_mean()
}
\value{
R scalar value
}
\description{
Reduce Series with mean
}
\details{
Dtypes in {Int8, UInt8, Int16, UInt16} are cast to
Int64 before meanming to prevent overflow issues.
}
\examples{
pl$Series(c(1:2,NA,3,5))$mean() # a NA is dropped always
pl$Series(c(1:2,NA,3,NaN,4,Inf))$mean() # NaN carries / poisons
pl$Series(c(1:2,3,Inf,4,-Inf,5))$mean() # Inf-Inf is NaN
}
\keyword{Series}
