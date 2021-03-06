% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loadTaxIDProteome.R
\name{loadTaxIDProteins}
\alias{loadTaxIDProteins}
\title{load the list of all proteins for given taxonomy ID (any level)}
\usage{
loadTaxIDProteins(taxid, dir)
}
\arguments{
\item{dir}{directory where to save/look for the local copy}
}
\value{
\code{loadTaxIDProteins} returns list containing the character vector of all UniProt accessions for a given taxonomy ID (saves it to a file) and the taxonomy ID (taxid)
}
\description{
loadTaxIDProteins function loads all UniProt accessions for a given taxonomy ID
}
\examples{
#loadTaxIDProteins(taxid = 9606, dir = "./")
}
\author{
Vitalii Kleshchevnikov

Vitalii Kleshchevnikov
}
