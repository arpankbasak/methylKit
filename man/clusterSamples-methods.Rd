% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusterSamples.R, R/methylDBFunctions.R
\docType{methods}
\name{clusterSamples}
\alias{clusterSamples}
\alias{clusterSamples,methylBase-method}
\alias{clusterSamples,methylBaseDB-method}
\title{Hierarchical Clustering using methylation data
 
The function clusters samples using \code{\link[stats]{hclust}} function and 
various distance metrics derived from percent methylation per base or per 
region for each sample.}
\usage{
clusterSamples(.Object, dist="correlation", method="ward",
                       sd.filter=TRUE,sd.threshold=0.5,
                       filterByQuantile=TRUE, plot=TRUE,chunk.size)

\S4method{clusterSamples}{methylBase}(.Object, dist, method, sd.filter,
  sd.threshold, filterByQuantile, plot)

\S4method{clusterSamples}{methylBaseDB}(.Object, dist = "correlation",
  method = "ward", sd.filter = TRUE, sd.threshold = 0.5,
  filterByQuantile = TRUE, plot = TRUE, chunk.size = 1e+06)
}
\arguments{
\item{.Object}{a \code{methylBase} or \code{methylBaseDB} object}

\item{dist}{the distance measure to be used. This must be one of 
"\code{correlation}", "\code{euclidean}", "\code{maximum}", 
"\code{manhattan}", "\code{canberra}", "\code{binary}" or "\code{minkowski}". 
Any unambiguous abbreviation can be given. (default:"\code{correlation}")}

\item{method}{the agglomeration method to be used. This should be 
(an unambiguous abbreviation of) one of "\code{ward}", "\code{single}", 
"\code{complete}", "\code{average}", "\code{mcquitty}", "\code{median}" 
or "\code{centroid}". (default:"\code{ward}")}

\item{sd.filter}{If \code{TRUE}, the bases/regions with low variation will be 
discarded prior to clustering (default:TRUE)}

\item{sd.threshold}{A numeric value. If \code{filterByQuantile} is \code{TRUE}, 
features whose standard deviations is less than the quantile denoted by 
\code{sd.threshold} will be removed.
 If \code{filterByQuantile} is \code{FALSE}, then features whose 
 standard deviations is less than the value of \code{sd.threshold} 
 will be removed.(default:0.5)}

\item{filterByQuantile}{A logical determining if \code{sd.threshold} is to 
be interpreted as a quantile of all Standard Deviation values from 
bases/regions (the default), or as an absolute value}

\item{plot}{a logical value indicating whether to plot hierarchical 
clustering. (default:TRUE)}

\item{chunk.size}{Number of rows to be taken as a chunk for processing the \code{methylBaseDB} objects, default: 1e6}
}
\value{
a \code{tree} object of a hierarchical cluster analysis using a set 
         of dissimilarities for the n objects being clustered.
}
\description{
Hierarchical Clustering using methylation data
 
The function clusters samples using \code{\link[stats]{hclust}} function and 
various distance metrics derived from percent methylation per base or per 
region for each sample.
}
\section{Details}{

The parameter \code{chunk.size} is only used when working with 
\code{methylBaseDB}  objects, 
as they are read in chunk by chunk to enable processing large-sized 
objects which are stored as flat file database.
Per default the chunk.size is set to 1M rows, which should work for 
most systems. If you encounter memory problems or 
have a high amount of memory available feel free to adjust the 
\code{chunk.size}.
}

\examples{
data(methylKit)

clusterSamples(methylBase.obj, dist="correlation", method="ward", plot=TRUE)



}
