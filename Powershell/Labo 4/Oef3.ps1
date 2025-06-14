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

Welke cmdlet genereert tijd en datum? Welk type van object is dit?
Haal hieruit apart tijd en datum.

#>

Get-Date

Get-Date | Get-Member # => Method => GetObjectData

Get-Date | Select-Object -Property GetObjectData # => Definition => void ISerializable.GetObjectData

Get-Date -Format dd/MM/yyyy

Get-Date -Format HH:mm:ss
# Note : the slashes and double points are only estethic characters for the final 
# results and have nothing to do with the syntax

# Alternative method

Get-Date -DisplayHint Date

Get-Date -DisplayHint Time
