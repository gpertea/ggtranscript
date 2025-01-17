% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/to_diff.R
\name{to_diff}
\alias{to_diff}
\title{Obtain the differences between transcripts}
\usage{
to_diff(exons, ref_exons, group_var = NULL)
}
\arguments{
\item{exons}{\code{data.frame} containing exonic ranges, which can contain data
from from multiple transcripts.}

\item{ref_exons}{\code{data.frame} containing exonic ranges that \code{exons} will be
compared against. \code{ref_exons} must contain data from a single transcript.}

\item{group_var}{\code{character} if input \code{data.frame} contains more than 1
transcript, \code{group_var} should specify the column that differentiates
transcripts (e.g. "transcript_id").}
}
\value{
a \code{data.frame} that details the differences of each \code{exon} (in each
\code{group_var}) to \code{ref_exons}.
}
\description{
\code{to_diff} is a helper function intended to facilitate visualizing the
differences between transcript structure. \code{to_diff} expects two sets of user
inputted exons; 1. \code{exons} - exons from any number of transcripts that will
be compared to \code{ref_exons} and 2. \code{ref_exons} - exons from a single
transcript which acts as the reference to compare against.
}
\examples{

library(magrittr)

gba_ens_105_exons <- gba_ens_105 \%>\%
    dplyr::filter(type == "exon")

gba_ens_105_exons

# for example, let's compare other transcripts to the MANE-select transcript
mane <- gba_ens_105_exons \%>\%
    dplyr::filter(transcript_name == "GBA-202")

single_tx <- gba_ens_105_exons \%>\%
    dplyr::filter(transcript_name \%in\% c("GBA-203"))

single_tx_diffs <- to_diff(
    exons = single_tx,
    ref_exons = mane
)

single_tx_diffs

# exons can also contain multiple transcripts
multi_tx <- gba_ens_105_exons \%>\%
    dplyr::filter(transcript_name \%in\% c("GBA-203", "GBA-201", "GBA-204"))

multi_tx_diffs <- to_diff(
    exons = multi_tx,
    ref_exons = mane,
    group_var = "transcript_name"
)

multi_tx_diffs

# an example of visualising differences
mane \%>\%
    dplyr::bind_rows(multi_tx) \%>\%
    dplyr::mutate(
        transcript_name = transcript_name \%>\%
            factor(levels = c("GBA-202", "GBA-201", "GBA-203", "GBA-204"))
    ) \%>\%
    ggplot2::ggplot(
        ggplot2::aes(
            xstart = start,
            xend = end,
            y = transcript_name
        )
    ) +
    geom_range() +
    geom_range(
        data = multi_tx_diffs,
        ggplot2::aes(fill = diff_type),
        alpha = 0.2,
    ) +
    ggplot2::scale_y_discrete(
        labels = c("MANE Select", "GBA-201", "GBA-203", "GBA-204")
    )
}
