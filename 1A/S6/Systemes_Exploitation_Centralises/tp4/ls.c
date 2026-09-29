#include<stdio.h>    /* entrées sorties */
#include<unistd.h>   /* pimitives de base : fork, ...*/
#include<stdlib.h>   /* exit */
#include<sys/wait.h> /* wait */
#include<string.h>   /* opérations sur les chaines */
#include<signal.h>  

int main(src, fichier) {
    int fd,
    char *src = argv[1];
    char * fichier = argv[2];
    
    int fd = open(fichier,O_WRONLY | O_CREAT | O_TRUNC);
    dup2(fichier,
    exec lp("ls","ls",src);
    return EXIT_SUCCESS;
    }
