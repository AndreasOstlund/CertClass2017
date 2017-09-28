#!/bin/sh

cat << 'EOF' > extensionfile.cfg
[ server_cert ]
basicConstraints=CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage= clientAuth, serverAuth
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid,issuer
crlDistributionPoints=URI:http://pki100.bitrymden.com/pki100.crl
EOF

cp ../labb2/server.csr .
cp ../labb2/server.key .

# skapa certifikatet
openssl x509 -req -days 365 -in server.csr -CA ../labb1/ca.crt -CAkey ../labb1/ca.key -set_serial 0x124 -extfile extensionfile.cfg -extensions server_cert -out server2.crt


# kolla på certifikatet
openssl x509 -noout -text -in server2.crt


############################################################3



cat << 'EOF' > extensionfile2.cfg
[ server_cert ]
basicConstraints=CA:FALSE
keyUsage = digitalSignature, keyEncipherment
extendedKeyUsage= clientAuth
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid,issuer
crlDistributionPoints=URI:http://pki100.bitrymden.com/pki100.crl
EOF


openssl x509 -req -days 365 -in server.csr -CA ../labb1/ca.crt -CAkey ../labb1/ca.key -set_serial 0x124 -extfile extensionfile2.cfg -extensions server_cert -out server3.crt


