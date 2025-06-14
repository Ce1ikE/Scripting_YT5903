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

Vraag op welke processen er allemaal draaien op je computer. Sorteer deze op basis van hoeveel CPU ze gebruiken 
van hoog naar laag. Vervolgens zorg je ervoor dat je alleen de naam, cpu en vm (virtual memory) ziet.

#>


Get-Process | Sort-Object -Property CPU -Descending

Get-Process | Sort-Object -Property CPU -Descending | Select-Object -Property Name,CPU,VirtualMemorySize


