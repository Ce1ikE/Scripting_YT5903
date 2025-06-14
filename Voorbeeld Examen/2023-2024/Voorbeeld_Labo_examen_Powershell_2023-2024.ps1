<#
    .SYNOPSIS
        Filters files from a directory
        based on a chosen extension by the user 
    .DESCRIPTION
        Not available
    .PARAMETER Extension
        Extension of the file you wish to filter with
    .PARAMETER Path_To_Dir
        Path to the directory which contains the files
        you wish to filter on
    .EXAMPLE
        .txt | Use-FilterCE
        
        Filters on the files with a ".txt" extension 
        in the current location  

    .EXAMPLE
        Use-FilterCE -Extension .pdf -Path_To_Dir ./Path/To/Test

        Filters on the files with a ".pdf" extension 
        in the "/test" directory 

#>
function Use-FilterCE
{
    param
    (
    [parameter(Mandatory=$true,ValueFromPipeline=$true)][string]$Extension,
    [parameter(Mandatory=$false)][string]$Path_To_Dir="." # Default value is the current directory
    )

    if(Test-Path $Path_To_Dir) # See if the original directory exists
    {
        $Path_To_Log = "$Path_To_Dir/../.."
        if(!(Test-Path -Path "$Path_To_Log/log.txt")) # Check if the logfile exists
        {
            New-Item -Path $Path_To_Log -Name "log.txt" -ItemType File # If not create the logfile
        }
        Get-ChildItem -Path $Path_To_Dir | Where-Object -Property Extension -Like $Extension | #=> See Pipline
        Out-File -FilePath "$Path_To_Log/log.txt" -Append # Get all items from the directory and filter with the extension then write everything to a file
        # The log file is contantly overwritten if you don't want to overide add "-append"
    }
    else
    {
        Write-Host -BackgroundColor Red "The given directory does not exist"
    }
}

# Execute the function above for each folder in "Example"
$path = Split-Path $MyInvocation.MyCommand.Definition # Takes the path from where the script is executed
$Amount_Of_Folders = @(Get-ChildItem -Path "$path/Example(Test voor Powershell)") #Amount_Of_Folders is a array of objects
$Extension = ".pdf" # Choose you filter
foreach($el in $($Amount_Of_Folders | Select-Object -Property FullName )) {
    Use-FilterCE -Path_To_Dir "$($el.FullName)" -Extension $Extension 
}