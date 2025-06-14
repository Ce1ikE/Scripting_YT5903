<#
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
                888P     Y888  "Y88P"  888     888  "Y88888 888
#>
<#

Bekijk welke mappen en bestanden er in je home directory zitten.
Schrijf dit weg in een bestand met de naam lab01_03.txt .

#>

# Because i don't want to use a absolute path 
# i use this command and variable to get the path of where the script is located
$Path = Split-Path $MyInvocation.MyCommand.Definition

$Content = Get-ChildItem -Path $Path -Recurse

# If the file "Lab01_03.txt" does not exisist execute this statement
if (!(Test-Path $Path/Lab01_03.txt))
{
    New-Item -Path $Path -Name Lab01_03.txt -ItemType file
}

$Content | Out-File -FilePath $Path # Not appended so original content is overwritten
