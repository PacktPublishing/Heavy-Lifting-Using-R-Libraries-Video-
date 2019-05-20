# A prime number is a number that only has itself and one as factors.
# So 3 is a prime since only 3 and 1 divide into it.
# 4 is not since 4, 2 and 1 does.
#
# 1.write a function that checks to see whether a positive integer
#   arguement is a prime number, returning TRUE if it is otherwise FALSE
# 2.Check numbers from 1 to 100000 to see if they are primes,
#   putting the logical results in a vector
# 3.Count how many primes are <=n for each n from 1-100000
# 4.Finally divide Count by log(n) and plot, since
#   the prime number theorem says that the number of primes behaves like
#   log(x)/x for large x
#
#From wikipedia we can see what for 100000, there are 9592 primes and
#the numbers * log(x)/x is 1.104. For 1000000 it is 78498 and 1.084.
#figures are given up to 10^25

isprime <- function(x) {
  if(x<0){
    return(FALSE)
  }

  if(is.numeric(x)==FALSE){
    return(FALSE)
  }
  if(x%%1!=0){
    return(FALSE)
  }

  if(x==1){
    return(FALSE)
  }
  if(x==2){
    return(TRUE)
  }
  n=ceiling(sqrt(x)) #we only need to check till sqrt(x)
  a=1

  #x=as.integer(x)
  is_prime=FALSE

  factors=0
  i=2
  while(is_prime==FALSE){
    a=x/i
    #cat("a=",a,"i=",i,"factors=",factors,"\n")

    if(a*i==x){
      factors=factors+1
      diff=a%%1
      if(factors>0 && diff==0){  #if has a factor
        return(FALSE)
      }
    }

    if(i<n){
      i=i+1
    } else {
      return(TRUE)
    }
  }

  return(is_prime)
}

nos=10000
prime_check=rep(0,nos)
cnt=rep(0,nos)
ratio=cnt

prime_cnt=0
#cpp_loop_prime(nos) #doesn't go faster if I loop within cpp like this

for(i in 1:nos){
#prime_check[i]=cpp_isprime(i)
prime_check[i]=isprime(i) #this is the r isprime function

 if(prime_check[i]){
   prime_cnt=prime_cnt+1
 }
 cnt[i]=prime_cnt
 #cnt[i]=sum(prime_check)
 ratio[i]=cnt[i]*log(i)/i
}
print(prime_cnt)
