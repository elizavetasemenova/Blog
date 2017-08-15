#include <stdio.h>     /* prinft, fprintf */
#include <math.h>      /* log */
#include <stdlib.h>    /* rand */

//#define N         1000000		 // number of simulations
#define lambda    2.0		    // lambda - Exponential distribution parameter
#define OUTFILE	  "ICDFout.txt"	// output file

int main ()
{
  
  FILE *out = fopen(OUTFILE,"w");
   
  int N = 100000;

  double u[N];    // uniformly[0,1] distributed random number
  double e[N];    // exponentially distributed random number
  
  for (int i=0; i<N; i++){
    u[i] = ((double)rand()/(double)RAND_MAX);
    e[i] = - log(u[i])/lambda;
   //e[i] = - log(u[i]);
    printf("u[%i]=%f, e[%i]=%f\n", i ,u[i], i, e[i]);
    //fprintf(out, "u[%i]=%f, e[%i]=%f\n", i ,u[i], i, e[i]);
    fprintf(out, "%f\t%f\n", u[i], e[i]);
  }


  fclose(out);
  return 0;
}
