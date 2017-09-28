#!/bin/sh

# lista tillgängliga kurvor
openssl ecparam -list_curves


# skapa underlag för parametrar som skall användas för nyckelgenerering
openssl ecparam -name secp160r1 -out key-param_test-ca.pem

cat key-param_test-ca.pem


# kolla filen med openssl
openssl ecparam -noout -text -in key-param_test-ca.pem

# skapa nyckelpar
openssl req -nodes -subj "/C=SE/O=Region Orebro lan/L=Orebro/S=Narke/OU=Regonservice/CN=Test CA ECC 160r1" -keyout test-ca.key -newkey ec:key-param_test-ca.pem -new -out test-ca.req


# kolla på nyckeln
openssl ec -noout -text -in test-ca.key

# skapa självsignerat certifikat
#openssl x509 -req -days 150 -in test-ca.req -extfile openssl.cfg -extensions v3_ca -signkey test-ca.key -out test-ca.crt
openssl x509 -req -days 150 -in test-ca.req  -extensions v3_ca -signkey test-ca.key -out test-ca.crt





