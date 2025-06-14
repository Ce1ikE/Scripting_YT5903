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

Schrijf een script dat 10 random getallen genereert tussen 0 en 100. Schrijf deze random getallen weg naar een file. 
Geef daarna alle getallen weer die groter zijn dan 50.
Wanneer je je script opnieuw uitvoert, moeten de getallen uit de file overschreven worden.

#>


# Not a absolute path but the path of the location where the script is in the filesystem
$Path = Split-Path $MyInvocation.MyCommand.Definition

$Array = @()

for ($i = 0;$i -le 10;$i++)
{
$Array += Get-Random -Maximum 100 -Minimum 0
}


if (!(Test-Path -Path $Path/TestRandom.txt))
{
New-Item -Path $Path -Name "TestRandom.txt" -ItemType file
}

$Array | Out-File -FilePath $Path/TestRandom.txt -Force

