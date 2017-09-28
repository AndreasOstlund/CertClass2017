#!/bin/sh

# konvertera till PKCS#8
openssl pkcs8 -topk8 -inform pem -in server.key -out private.pk8 -outform pem

# importera certifikat i windows cert store 
# ...eller skapa en PKCS#7
openssl crl2pkcs7 -nocrl -certfile ../labb1/ca.crt -certfile server.crt -out server.p7b

# dela upp PKCS#7-fil
openssl pkcs7 -in server.p7b -inform pem -print_certs -out certs.txt

# kolla på certs.txt
cat -ni certs.txt

# skapa PKCS#12
# password: password
openssl pkcs12 -keypbe PBE-SHA1-3DES -certpbe PBE-SHA1-3DES -export -in server.crt -inkey server.key -out pkcs12.pfx -name "PKCS12"



# dela upp PKCS#12
openssl pkcs12 -in pkcs12.pfx -out export.key -nocerts
openssl pkcs12 -in pkcs12.pfx -out export.crt -nokeys


# verifiera certifikat, nyckel, request
openssl x509 -noout -modulus -in server.crt | openssl md5
openssl rsa -noout -modulus -in server.key | openssl md5
openssl req -noout -modulus -in server.csr | openssl md5


