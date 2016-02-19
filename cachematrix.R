## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    iM<- NULL
    set <- function(M1){
        M<<- M1
        iM<<-NULL
    }
    get<- function() x
    getinverse<- function() iM
    setinverse<- function(iM1) iM<<- iM1
    list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    iM<- x$getinverse()
    if (!is.null(iM)){
        message("getting cached data")   
        return(iM)
    }
    M=x$get()
    iM=solve(M,...)
    x$setinverse(iM)
    iM
}
