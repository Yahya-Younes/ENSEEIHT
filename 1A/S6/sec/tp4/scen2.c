#include <stdio.h>    /* entrées sorties */
#include <unistd.h>   /* pimitives de base : fork, ...*/
#include <stdlib.h>   /* exit */
#include <sys/wait.h> /* wait */
#include <string.h>   /* opérations sur les chaines */
#include <signal.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>







int main() {
    int p[2];
    pipe(p);
    int i;
    write(p[1], &i, sizeof(int));
    
    int son_id = fork();
    
    if (son_id == 0) {
        close(p[1]);
        int rd;
        read(p[0], &rd, sizeof(int));
        printf("Entier lu: %d\n", rd);
    }
    else {
        close(p[0]);
        close(p[1]);
    }
}

