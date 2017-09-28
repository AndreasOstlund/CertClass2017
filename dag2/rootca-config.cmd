
certutil -setreg ca\DSConfigDN "CN=Configuration,DC=pki,DC=labb"
certutil -setreg CA\CRLPeriodUnits 6
certutil -setreg CA\CRLPeriod "Months"
certutil -setreg CA\CRLDeltaPeriodUnits 0
certutil -setreg ca\ValidityPeriodUnits 10
certutil -setreg ca\ValidityPeriod "Years"

certutil -setreg CA\CRLPublicationURLs "1:%WINDIR%\system32\CertSrv\CertEnroll\%3%8%9.crl\n2:http://www.pki.labb/pki/%3%8%9.crl\n10:ldap:///CN=%7%8,CN=%2,CN=CDP,CN=Public Key Services,CN=Services,%6%10"
certutil -setreg CA\CACertPublicationURLs "1:%WINDIR%\system32\CertSrv\CertEnroll\%3%4.crt\n2:http://www.pki.labb/pki/%3%4.crt\n2:ldap:///CN=%7,CN=AIA,CN=Public Key Services,CN=Services,%6%11"
certutil -setreg CA\AuditFilter 127
certutil -setreg policy\EnableRequestExtensionlist "+2.5.29.32"

net stop certsvc
net start certsvc

