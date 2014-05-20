## The makeCacheMatrix and cacheSolve functions demonstrate memoization in R.
## Together, these functions calculate the inverse of a matrix and cache the result.
## These functions make a strong assumption that the matrix is invertible.
## The ultimate purpose is to speed-up costly computations by storing the result and avoiding
## repeating the same calculations.

## The makeCacheMatrix function creates a special object that stores the original matrix, as well as 
## the inverse matrix. This is done by creating a list of several helper functions to set and get the inverse.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL # initialize i to NULL, i standing for inverse
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x  # returns the original data
  setinverse <- function(solve) i <<- solve  # sets the inverse 
  getinverse <- function() i  # returns the value of i
  list(set = set, get = get,   # return the list of functions
       setinverse = setinverse,
       getinverse = getinverse)
}


## The cacheSolve function makes use of the special matrix object. 
## It first attempts to retrieve a cached inverse matrix, if it exists.
## If it does not exist, it calculates the inverse, stores the result for later use, and returns the inverse matrix
cacheSolve <- function(x, ...) {
  i <- x$getinverse() # first attempt to get the cached inverse
  if (!is.null(i)) {  # if the returned value is not null, the inverse has already been calculated
      message("getting cached data")
      return(i)  # this will return the cached value
  }
  data <- x$get()  # if the value above was null, the inverse has not yet been calculated, so the data needs to be retrieved
  i <- solve(data, ...)  # calculates the matrix inverse
  x$setinverse(i)  # the matrix inverse is cached for later retrieval
  i  # returns the matrix inverse
}
