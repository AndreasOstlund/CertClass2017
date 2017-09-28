#!/bin/sh

# skapa självsignerat servercertifikat
openssl req -x509 -sha256 -days 365 -newkey rsa:1024 -keyout hostkey.pem -nodes -out hostcert.crt




