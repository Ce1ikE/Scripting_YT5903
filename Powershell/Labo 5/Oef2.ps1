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

Schrijf een script dat alle processen opvraagt. Indien notepad niet open staat, laat dit script dan notepad openen. 
Druk dan opnieuw de lijst van processen af. Laat het script notepad opnieuw sluiten, maar vraag confirmatie van de 
gebruiker. 
#>

Get-Process

sleep -Seconds 5

if (!(Get-Process -Name notepad -ErrorAction Ignore))
{
Start-Process Notepad.exe
}

Get-Process

sleep -Seconds 5

Stop-Process Notepad.exe -Confirm


