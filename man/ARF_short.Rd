\name{ARF_short}
\alias{ARF_short}
\title{ARF_short
}
\description{
Function which calculates Areal Reduction Factor (ARF) where duration <= 720. Implements the interpolation methods recommended in ARR2019. Called by \code{\link{ARF}}.
}
\usage{
ARF(area, duration, aep)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{area}{numeric value of area (in km^2).
  }
  \item{duration}{numeric value of duration of design rainfall event (in minutes). Constrained between 0 and 10800.
  }
  \item{aep}{numeric value of Annual Exceedance Probability (AEP) of design rainfall event (in decimal form; 1pc = 0.01).
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{ARF}}
  \code{\link{ARF_long}}
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
