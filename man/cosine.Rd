\name{cosine,predict.usrData}
\alias{cosine}
\alias{predict.usrData}

\title{@title Predict Using k-NN}

\usage{
  predict.usrData(origData, newData, newItem, k, wtcovs = NULL, wtcats = NULL)
}

\arguments{
  \item{origData:}{training set, object of class 'usrData', output of
  \code{findUserData}.}

  \item{newData:}{data point (just one for now) to be predicted, object
  of class \code{usrDatum}, same class as each element of the list
  \code{origData}. The \code{userID} component can be NA.}

  \item{newItem:}{ID of the item rating to be predicted for the user
  specified in \code{newData}.}

  \item{k:}{vector of numbers of nearest neighbors.}

  \item{wtcovs:}{weight to put on covariates; NULL if no covs.}

  \item{wtcats:}{weight to put on item categories; NULL if no cats.}
}

\value{
  Predicted rating for \code{newData}.
}

\description{
  Rating prediction via nearest neighbors, via \code{cosDist} (inner product);
  the latter, though standard, has certain problems (e.g., its
  scale-free nature), and other choices for distance measure will be added.
  covariates (e.g. age, gender) and item type preferences (e.g.
  preferred movie genres) are allowed
}

\author{
	Vishal Chakraborty and Norm Matloff
}

\examples{
     ivl <- InstEval  # getInstEval() NOT called
     ivl$s <- as.numeric(ivl$s) 
     ivl$d <- as.numeric(ivl$d) 
     ivl <- ivl[,c(1,2,7)]
     usrdata <- formUserData(ivl[,1:3]) 
     # predict the rating user 3 would give item 8; warning, in general
     # element [[3]] may be have user 3; need code to find user 3
     predict(usrdata,usrdata[[3]],8,10)  # 2.6
     # user not in database
     nu <- list(userID='88888',itms=c(22,99),ratings=c(5,1))
     predict(usrdata,nu,8,10)  # 3.2
}
