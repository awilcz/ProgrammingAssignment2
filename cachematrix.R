## These functions will potentially save computing time as they will fetch the 
## inverse of a matrix from the cache if it is available.

## creates "vector" which sets, gets the value of matrix x and sets and 
##gets its inverse 

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      setmat <- function(y) {
        x <<- y
        m <<- NULL
      }
    getmat <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(setmat = setmat, getmat = getmat,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Calculates inverse of matrix unless the inverse is already cached

cacheSolve <- function(x, ...) {
      m <- x$getsolve()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$getmat()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
