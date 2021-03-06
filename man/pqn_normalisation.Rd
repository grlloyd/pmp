% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/normalisation.R
\name{pqn_normalisation}
\alias{pqn_normalisation}
\title{Normalise peak table using PQN method}
\usage{
pqn_normalisation(df, classes, qc_label)
}
\arguments{
\item{df}{Data frame.}

\item{classes}{Vector of class labels.}

\item{qc_label}{Label used for QC samples. If set to 'all', all samples will
be used to calculate correction factor}
}
\value{
List of normalised data set and correction coefficients
}
\description{
Normalise peak table using PQN method
}
\examples{
attach (testData)
pqn_normalisation(df=testData$data, classes=testData$class, qc_label='QC')

}
