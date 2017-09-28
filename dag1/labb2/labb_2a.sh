#!/bin/sh

# skapa nyckel
# password: "password"
openssl genrsa -des3 -out server.key 2048

# skapa request från nyckeln
openssl req -new -sha256 -key server.key -out server.csr

# kolla på request
openssl req -in server.csr -noout -text


# signera certifikatet från CA
openssl x509 -req -days 1825 -in server.csr -CA ../labb1/ca.crt -CAkey ../labb1/ca.key -set_serial 0x123 -out server.crt

# kolla på signerade certifikatet
openssl x509 -noout -text -in server.crt


