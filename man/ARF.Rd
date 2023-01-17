\name{ARF}
\alias{ARF}
\title{ARF
}
\description{Function which calculates Areal Reduction Factor (ARF) with required calls to short_ARF and long_ARF for associated durations and areas. Implements the interpolation methods recommended in ARR2019.
}
\usage{
ARF(area, duration, aep, region = NULL, params = NULL, neg_to_zero = TRUE)
}
\arguments{
  \item{area}{numeric value of area (in km^2).
  }
  \item{duration}{numeric value of duration of design rainfall event (in minutes). Constrained between 0 and 10800.
  }
  \item{aep}{numeric value of Annual Exceedance Probability (AEP) of design rainfall event (in decimal form; 1pc = 0.01).
  }
  \item{region}{character string defining the ARR ARF region to use. Accepted values are: \code{region_names <- c("East Coast North", "Semi-arid Inland QLD", "Tasmania", "SW WA", "Central NSW", "SE Coast", "Southern Semi-arid", "Southern Temperate", "Northern Coastal", "Inland Arid")}
  }
  \item{params}{Unneeded, but kept for posterity. List structure defined in source code when needed (\code{duration > 720})
  }
  \item{neg_to_zero}{logical; if true, negative ARF values will be coerced to zero.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Numeric value of ARF, to be multiplied with respective design rainfall intensity.
}
\references{
ARR2019, Book 2 - Rainfall estimation <http://www.arr-software.org/pdfs/ARR_190514_Book2.pdf>
}
\author{
Tom Keeble <tom.keeble@unimelb.edu.au>
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{ARF_long}}
  \code{\link{ARF_short}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
