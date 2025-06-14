Write-Host -ForegroundColor Yellow '
                888    888          888 888                    
                888    888          888 888                    
                888    888          888 888                    
                8888888888  .d88b.  888 888  .d88b.            
                888    888 d8P  Y8b 888 888 d88""88b           
                888    888 88888888 888 888 888  888           
                888    888 Y8b.     888 888 Y88..88P           
                888    888  "Y8888  888 888  "Y88P"            
                                               
                                               
                                               
                888       888                  888      888 888
                888   o   888                  888      888 888
                888  d8b  888                  888      888 888
                888 d888b 888  .d88b.  888d888 888  .d88888 888
                888d88888b888 d88""88b 888P"   888 d88" 888 888
                88888P Y88888 888  888 888     888 888  888 Y8P
                8888P   Y8888 Y88..88P 888     888 Y88b 888  " 
                888P     Y888  "Y88P"  888     888  "Y88888 888 '

<# Assignement:

Write a script that ask the user which file it should parse as data input. An example is provided in the zip: data.csv. 
If the file doesn’t exist or can’t be parsed the script will catch the errors and write an appropriate message instead 
of showing the red powershell error messages. After parsing the data script will add a folder as stated in the folder 
column for each row in the file in the current directory. It will also write to a logfile if it could/couldn’t create the 
directory together the first, lastname and folder
#>

$Path = Split-Path $MyInvocation.MyCommand.Definition

# We vragen eerst welk bestand de user wildt importeren
[string]$bestand = Read-Host -Prompt "`n`nWelk bestand wildt u importeren?"
$Locatie = Get-ChildItem -Path "$Path/" -Include *$bestand* -Recurse
$Bestaat = 1;
while ($Locatie.Count -gt 2)
{
# Geeft een lijst van alle bestanden met naam $bestand
echo "-----------------------------------"
$Locatie.Name 
echo "-----------------------------------"

# Vraag opnieuw de user moet specifieker zijn
$bestand = Read-Host -Prompt "`n`nHebben meerdere bestanden gevonden`n`nWelk van deze bestanden wildt u importeren?"
$Locatie = Get-ChildItem -Path $Path -Include *$bestand* -Recurse
}

# In geval van Error 
try
{
Get-Content $bestand -ErrorAction Stop
}
catch
{
$Bestaat = 0;
Write-Host "`n`n`t`t!!Bestand bestaat niet!!"
$PathToLogFile = "$Path\LogFile.txt"
    if (-not(Test-Path $PathToLogFile))
    {
    New-Item -Path "$Path" -ItemType File -Name "LogFile.txt"
    }
    $date = Get-Date -DisplayHint DateTime
    echo "Kon $bestand niet vinden op $date" | Out-File -FilePath $PathToLogFile -Append
}
finally
{
 
}

# In geval van geen Error

if ($Bestaat = 1)
{
    $Data = Import-Csv -Path "$Path/$Bestand"

    foreach($Element in $Data)
    {
        New-Item -Path "$Path" -ItemType Directory -Name $Element.folder
        $PathToLogFile = "$Path\LogFile.txt"
            if (-not(Test-Path $PathToLogFile))
            {
                New-Item -Path "$Path" -ItemType File -Name "LogFile.txt"
            }
        $date = Get-Date -DisplayHint DateTime
        echo "heb aangemaakt: $date $($Element.folder) $($Element.Firstname) $($Element.Lastname) " | Out-File -FilePath $PathToLogFile -Append
    }

}
