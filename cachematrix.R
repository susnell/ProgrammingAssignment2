## Caching the Inverse of the Matrix 
## so that it does not need to be calculated again each time

## First, create a matrix to cache the data

makeCacheMatrix <- function(x = matrix()) {
m<-NULL 
set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function()x
setinverse<<-function(inverse)m<<-inverse
getinverse<-function()m
list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)}


## Secondly, check if there is data in the cahce m and return it.
## If there's nothing in the cahce, then invert the matrix.

cacheSolve <- function(x, ...) {
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setinverse(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
