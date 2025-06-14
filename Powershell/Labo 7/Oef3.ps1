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

Write a script with a function that simulates the rolling of 2 dice. Rolling 2 dice always results in a value between 2 
and 12. How many times will every possible value occur if the dice are rolled 400 times? 
- first create a function that will simulate the rolling of dice make it possible to give a parameter with how many 
dice you want to roll. The default is 2 dice (1 dice returns value from 1-6, 2 dice returns a random value between 2-
12, ...) 
- create an array to keep the occurrences forevery possible value
- call the rolling function 400 times for 2 dices and store how many times each value occured
- print how many times each value occured.
- print a horizontal bar chart with the occurrences. Use the symbol “#” to draw the bars.

Bonus: Try 2 different algoritms for the rolling function and compare them: 
1) generate random value between 1-6, 2-12, 3-18, …
2) always generate value between 1-6 but do this 1,2,3,… times for each dice and add them up.
#>

# Answer => 1st algorithm uniformly distributed
#        => 2nd algorithm normal distribution

<#
    .SYNOPSIS

    .DESCRIPTION

    .PARAMETER Dices_Rolled

    .PARAMETER Number_of_roles

    .EXAMPLE

    .EXAMPLE

#>
function Get-RollingDiceECVersion
{
    param
    (
    [parameter(Mandatory=$True)][int]$Dices_Rolled=2,
    [parameter(Mandatory=$True)][int]$Number_of_roles=400  
    
    )
    begin
    {
    Write-Host "This stimulates the rolling of $Dices_Rolled Dices´n´n"
    $Range = $Dices_Rolled*6-$Dices_Rolled
    }


    process
    {
        $DiceValues1 = @(0..$Range);
        $DiceValues2 = @(0..$Range);

        for ($i = 0; $i -lt $Range; $i++)
        {
        $DiceValues1[$i] = 0;

        $DiceValues2[$i] = 0;

        }

        for ($n = 0 ; $n -lt $Number_of_roles ; $n++)
        {

        $Roll_all_dices = Get-Random -Minimum $Dices_Rolled -Maximum $($Dices_Rolled*6) # Generate a random number in the range [#of dices ; #of dices*6]
        $DiceValues1[$($Roll_all_dices - $Dices_Rolled)] += 1;

            for ($q = 0; $q -lt $Dices_Rolled; $q++)
            {
            $Roll_one_dice = Get-Random -Minimum 1 -Maximum 6
            $Sum = $Sum + $Roll_one_dice;
            
            }
            $DiceValues2[$($Sum - $Dices_Rolled)] += 1;
            $Sum = 0;
        }
    }

    end
    {
    $Esc=[char]0x1b;
    Write-Host "Number of Occurences First algorithm"

        for ($m = 0 ; $m -lt $Range ; $m++ )
        {
        Write-Host "$($m+$Dices_Rolled) " -NoNewline
        
            for ($r = 0 ; $r -lt $DiceValues1[$m] ; $r++)
            {

            Write-Host "#" -NoNewline -BackgroundColor Green

            }
            write-Host "`n"
        }

       Write-Host "`n`nNumber of Occurences Second algorithm"
         for ($m = 0 ; $m -lt $Range ; $m++ )
        {
        Write-Host "$($m+$Dices_Rolled) " -NoNewline
        
            for ($r = 0 ; $r -lt $DiceValues2[$m] ; $r++)
            {

            Write-Host "#" -NoNewline -BackgroundColor DarkRed

            }
            write-Host "`n"
        }

    }


}