% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glog_transformation.R
\name{SSE}
\alias{SSE}
\title{Internal function to estimate SSE for optimising glog params}
\usage{
SSE(lambda, y0 = 0, y)
}
\arguments{
\item{lambda}{transform parameter}

\item{y0}{offset applied to y (default=0)}

\item{y}{values.}
}
\value{
numeric, sum of squared difference
}
\description{
Internal function to estimate SSE for optimising glog params
}
