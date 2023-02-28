#include <stdio.h>    /* entrées sorties */
#include <unistd.h>   /* pimitives de base : fork, ...*/
#include <stdlib.h>   /* exit */
#include <sys/wait.h> /* wait */
#include <string.h>   /* opérations sur les chaines */
#include <signal.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>







void scenario_1() {
    int p[2];

    int child_id = fork();
    pipe(p);
    if (child_id == 0) {
        close(p[1]);
        int rd;
        read(p[0], &rd, sizeof(int));
        close(p[0]);
        printf("Entier lu: %d\n", rd);
    }
    else {
        close(p[0]);
        int e = 10;
        write(p[1], &e, sizeof(e));
        close(p[1]);
    }
    
}









#define N 3
void handler_sigchld(int num_signal) {
    int wstatus, fils_termine ;
   /* prendre connaissance de la fin des fils */
    while ((fils_termine = (int) waitpid(-1, &wstatus, WNOHANG))> 0) {
       printf("\nMon fils %d est arrete\n", fils_termine) ;
   }
}

int main () {

   int p[2];
   if (pipe(p) == -1) {
      printf("\n Erreur");
      exit(2);
   }
   
   int pid = fork();
   if (pid == -1) {
      printf("\n Errruuuuur");
      exit(3);
   }
   
   if (pid ==0) {
      close(p[0])
      int i = 0;
      for (i=0, i<N, i++) {
          write(p[1], &i, sizeof(int));
      close(p[1]);
      } else {
          int i;
          close(p[1]);
          while(1);
          int nb = read(p[0], &i, sizepf(int));
          if (nb ==-1) {
             printf("Ismail");
             exit(4);
          }
          if (nb ==0) {
             printf("%d\n", sum);
             exit(0);
             sum += i;
         }
     }
   }
   return EXIT_SUCCESS ;
}   
          
      
          
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

