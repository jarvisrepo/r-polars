% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expr__expr.R
\name{Expr_median}
\alias{Expr_median}
\title{median}
\usage{
Expr_median
}
\value{
Expr
}
\description{
Get median value.
}
\examples{
pl$DataFrame(list(x=c(1,NA,2)))$select(pl$col("x")$median()==1.5) #is true
}
\keyword{Expr}
