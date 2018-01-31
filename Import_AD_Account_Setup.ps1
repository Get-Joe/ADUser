# A script by Get-Joe.
# (Please make it your own.)

# Pulls todays date.
$TodaysDate = (Get-Date)
# Sets an addtional time to disable the account if administrator action is not taken.
$DisabledIn = (7*2)
$ExpirationDate = ($TodaysDate).Adddays(+($DisabledIn))

# PLACEHOLDER FOR SCRIPT
# NOT STARTED YET
# WILL FILL LATER

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