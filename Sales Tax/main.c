#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int main(int argc, char *argv[])
{
    float times;
    float percent;
    float item;
    float price[10];
    
    printf("How much is the item.\n");
    gets(price);
    atoi=(price);
    
    percent=1.06;
    
    times=percent * item;
    
    printf("The price with Mich. taxes is $%.2f\n" ,times);
    
  
  system("PAUSE");	
  return 0;
}
