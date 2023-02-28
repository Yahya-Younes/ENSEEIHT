#include <stdio.h>    /* entrées/sorties */
#include <unistd.h>   /* primitives de base : fork, ...*/
#include <stdlib.h>   /* exit */

#define MAX_PAUSES 10     /* nombre d'attentes maximum */
void handler_sigint(int signal_num) {
     printf("\n     Processus de pid %d : J'ai reçu le signal %d\n",getpid(),signal_num);
     return ;
     }
     


int main(int argc, char *argv[]) {
	int nbPauses;
	int retour
	nbPauses = 0;
	signal(SIGINT, handler_sig);
	printf("Processus de pid %d\n", getpid());
	for (nbPauses = 0 ; nbPauses < MAX_PAUSES ; nbPauses++) {
	    retour = fork(
		pause();		// Attente d'un signal
		printf("pid = %d - NbPauses = %d\n", getpid(), nbPauses);
    } ;
    return EXIT_SUCCESS;
}
