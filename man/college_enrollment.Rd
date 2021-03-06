% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/college_enrollment.R
\docType{data}
\name{college_enrollment}
\alias{college_enrollment}
\title{College Enrollments}
\format{A data frame with 39 rows and 10 variables.
The variables are as follows:
\describe{
   \item{school_id}{School identification number}
   \item{name}{Name of school}
   \item{label}{School name abbreviation, if applicable}
   \item{state}{State where school is located}
   \item{city}{City where school is located}
   \item{lat}{Latitude of school location}
   \item{long}{Longitude of school location}
   \item{liberal_arts}{Dummy variable for if the school is liberal arts or not}
   \item{undergrad}{Number of undergraduate students enrolled}
   \item{enrollment}{Total number of students enrolled}
}}
\source{
The data was sourced from QAC251 - Introduction to Data Visualization notes for spatial analysis.
}
\usage{
college_enrollment
}
\description{
A dataset containing information about college enrollments by state in 2015.
}
\examples{
summary(college_enrollment)
table(college_enrollment$liberal_arts)
}
\keyword{datasets}
