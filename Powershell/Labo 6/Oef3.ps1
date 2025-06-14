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

Write a function that filters a certain type of files (.txt, .pdf, .docx, …).
The function has 4 parameters.
• The extension of the files that have to be filtered. This one is mandatory and an be provided through the 
pipeline.
• A folder in which the files can be found. This one is mandatory.
• A folder to which the files can be copied. This one is optional.
• A parameter to tell the function to create the copy. This is an optional switch parameter.
Write help for the function to be able to call this through the Get-Help cmdlet
#>


<#
    .SYNOPSIS
        The function "Find-ExtensionEC" searches for files with certain extensions 
        in a given directory.
    
    .DESCRIPTION
        The function "Find-ExtensionEC" enables to search for files with extensions,
        provided by the user, in a directory, also provided by the user. More so
        the function can also copy the files with a specific extension and create a
        directory for each and copy the files to their respective file. 
    
    .PARAMETER Extension
        This parameter is mandatory. This parameter contains the extensions
        for which the function should search for.
    
    .PARAMETER Directory
        This parameter is mandatory. This parameter contains the location in
        the filesystem from where the function should search for.
    
    .PARAMETER CopyTo
        This parameter is optional. This parameter contains the destination directory where the files
        should becopied to.
    
    .PARAMETER EnableCopy
        This parameter is optional. This parameter is a switch parameter
        that tells the function to make the copy.
    
    .EXAMPLE
    

    .EXAMPLE


#>
function Find-ExtensionEC
{
    param
    (
    [parameter(Mandatory=$true,ValueFromPipeline=$true)][string]$Extension,
    [parameter(Mandatory=$true)][string]$Directory,
    [Parameter(Mandatory=$false)][string]$CopyTo,
    [Parameter(Mandatory=$false)][switch]$EnableCopy 
    # For information about parameters and especially switch parameters see => "get-help about_Functions_Advanced_Parameters"
    )

    begin
    {
        Write-Host -BackgroundColor DarkMagenta "Searching..."
        sleep -Seconds 2
    }

    process # Search for the defined extensions
    {
        for ($i = 0;$i -lt $Extension.Length;$i++)
        {
            Write-Host "Files : $($Extension[$i].Name)"
            Get-ChildItem -Path $Directory -Recurse "*$($Extension[$i].Name)" -File
        }

        sleep -Seconds 4
        Write-Host -BackgroundColor Green "Search Completed"

    }

    end
    {
        if($EnableCopy) 
        {
            Write-Host -BackgroundColor DarkMagenta "Copying..."
            sleep -Seconds 2

            for ($i = 0;$i -lt $Extension.Length;$i++)
            {
                New-Item -Path $CopyTo -Name "$($Extension[$i].Name)" -ItemType Directory
            }

            for ($i = 0;$i -lt $Extension.Length;$i++)
            {
                Get-ChildItem -Path $Directory -Recurse "*$($Extension[$i].Name)" -Exclude "$($Extension[$i].Name)" |
                Copy-Item -Destination "$CopyTo/$($Extension[$i].Name)"
            }

            sleep -Seconds 4
            Write-Host -BackgroundColor Green "Copy succeeded"
        }
    }
}



