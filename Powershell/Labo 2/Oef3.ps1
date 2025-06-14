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

Zoek uit hoe je alles wat je in de commandline typt en alle output hiervan naar een tekstbestand kan wegschrijven. 
Bekijk alle cmdlets die hiervoor gebruikt worden. Je kan op het einde dit bestand ook afsluiten met een cdmlet. 
Moet dit altijd gebeuren?
Gebruik dit voor de rest van dit labo.
#>

$Path = Split-Path $MyInvocation.MyCommand.Definition

Start-Transcript -Path $Path/TestTranscript.txt

Stop-Transcript

# Moet dit altijd gebeuren? => No

#DESCRIPTION
#    The `Stop-Transcript` cmdlet stops a transcript that was started by the `Start-Transcript` cmdlet. Alternatively, y
#    ou can end a session to stop a transcript.

