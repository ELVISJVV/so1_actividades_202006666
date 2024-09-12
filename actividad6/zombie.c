#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
    pid_t pid = fork(); // Crear un proceso hijo

    if (pid == 0)
    {
        // Este es el proceso hijo
        printf("El proceso hijo termina ahora.\n");
        exit(0); // El proceso hijo termina aquí
    }
    else
    {
        // Este es el proceso padre
        printf("Se ejecuta el proceso padre y el hijo se convierte en zombie\n");

        // Esperar 60 segundos antes de terminar
        sleep(60);

        printf("Han pasado 60 segundos y finaliza el proceso padre.\n");
    }

    return 0;
}
