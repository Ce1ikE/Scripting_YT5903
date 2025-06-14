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

Schrijf een commando dat van de map “Mijn Documenten” en al zijn submappen lijsten genereerd met daarin 
bestanden van een bepaald type (bv pdf, mp3, mkv, docx, ...). Deze lijsten moeten worden weggeschreven naar een 
tekstbestand.
Maak gebruik van het pipe-symbool (|)

#>

# You can switch "$Path" with you documents folder if you wish
# currently the "$Path" variable == location of script

$Path = Split-Path $MyInvocation.MyCommand.Definition
$Extension = "pdf"
$Content = Get-ChildItem -Path $Path/*.$Extension -Recurse

New-Item -Path $Path -Name "Extensions.txt" -ItemType file 

Out-File -FilePath "$Path/Extensions.txt" -Append


