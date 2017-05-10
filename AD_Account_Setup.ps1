$TodaysDate = (Get-Date)
$DisabledIn = (7*2)
$ExpirationDate = (Get-Date).Adddays(+($DisabledIn))

# For any of the following variables, replace everything past the "=" with a constant for all new users.

$FirstName = Read-Host -Prompt 'Enter First Name here.'
$LastName = Read-Host -Prompt 'Enter Last Name here.'
$MiddleInitial = Read-Host -Prompt 'Enter Middle initial here.'
$TempPassword = Read-Host -Prompt 'Enter temporary password for user here.'
$Department = Read-Host -Prompt 'Enter department here.'
$Description = Read-Host -Prompt 'Enter description here.'
$Manager = Read-Host -Prompt 'Enter Manager AD name here.'
$City = Read-Host -Prompt 'Enter City here.'
$CompanyName = Read-Host -Prompt 'Enter Company Name here.'
$CountryName = Read-Host -Prompt 'Country user is in.'
$EmailDomainName = Read-Host -Prompt 'Enter your companies email domain. Everything after the "@" symbol.'
$DivisionName = Read-Host -Prompt 'Enter Division Name here.'
$PostalCode = Read-Host -Prompt 'Enter Postal Code here.'
$HomeDirectoryPath = Read-Host -Prompt 'Full file share path excluding user specific folder'
$HomeDriveLetter = Read-Host -Prompt 'Drive used to map user home drive.'


$VariableHere = Read-Host -Prompt 'Enter request statement here.'

New-ADUser -Name $FirstName.$LastName -AccountExpirationDate $ExpirationDate -AccountPassword $TempPassword -ChangePasswordAtLogon $true -City $City -Company $CompanyName -Country $CountryName -Department $Department -Description $Description -DisplayName $FirstName.$LastName -Division $DivisionName -EmailAddress $FirstName.$LastName@$EmailDomainName -Enabled $true -GivenName $FirstName -HomeDirectory $HomeDirectoryPath\$FirstName.$LastName -HomeDrive $HomeDriveLetter -Initials $MiddleInitial [-Instance <ADUser>] -Manager $Manager [-Office <string>] [-Organization <string>] [-OtherName <string>] [-PassThru <switch>] -PasswordNeverExpires $false -PasswordNotRequired $false [-Path <string>] -PostalCode $PostalCode [-ProfilePath <string>] -SamAccountName $FirstName.$LastName [-ScriptPath <string>] [-ServicePrincipalNames <string[]>] [-State <string>] [-StreetAddress <string>] -Surname $LastName [-Title <string>] [-Type <string>] [-UserPrincipalName <string>] [-WhatIf]

# Creating the home drive is not completed durring account creation with powershell.
# This is to create and adjust the security settings of the user's home directory.

New-Item -ItemType Directory -Path $HomeDirectoryPath\$FirstName.$LastName



Get-ADUser -Name $FirstName.$LastName | Export-Csv

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