

# Overall description
        # Below are two functions that are used to compute  inverse of a square 
        # matrix using the solve function in R. For example, if X is a square 
        # invertible matrix, then solve(X) returns its inverse.
        # Assume that the matrix supplied is always invertible.
        
        # This code mirrors rdpeng's makeVector and cachemean examples:
        # https://github.com/rdpeng/ProgrammingAssignment2.git




## makeCacheMatrix Description
        # This function creates a special "matrix" object that can cache its 
        #inverse.


makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set<-function(y){
                x<<-y
                m<<-NULL
        }
        get<-function() x
        setmatrix<-function(solve) m<<- solve
        getmatrix<-function() m
        list(set=set, get=get,
             setmatrix=setmatrix,
             getmatrix=getmatrix)
}


## cacheSolve Description
        #This function computes the inverse of the special "matrix" returned by 
        #makeCacheMatrix above. 
        # If the inverse has already been calculated (and the matrix has not changed), 
        # then cacheSolve retrieves the inverse from the cache.          

cacheSolve <- function(x=matrix(), ...) {
        m<-x$getmatrix()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        matrix<-x$get()
        m<-solve(matrix, ...)
        x$setmatrix(m)
        m
}



