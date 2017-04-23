$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''
$VariableHere = Read-Host -Prompt ''

New-ADUser -



New-ADUser [-Name] <string> [-AccountExpirationDate <System.Nullable[System.DateTime]>] [-AccountNotDelegated <System.Nullable[bool]>] [-AccountPassword <SecureString>] [-AllowReversiblePasswordEncryption <System.Nullable[bool]>] [-AuthType {Negotiate | Basic}] [-CannotChangePassword <System.Nullable[bool]>] [-Certificates <X509Certificate[]>] [-ChangePasswordAtLogon <System.Nullable[bool]>] [-City <string>] [-Company <string>] [-Country <string>] [-Credential <PSCredential>] [-Department <string>] [-Description <string>] [-DisplayName <string>] [-Division <string>] [-EmailAddress <string>] [-EmployeeID <string>] [-EmployeeNumber <string>] [-Enabled <System.Nullable[bool]>] [-Fax <string>] [-GivenName <string>] [-HomeDirectory <string>] [-HomeDrive <string>] [-HomePage <string>] [-HomePhone <string>] [-Initials <string>] [-Instance <ADUser>] [-LogonWorkstations <string>] [-Manager <ADUser>] [-MobilePhone <string>] [-Office <string>] [-OfficePhone <string>] [-Organization <string>] [-OtherAttributes <hashtable>] [-OtherName <string>] [-PassThru <switch>] [-PasswordNeverExpires <System.Nullable[bool]>] [-PasswordNotRequired <System.Nullable[bool]>] [-Path <string>] [-POBox <string>] [-PostalCode <string>] [-ProfilePath <string>] [-SamAccountName <string>] [-ScriptPath <string>] [-Server <string>] [-ServicePrincipalNames <string[]>] [-SmartcardLogonRequired <System.Nullable[bool]>] [-State <string>] [-StreetAddress <string>] [-Surname <string>] [-Title <string>] [-TrustedForDelegation <System.Nullable[bool]>] [-Type <string>] [-UserPrincipalName <string>] [-Confirm] [-WhatIf] [<CommonParameters>]

Get-ADUser | Export-Csv

$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$Username = "sending.user@domain.com"
$Password = "password"

$to = "recipient.user@domain.com"
$cc = "ccrecipient.user@domain.com"
$subject = "Subject Line"
$body = "Information in email"
$attachment = "C:\Folder\File.csv"

$message = New-Object System.Net.Mail.MailMessage
$message.subject = $subject
$message.body = $body
$message.to.add($to)
$message.cc.add($cc)
$message.from = $username
$message.attachments.add($attachment)

$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
$smtp.send($message)