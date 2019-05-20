#include <Rcpp.h>
#include<iostream>
#include<math.h>
using namespace Rcpp;


// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
  return x * 2;
}


// [[Rcpp::export]]
NumericVector cpp_isprime(NumericVector x) {
  int n,nos;
  n=ceil(sqrt(x[0]));
  nos=x[0];
  //printf("Hello %d\n",n);

  int i;

   for(i=2;i<=n;i++)
    {
     if(nos%i==0)
     {
       //printf("Factor=%d\n",i);
       x=0;
       return x;
     }
     //printf("%d\n",i);
    }
  x=1;
  return x;
}


// [[Rcpp::export]]
NumericVector cpp_loop_prime(NumericVector x) {
  //looping within cpp like this not faster
  int i;
  for(i=1;i<=x[0];i++){
    cpp_isprime(i);
  }
  return 0;
}
// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically
// run after the compilation.
//

// [[Rcpp::export]]
NumericVector myFunction() {
  NumericVector x=rnorm(10); //calling rnorm from within cpp
  return x;
}



/*** R
timesTwo(42)
cpp_isprime(11)
myFunction()
*/



