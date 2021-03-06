% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/randomInteractome.R
\name{randomInteractome}
\alias{randomInteractome}
\title{Retrieve molecular interactions for the random set of proteins (of a particular taxon)}
\usage{
randomInteractome(MITABdata = NULL, degree_data = NULL, n_prot,
  degree_dist = NULL, ...)
}
\arguments{
\item{degree_data}{data.table containing pre-calculated (using \code{\link{edgelist2degree}}) degree for each node in MITABdata, usefull for taking multiple samples, the default in NULL}

\item{n_prot}{integer (1L), the number of proteins for which to retrieve the random set of interactions}

\item{degree_dist}{data.table, specifies the degree frequency () for each degree (N) to produce the network with the specific degree distribution, if set to NULL (default) the degree distribution will correspond to that of \code{taxid} interactome}

\item{...}{Arguments passed on to \code{fullInteractome}
\describe{
  \item{MITABdata}{object of class "RAW_MItab25" or "RAW_MItab27" (list) containing molecular interaction data as returned by \code{\link{queryPSICQUICrlib}} or \code{\link{loadIntActFTP}}, default in NULL}
  \item{taxid}{character (1L), taxonomy id of the species which interaction participants should belong to, default is "9606" (which is human)}
  \item{database}{character (1L), argument for \code{\link{queryPSICQUIC}}, PSICQUIC-compliant database to query for interactions. The default is "imex" alternative to which is "IntActFTP"}
  \item{protein_only}{logical (1L), if TRUE the interaction participants are restricted to proteins (exclude other types of molecules such as RNA or small molecules), default is TRUE}
  \item{directory}{directory where to store the data, if NULL the data is stored in <R-package-library>/PItools/data}
  \item{releaseORdate}{character, if data has already been downloaded: which IntAct release or download date to read}
  \item{remove_obsolete_id}{logical (1L), remove interactions in which one of the partners is encoded as obsolete UniProtKB accession (ID), not implemented properly: will never finish.}
  \item{within_species}{logical (1L), return interactions only between proteins of \code{taxid}. If FALSE returns interactions for \code{taxid} proteins both within \code{taxid} and with proteins from other species}
}}
}
\value{
list of two elements: 1. interactome - data.table containing molecular interaction data in either of these two formats:

if \code{clean} is TRUE: contains columns as described in \code{\link{cleanMITAB}};

if \code{clean} is FALSE: contains a standard set of columns for MITAB2.5 or MITAB2.7 depending on \code{format};

2. seed - character vector containing IDs of proteins used as a seed to retrieve molecular interactions
}
\description{
Retrieve molecular interactions for the random set of proteins (of a particular taxon)
}
\details{
Not implemented: Random network can be specified to have specific degree distribution. If the (\code{degree} parameter is set \code{taxid} proteins will be split by degree and from each degree group a sample of the size specified by how many times specific degree number is repeated in \code{degree} will be taken.

If the degree distribution is not specified a sample of \code{n_prot} is taken from all proteins which have interaction data available in the \code{database} for \code{taxid}. In this case, the degree distribution of the resulting set of proteins will be similar to the degree distribution in the interactome of \code{taxid} in \code{database}.

\code{randomInteractome} retrieves molecular interactions using \code{\link{fullInteractome}}
}
\examples{
{
# retrive the interactome using PSICQIUC servise (or by reading local copy) from IntAct databases for a list of 200 random human (9606) proteins, not specifying their degree distribution
#set.seed(1) # commented because too slow
#random = randomInteractome(n_prot = 200, degree_dist = NULL, taxid = "9606", database = "imex", protein_only = TRUE)

# retrive the interactome from MITABdata for a list of 200 random human (9606) proteins, not specifying their degree_dist distribution
full = fullInteractome(taxid = "9606", database = "IntActFTP", format = "tab25", clean = TRUE, protein_only = TRUE)
set.seed(1)
random = randomInteractome(MITABdata = full, n_prot = 200, degree_dist = NULL)

# retrive the interactome using PSICQIUC servise (or by reading local copy from a specified directory) from IntAct databases for a list of 200 random human (9606) proteins, not specifying their degree_dist distribution
#set.seed(1)
#random = randomInteractome(n_prot = 200, degree_dist = NULL, taxid = "9606", database = "IntActFTP", protein_only = TRUE, directory = "./data/")
}
}
\author{
Vitalii Kleshchevnikov
}
