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

Schrijf een functie die controleert of je een internetconnectie hebt. Deze functie print enkel 1 of 0 als er wel of 
geen internetconnectie is. 
De functie aanvaard ook een parameter waar je het ip-adres of url aan kan meegeven waartegen moet worden 
getest de default waard van deze parameter is 1.1.1.1
Write a function that check if you have an internet connection. This function wil only print 1 or 0 depending on the 
internet connection.
The function also accepts a parameter that can be used to pass an ip address or url, if no parameter was past the 
default value 1.1.1.1 is used.
HINT: connection
#>

    

<#
    .DESCRIPTION
        The function tests if there is an internet connection present or not.
        If there is a internet connection the return is 1.
        If there is no internet connection the return value is 0.

    .PARAMETER Address
        Is the IP address or the url where the function ping's to.
        The default value of this parameter is 1.1.1.1
S
#>
Function Test-ConnectionEC
{
    param
    (
    [parameter(Mandatory=$false,ParameterSetName="Address")][string]$IP_url="1.1.1.1"
    )

    begin
    {
    Write-Host -BackgroundColor Blue "Checking connection..."
    sleep -Seconds 2
    }
    process
    {
        $Test = Test-NetConnection -TraceRoute $IP_url -InformationLevel Quiet -WarningAction SilentlyContinue |
        Select-Object -Property PingSucceeded
        # "Test-NetConnection" returns a property named "PingSucceeded" which can be either "true" or "false"
        # We added the options "InformationLevel" and "WarningAction" so no information and warning is displayed
        # We finally pipe the result to the cmdlet "Select-Object" so we can obtain our desired property 
    }
    end
    {
        if("$Test" -eq "True") # Check the return value of our function
        {
            Write-Host -BackgroundColor Green "`n`n`n 1 `n`n"
        }
        else
        {
            Write-Host -BackgroundColor Red "`n`n`n 0 `n`n"
        }
        sleep -Seconds 2
    }
}