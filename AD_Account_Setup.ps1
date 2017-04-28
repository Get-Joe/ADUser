$TodaysDate = (Get-Date)
$DisabledIn = (7*2)
$ExpirationDate = (Get-Date).Adddays(+($DisabledIn))




$FirstName = Read-Host -Prompt 'Enter First Name here.'
$LastName = Read-Host -Prompt 'Enter Last Name here.'
$MiddleInitial = Read-Host -Prompt 'Enter Middle initial here.'
$TempPassword = Read-Host -Prompt 'Enter temporary password for user here.'
$Department = Read-Host -Prompt 'Enter department here.'
$Description = Read-Host -Prompt 'Enter description here.'
$Manager = Read-Host -Prompt 'Enter Manager here.'

$VariableHere = Read-Host -Prompt ''

New-ADUser [-Name] <string> [-AccountExpirationDate <System.Nullable[System.DateTime]>] -AccountPassword $TempPassword -ChangePasswordAtLogon $true [-City <string>] [-Company <string>] [-Country <string>] -Department $Department -Description $Description [-DisplayName <string>] [-Division <string>] -EmailAddress $FirstName.$LastName@CHANGEDOMAIN.COM -Enabled $true [-GivenName <string>] [-HomeDirectory <string>] [-HomeDrive <string>] [-HomePage <string>] [-Initials <string>] [-Instance <ADUser>] -Manager $Manager [-Office <string>] [-Organization <string>] [-OtherName <string>] [-PassThru <switch>] -PasswordNeverExpires $false -PasswordNotRequired $false [-Path <string>] [-PostalCode <string>] [-ProfilePath <string>] [-SamAccountName <string>] [-ScriptPath <string>] [-ServicePrincipalNames <string[]>] [-State <string>] [-StreetAddress <string>] -Surname $LastName [-Title <string>] [-Type <string>] [-UserPrincipalName <string>] [-WhatIf]

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

Write-Host -Foregroundcolor Green "Email sent."