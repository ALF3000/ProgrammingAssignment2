source('cachematrix.R')
x=matrix(c(0,2,1,0),nrow=2,ncol=2)
ix=matrix(c(0,1,.5,0),nrow=2,ncol=2)
y=makeCacheMatrix(x)

if (norm(cacheSolve(y)-ix)==0){
    print('Test passed')
}else
{print('Test failed')}
