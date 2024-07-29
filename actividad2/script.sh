#!/bin/bash


if [ -z "$GITHUB_USER" ]; then
    GITHUB_USER=ELVISJVV
fi

# curl sirve para hacer la petición HTTP GET y -s sirve para que no se muestre la barra de progreso

response=$(curl -s "https://api.github.com/users/$GITHUB_USER")

# -n
github_user=$(echo "$response" | sed -n 's/.*"login": "\(.*\)",/\1/p')
user_id=$(echo "$response" | sed -n 's/.*"id": \(.*\),/\1/p')
created_at=$(echo "$response" | sed -n 's/.*"created_at": "\(.*\)",/\1/p')



message="Hola $github_user. User ID: $user_id. Cuenta fue creada el: $created_at."


fecha=$(date +"%d-%m-%Y")

mkdir -p "/tmp/$fecha"

echo "$message" >> "/tmp/$fecha/saludos.log"

cat "/tmp/$fecha/saludos.log"



#Configuración para que el script se ejecute cada 5 minutos
# crontab -e
# Agregar la siguiente línea:
# */5 * * * *  cd "ruta del script" && ./script.sh