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

Kies een map in je bestandssysteem waarin verschillende soorten documenten staan (bv .txt, .pdf, .docx, ...).
Ga van elk bestand na welk soort bestand dit is. Dit kan je doen aan de hand van de extensie. Maak voor elk soort 
bestand een nieuwe map aan en kopieer de juiste bestanden hiernaar
#>


$Path = Split-Path $MyInvocation.MyCommand.Definition

$Extension = @()

# Get-ChildItem | Get-Member # => Property => Extension

$Extension = Get-ChildItem -Path $Path -Recurse | Group-Object -Property Extension | Select-Object -Property Name

for ($i = 0;$i -lt $Extension.Length;$i++)
{
    if(!(Test-Path -Path "$Path/$($Extension[$i].Name)"))
    {
        New-Item -Path $Path -Name "$($Extension[$i].Name)" -ItemType Directory
    }

    Get-ChildItem -Path $Path -Recurse "*$($Extension[$i].Name)" -Exclude "$($Extension[$i].Name)" |
    Copy-Item -Destination "$Path/$($Extension[$i].Name)" -ErrorAction Ignore
}




