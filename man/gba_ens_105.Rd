% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{gba_ens_105}
\alias{gba_ens_105}
\title{Example transcript annotation}
\format{
A \code{tibble::tibble()} with 26 rows and 4 columns:
\describe{
\item{seqnames}{\code{factor()} chromosome.}
\item{start}{\code{integer()} start position.}
\item{end}{\code{integer()} end position.}
\item{strand}{\code{factor()} strand.}
\item{type}{\code{factor()} type of data, one of gene, transcript, exon or CDS.}
\item{gene_name}{\code{character()} name of gene (GBA).}
\item{transcript_name}{\code{character()} name of transcript.}
\item{transcript_biotype}{\code{character()} biotype of transcript.}
}
}
\source{
generated using \code{ggtranscript/data-raw/gba_ens_105.R}
}
\usage{
gba_ens_105
}
\description{
Co-ordinates (hg38) of the genes, transcripts, exons for an example gene
(GBA) originating from Ensembl v105 reference annotation.
}
\keyword{datasets}
