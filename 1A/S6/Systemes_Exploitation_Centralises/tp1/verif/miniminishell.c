#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <sys/wait.h>


bool execution_cmd(char cmd[]) {
    pid_t pidFils, idFils;

    pidFils = fork();

    if (pidFils == -1)
        return false;

    if (pidFils == 0) {
        execlp(cmd, cmd, NULL);
        exit(EXIT_FAILURE);
    }
    else {
        int codeTerm;
        idFils = wait(&codeTerm);
        if (idFils == -1)
            return false;
        
        if (WIFEXITED(codeTerm) && codeTerm == 0)
            return true;
    }
    return false;
}

int main () {
    char buf[30];

    while(!(scanf("%s", buf) == EOF)) {
        printf(">>>");
        if(scanf("%s", buf) == EOF || !strcmp(buf, "exit"))
            break;
        
        if(execution_cmd(buf))
            printf("SUCCESS\n");
        else
            printf("ECHEC\n");
    }
    
    printf("Salut");
    return EXIT_SUCCESS;
}
