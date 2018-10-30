# A script by Get-Joe.
# (Please make it your own.)

# Pulls todays date.
$TodaysDate = (Get-Date)
# Sets an addtional time to disable the account if administrator action is not taken.
$DisabledIn = (7*2)
$ExpirationDate = ($TodaysDate).Adddays(+($DisabledIn))

# PLACEHOLDER FOR SCRIPT
# WILL COMPLETE IN TIME

# Correct list in ("header") to match what is available in your *.csv.
$ImportADUser = (Import-Csv C:\csvname.csv<span> </span>-header ("firstname","lastname","middleinitial","temppassword","department","description","manager","city","companyname","countryname","emaildomainname","divisionname","postalcode","homedirectorypath","homedriveletter","office","organization","othername","path","profilepath","scriptpath","state","streetaddress","title")

ForEach-Object ($row in $ImportADUser){
    # Correct $row.(Whatever is listed after) to match the *.csv header.
    # Correct the above headers to match what is availible in the *.csv.
    $FirstName = $row.firstname # As always can be set to a static value.
    $LastName = $row.lastname # As always can be set to a static value.
    $MiddleInitial = $row.middleinitial # As always can be set to a static value.
    $TempPassword = $row.temppassword # As always can be set to a static value.
    $Department = $row.department # As always can be set to a static value.
    $Description = $row.description # As always can be set to a static value.
    $Manager = $row.manager # As always can be set to a static value.
    $City = $row.city # As always can be set to a static value.
    $CompanyName = $row.companyname # As always can be set to a static value.
    $CountryName = $row.countryname # As always can be set to a static value.
    $EmailDomainName = $row.emaildomainname # As always can be set to a static value.
    $DivisionName = $row.divisionname # As always can be set to a static value.
    $PostalCode = $row.postalcode # As always can be set to a static value.
    $HomeDirectoryPath =  $row.homedirectorypath # As always can be set to a static value.
    $HomeDriveLetter =  $row.homedriveletter # As always can be set to a static value.
    $Office = $row.office # As always can be set to a static value.
    $Organization = $row.organization # As always can be set to a static value.
    $OtherName = $row.othername # As always can be set to a static value.
    $Path = $row.path # As always can be set to a static value.
    $ProfilePath = $row.profilepath # As always can be set to a static value.
    $ScriptPath = $row.scriptpath # As always can be set to a static value.
    $State = $row.state # As always can be set to a static value.
    $StreetAddress = $row.streetaddress # As always can be set to a static value.
    $Title = $row.title # As always can be set to a static value.

}

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

Write -Foregroundcolor Green "Email sent."