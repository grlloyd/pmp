% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glog_transformation.R
\name{jglog}
\alias{jglog}
\title{Internal function for max. likelihood optimisation of glog params
Calculates the alternative Jacobian fcn described in 
https://doi.org/10.1186/1471-2105-8-234}
\usage{
jglog(y, y0 = 0, lambda)
}
\arguments{
\item{y}{values.}

\item{y0}{offset applied to y (default=0).}

\item{lambda}{lambda}
}
\value{
numeric, optimised glog parameter
}
\description{
Internal function for max. likelihood optimisation of glog params
Calculates the alternative Jacobian fcn described in 
https://doi.org/10.1186/1471-2105-8-234
}
