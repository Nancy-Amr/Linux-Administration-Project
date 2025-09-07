#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>




int main(){

        int pid1, pid2;

        pid1 = fork();
        if (pid1 == 0){
                char *args[] = {"/usr/bin/mpstat","1","5",NULL};
                execv("/usr/bin/mpstat",args);
                exit(1);
        } else if(pid1 < 0){
                perror("Fork 1 Failed!!");
                exit(1);
        }
        pid2 = fork();
        if(pid2 == 0){
                char *args[] = {"/bin/ps","-aux",NULL};
                execv("/bin/ps", args);
                exit(1);
        }else if(pid2 < 0){
                perror("Fork 2 Failed!!");
                exit(1);
        }

        sleep(5);
        int status;
        waitpid(pid1, &status, 0);
        waitpid(pid2, &status, 0);
        printf("\nBoth worker processes finished.\n");

    return 0;

}