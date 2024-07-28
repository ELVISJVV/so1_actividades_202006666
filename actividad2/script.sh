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


# Imprimir el mensaje
message="Hola $github_user. User ID: $user_id. Cuenta fue creada el: $created_at."
echo $message


fecha=$(date +"%d-%m-%Y")
echo "Fecha: $fecha"

mkdir -p "/tmp/$fecha"

echo "$message" >> "/tmp/$fecha/saludos.log"