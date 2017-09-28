#!/bin/sh

# key password: "password"

# skapa en nyckel
openssl genrsa -des3 -out ca.key 4096

read foo

# kolla på nyckeln
openssl rsa -in ca.key -noout -text

read foo


# Skapa en certificate request
openssl req -new -x509 -sha256 -days 3650 -key ca.key -out ca.crt


read foo


# kolla på certifikatet
openssl x509 -noout -text -in ca.crt


