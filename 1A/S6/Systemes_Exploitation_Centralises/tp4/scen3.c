#include <stdio.h>    /* entrées sorties */
#include <unistd.h>   /* pimitives de base : fork, ...*/
#include <stdlib.h>   /* exit */
#include <sys/wait.h> /* wait */
#include <string.h>   /* opérations sur les chaines */
#include <signal.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


#define N 10




int main() {
    int p[2];
    pipe(p);
    int son_id = fork();
    int j;
   
    for (j=1; j<= N; j++) {
         int i;
         write(p[1], &i, sizeof(int));
    }
    sleep(10);
    
    if (son_id == 0) {
        close(p[1]);
        int rd;
        while (rd <= 0) {
          read(p[0], &rd, sizeof(int));
          printf("Entier lu: %d\n", rd);
        }
        printf("\nsortie de la boucle");
    }
    else {
        close(p[0]);
        close(p[1]);
    }
}

