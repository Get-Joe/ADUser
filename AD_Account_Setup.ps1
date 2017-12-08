# A script by Get-Joe.
# (Please make it your own.)

# Pulls todays date.
$TodaysDate = (Get-Date)
# Sets an addtional time to disable the account if administrator action is not taken.
$DisabledIn = (7*2)
$ExpirationDate = (Get-Date).Adddays(+($DisabledIn))

# For any of the following variables, create the variables listed with a constant from Administrators responce.

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
$Office = Read-Host -Prompt 'Enter Office name here.'
$Organization = Read-Host -Prompt 'Enter Organization here.'
$OtherName = Read-Host -Prompt 'Enter nick-name here.'
$Path = Read-Host - Prompt 'Enter Path to current user OU.'
$ProfilePath = Read-Host - Prompt 'Enter C:\ drive profile path location.'
$ScriptPath = Read-Host -Prompt 'Enter logon scrip path location.'
$State = Reat-Host -Prompt 'Enter state located in.'
$StreetAddress = Read-Host -Prompt 'Enter street address for user.'
$Title = Read-Host -Prompt 'Enter job title here.'

# Format as follows:
# $VariableHere = Read-Host -Prompt 'Enter request statement here.'

New-ADUser -Name $FirstName.$LastName -AccountExpirationDate $ExpirationDate -AccountPassword $TempPassword -ChangePasswordAtLogon $true -City $City -Company $CompanyName -Country $CountryName -Department $Department -Description $Description -DisplayName $FirstName.$LastName -Division $DivisionName -EmailAddress "$FirstName.$LastName@$EmailDomainName" -Enabled $true -GivenName $FirstName -HomeDirectory $HomeDirectoryPath\$FirstName.$LastName -HomeDrive $HomeDriveLetter -Initials $MiddleInitial -Manager $Manager -Office $Office -Organization $Organization -OtherName $OtherName -PasswordNeverExpires $false -PasswordNotRequired $false -Path $Path -PostalCode $PostalCode -ProfilePath $ProfilePath -SamAccountName $FirstName.$LastName -ScriptPath $ScriptPath -State $State -StreetAddress $StreetAddress -Surname $LastName -Title $Title

# Creating the home drive is not completed durring account creation with powershell.
# This is to create and adjust the security settings of the user's home directory.

New-Item -ItemType Directory -Path $HomeDirectoryPath\$FirstName.$LastName

# Exports to CSV.
# Correct path to export to.

Get-ADUser -Name $FirstName.$LastName | Export-Csv -Path "C:\Folder\File.csv"

# Following is set up for gmail domian. Additional SMTP Forwarding for other email applications require changes.

$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"

# Sender email name.

$Username = "sending.user@domain.com"

# Suggest provide secure string in place of SMTP username password.

$Password = "password"

## Creation of email with variables.

# Suggest manager email.

$to = "recipient.user@domain.com"

# Suggest user email.

$cc = "ccrecipient.user@domain.com"

# Suggest static line.

$subject = "Subject Line"

# Suggest pulling in variables to create body of email.

$body = "Information in email"

# Location of .csv to attach to email.

$attachment = "C:\Folder\File.csv"

# Pull variable information in to create email.

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