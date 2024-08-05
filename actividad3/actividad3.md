
# Actividad 3 - Control de Accesos

## Parte 1: Gestión de  Usuarios

    1. Creación de usuarios

                sudo useradd usuario1
                sudo useradd usuario1
                sudo useradd usuario1

    2. Asignación de contraseñas

                sudo passwd usuario1
                sudo passwd usuario2
                sudo passwd usuario3

    3. Información de usuarios

                id usuario1
                uid=1001(usuario1) gid=1001(usuario1) grupos=1001(usuario1),100(users)

    4. Eliminación de usuarios

                sudo userdel usuario3


## Parte 2: Gestión de Grupos

    1. Creación de grupos

                sudo groupadd grupo1
                sudo groupadd grupo2

    2. Agregar usuarios a grupos

                sudo usermod -aG grupo1 usuario1
                sudo usermod -aG grupo2 usuario2

    3. Verificar membresía

                groups usuario1
                usuario1 : usuario1  users grupo1

                groups usuario2
                usuario2 : usuario2 users grupo2

    4. Eliminar grupo

                sudo groupdel grupo2

## Parte 3: Gestión de Permisos

    1. Creación de Archivos y Directorios

                sudo su - usuario1
                nano archivo1.txt
                mkdir directorio1
                nano ./directorio1/archivo2.txt

    2. Verificar Permisos

                ls -l archivo1.txt
                -rw-r--r-- 1 usuario1 usuario1 5 ago  4 21:46 archivo1.txt

                ls -ld directorio1/
                drwxr-xr-x 2 usuario1 usuario1 4096 ago  4 21:47 directorio1/


    3. Modificar Permisos usando `chmod` con Modo Numérico

                chmod 640 archivo1.txt

    4. Modificar Permisos usando `chmod` con Modo Simbólico:

                chmod u+x directorio1/archivo2.txt

    5. Cambiar el Grupo Propietario

                chgrp grupo1 directorio1/archivo2.txt

    6. Configurar Permisos de Directorio

                chmod 740 directorio1/

    7. Comprobación de Acceso

                    sudo su - usuario2
                    cat archivo1.txt
                    cat: archivo1.txt: Permiso denegado

                    cat directorio1/archivo2.txt
                    cat: directorio1/archivo2.txt: Permiso denegado

                    sudo su - usuario1
                    cat archivo1.txt
                    Contenido de archivo1

                    cat directorio1/archivo2.txt
                    Contenido de archivo2

    8. Verificación Final

                    ls -l archivo1.txt
                    -rw-r----- 1 usuario1 usuario1 5 ago  4 21:46 archivo1.txt

                    ls -ld directorio1/
                    drwxr----- 2 usuario1 grupo1 4096 ago  4 21:47 directorio1/


## Reflexión

1. ¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?

        Para garantizar la seguridad y privacidad de la información almacenada en el sistema.

2. ¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?

        auditd: Permite auditar los cambios en los archivos y directorios.
        setfacl: Permite establecer permisos de acceso avanzados.
        chattr: Permite establecer atributos especiales en los archivos.