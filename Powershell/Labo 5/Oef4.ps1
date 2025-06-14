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

Kies een map in je bestandssysteem.
Maak een script dat van deze map een backup maakt. De eerste keer backup je alles, vanaf dan moet je enkel deze 
bestanden backuppen die veranderd werden sinds de vorige backup.
Maak in de backupmap ook een logfile aan waarin een timestamp staat van de backup samen met een lijst van files 
die op dat moment gebackupt werden.
#>

$Path = Split-Path $MyInvocation.MyCommand.Definition

# Create the backup directory
if (!(Test-Path -Path $Path/Backup)) 
{
New-Item -Path $Path -Name "Backup" -ItemType Directory
Get-ChildItem -Path $Path -File -Recurse |
Copy-Item -Destination $Path/Backup -ErrorAction Ignore
}

# Create the logfile
if (!(Test-Path -Path $Path/Backup/LogFile.txt)) 
{
New-Item -Path $Path/Backup -Name "LogFile.txt" -ItemType File
Get-Date -DisplayHint DateTime | Out-File -FilePath $Path/Backup/LogFile.txt -Append
Get-ChildItem -Path $Path -File -Recurse | Out-File -FilePath $Path/Backup/LogFile.txt -Append
}

$Backup = Get-ChildItem -Path $Path/Backup -File
$Original = Get-ChildItem -Path $Path -File
$Compare = Compare-Object -ReferenceObject $Original -DifferenceObject $Backup | Where-Object {$_.SideIndicator -eq "<="}
# Compare-Object -ReferenceObject $Original -DifferenceObject $Backup  | Get-Member # Side Indicator

if ($Compare)
{
    ForEach-Object -InputObject $Compare -Process {
    
        Copy-Item -Path "$Path/$($Compare.InputObject)" -Destination $Path/Backup

    }

    Get-Date -DisplayHint DateTime | Out-File -FilePath $Path/Backup/LogFile.txt -Append
    Get-ChildItem -Path "$Path/$($Compare.InputObject)" -File -Recurse | Out-File -FilePath $Path/Backup/LogFile.txt -Append
}


