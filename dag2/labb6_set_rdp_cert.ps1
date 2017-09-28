$cert = dir Cert:\LocalMachine\my | ? { $_.Subject -like 'CN=member03*'}
$cert.Thumbprint

& wmic /namespace:\\root\CIMv2\TerminalServices PATH Win32_TSGeneralSetting Set SSLCertificateSHA1Hash="$($cert.Thumbprint.ToString())"



# wmic /namespace:\\root\CIMv2\TerminalServices PATH Win32_TSGeneralSetting Set SSLCertificateSHA1Hash="xxxxxxxx"
