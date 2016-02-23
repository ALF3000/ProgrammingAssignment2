## makeCacheMatrix creates a special object that stores a matrix 
## and its inverse
## cacheSolve is a companion function that returns the inverse matrix
## using cached values if any

## makeCacheMatrix(x=matrix()) : 
# Arguments : x a matrix
# Returns : a list with the following fields :
# 	get : get() returns the matrix
# 	getinverse : getinverse() returns the inverse
# 	set : set(x) stores a new value for the matrix
# 	setinverse : setinverse(ix) stores a new value for the inverse

makeCacheMatrix <- function(x = matrix()) {
	# initialize the inverse to NULL
    iM<- NULL
    set <- function(M1){
		# use the special assignment operator
        M<<- M1
		# reset value of iM to NULL
        iM<<-NULL
    }
    get<- function() x
    getinverse<- function() iM
	# use the special assignment operator
    setinverse<- function(iM1) iM<<- iM1
    list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## cacheSolve(x,...) : companion function to makeCacheMatrix
# Arguments : x a CacheMatrix as returned by makeCacheMatrix
# Returns : the inverse of x. 

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
	# additional arguments are passed to the solve function
    iM<- x$getinverse()
    if (!is.null(iM)){
		# if the inverse has already been computed
		# return it and print a message
        message("getting cached data")   
        return(iM)
    }
    M<-x$get()
    iM<-solve(M,...) # pass any additional arguments to solve
    x$setinverse(iM)
    iM
}
