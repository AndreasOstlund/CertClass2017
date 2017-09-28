certutil -setreg CA\CRLPublicationURLs "65:%WINDIR%\system32\CertSrv\CertEnroll\%3%8%9.crl\n79:ldap:///CN=%7%8,CN=%2,CN=CDP,CN=Public Key Services,CN=Services,%6%10\n6:http://www.pki.labb/pki/%3%8%9.crl"

certutil -setreg CA\CACertPublicationURLs "1:%WINDIR%\system32\CertSrv\CertEnroll\%3%4.crt\n2:ldap:///CN=%7,CN=AIA,CN=Public Key Services,CN=Services,%6%11\n2:http://www.pki.labb/pki/%3%4.crt"

certutil -setreg CA\AuditFilter 127

net stop certsvc
net start certsvc

