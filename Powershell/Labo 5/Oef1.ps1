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

Schrijf een script dat 10 random getallen genereert. Stockeer deze getallen in een array.
Sorteer daarna de array van klein naar groot en druk de getallen boven 50 af.
Schrijf de gesorteerde data weg naar een file.
#>

$Path = Split-Path $MyInvocation.MyCommand.Definition


$Array = @()
for ($i = 0;$i -le 10;$i++)
{
$Array += Get-Random -Maximum 150 -Minimum 0
}

#$Array | Get-Member

if (!(Test-Path -Path $Path/TestRandom.txt))
{
New-Item -Path $Path -Name "TestRandom.txt" -ItemType file
}

$Array | Sort-Object -Descending | Where-Object {$_ -gt 50} | Out-File -FilePath $Path/TestRandom.txt
