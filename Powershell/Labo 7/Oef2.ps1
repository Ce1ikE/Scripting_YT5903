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

Write a scripts that first asks the user to enter an integer number.
Afterwards more integers are asked until the sum of those integers
equals or exceeds the first number entered.
#>


function Start-GameEC
{
    $Limit = Read-Host -Prompt "Enter the limit"
    $i = 0;


    while($i -lt $Limit)
    {

    $m = Read-Host -Prompt "Enter an integer number"
    $i = $i + $m 


    }

    Write-Host "the limit of $limit is reached or exceeded"

}