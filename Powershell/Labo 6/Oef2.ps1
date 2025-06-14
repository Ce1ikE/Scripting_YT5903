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

Write a powershell function that calculates the power of a number, the number is passed as a parameter and 
should also be accepted from the pipeline. The power is also passed as a parameter and has a default value of 2.
#>
<#
    .SYNOPSIS
        Calculates the power of any given integer

    .DESCRIPTION
        function that calculates the power of a number (integer)
        The power has a default value of 2
        The use of 'convertTo-power' followed by 'x' and 'y' will result in a 
        mathematical operation where 'x' is multiplies itself 'y' times by itself.

    .PARAMETER base 
        The base of the operation showing wich number will multiply itself
    
     .PARAMETER exp 
        The exponent which indicates how many times the base multiplies itself by itself 

    .EXAMPLE
        ---- EXAMPLE 1 ----

        convertTo-power 4 3
        64

        Of course we can declare the options.
     
        convertTo-power -base 4 -exp 3
        81

    .EXAMPLE
        ---- EXAMPLE 2 ----
        You can also pipe the result of one operation  to the function.
        The value that is piped will be used as the base.

        4 + 3 | convertTo-power
        49

        The first result before the pipe operation yields 7 afterwards it is
        piped to the function. Because the default exponent value is 2 the 
        result will yield 7*7 = 49
        However it is not possible to pipe a value and put another value as argument 
        without adding the right parameter name

        5 + 5 | convertTo-power 3

        will result in a error rather use this

        5 + 5 | convertTo-power -exp 3
        1000

    .EXAMPLE
        ---- EXAMPLE 3 ----
        You can also pipe one result from the function into the same function

        convertTo-power -base 2 -exp 3 | convertTo-power -exp 4
        4096

        Or store the result into a variable

        $Var = convertTo-power -base 15
        $var
        225
    
        Or include it into operations

        (convertTo-power 15) * 3 + 3 + (convertTo-power 5)
        703
#>
function convertTo-power
{

    param
    (
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)][int]$base,
    [parameter(Mandatory=$false)][int]$exp = 2
    )
    process
    {
            
        $base_stored = 1;
        
        for($i = 0 ;$i -lt $exp ;$i++)
        {

            $base_stored = $base_stored*$base;
        } 

       echo $base_stored
    }
    
}