library("doParallel", lib.loc="~/R/win-library/3.3")
library("microbenchmark", lib.loc="~/R/win-library/3.3")

set.seed(15)
system.time(rnorm(800000))
microbenchmark(rnorm(800000))

set.seed(15)
system.time(foreach(i=1:32, .combine='c')
            %do% rnorm(25000))
microbenchmark(foreach(i=1:32, .combine='c')
               %do% rnorm(25000))

no_cores <- detectCores()-1
#registerDoParallel(cores=no_cores)
cl <- makeCluster(no_cores, type="PSOCK")

registerDoParallel(cl)
system.time(foreach(i=1:32, .combine='c')
            %dopar% rnorm(25000))
microbenchmark(foreach(i=1:32, .combine='c')
               %dopar% rnorm(25000))
registerDoSEQ()
stopCluster(cl)
#cluster is off so should be back to non-parallel
microbenchmark(foreach(i=1:32, .combine='c')
               %dopar% rnorm(25000))
