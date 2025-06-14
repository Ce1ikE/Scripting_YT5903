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

Bekijk of er een alias bestaat voor Get-Help en Get-Command. Indien niet, maak deze dan aan.
Vergeet er niet voor te zorgen dat deze aliassen ook volgende labo’s nog gebruikt kunnen worden.

#>

$Path = Split-Path $MyInvocation.MyCommand.Definition

Get-Alias |  Where-Object -Property ReferencedCommand -Like "Get-Help" # Alias => No

New-Alias -Name gh

Export-Alias -Path $Path

#DESCRIPTION
#    The `Export-Alias` cmdlet exports the aliases in the current session to a file. If the output file does not exist,
#    the cmdlet will create it.


Get-Alias |  Where-Object -Property ReferencedCommand -Like "Get-Command" # Alias => Yes


