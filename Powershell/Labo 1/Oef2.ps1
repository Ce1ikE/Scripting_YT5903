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

Navigeer naar je documenten folder en creëer hierin een nieuwe map voor alle scripting labo’s met hierin een map 
voor deze eerste labo sessie.
#>

# Because i don't want to use a absolute path 
# i use this command and variable to get the path of where the script is located
$Path = Split-Path $MyInvocation.MyCommand.Definition

Set-Location -Path $Path

New-Item -Path $Path -Name TestFolderEX2 -ItemType Directory


