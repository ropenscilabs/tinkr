% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/asis-nodes.R
\name{protect_math}
\alias{protect_math}
\title{Protect math elements from commonmark's character escape}
\usage{
protect_math(body, ns = md_ns())
}
\arguments{
\item{body}{an XML object}

\item{ns}{an XML namespace object (defaults: \code{\link[=md_ns]{md_ns()}}).}
}
\value{
a copy of the modified XML object
}
\description{
Protect math elements from commonmark's character escape
}
\details{
Commonmark does not know what LaTeX is and will LaTeX equations as
normal text. This means that content surrounded by underscores are
interpreted as \verb{<emph>} elements and all backslashes are escaped by default.
This function protects inline and block math elements that use \code{$} and \verb{$$}
for delimiters, respectively.
}
\note{
this function is also a method in the \link{yarn} object.
}
\examples{
m <- tinkr::to_xml(system.file("extdata", "math-example.md", package = "tinkr"))
txt <- textConnection(tinkr::to_md(m))
cat(tail(readLines(txt)), sep = "\n") # broken math
close(txt)
m$body <- protect_math(m$body)
txt <- textConnection(tinkr::to_md(m))
cat(tail(readLines(txt)), sep = "\n") # fixed math
close(txt)
}
