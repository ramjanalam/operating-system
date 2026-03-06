#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[])
{
    int p1[2], p2[2];
    char buf = 'a';
    int exchanges = 1000;

    if(argc > 1)
        exchanges = atoi(argv[1]);

    pipe(p1);
    pipe(p2);

    int pid = fork();

    if(pid == 0){
        for(int i = 0; i < exchanges; i++){
            read(p1[0], &buf, 1);
            write(p2[1], &buf, 1);
        }
        exit(0);
    }
    else{
        int start = uptime();

        for(int i = 0; i < exchanges; i++){
            write(p1[1], &buf, 1);
            read(p2[0], &buf, 1);
        }

        int end = uptime();

        wait(0);

        int ticks = end - start;

        printf("Exchanges: %d\n", exchanges);
        printf("Ticks: %d\n", ticks);
        printf("Exchanges per second: %d\n", exchanges * 100 / ticks);
    }

    exit(0);
}
