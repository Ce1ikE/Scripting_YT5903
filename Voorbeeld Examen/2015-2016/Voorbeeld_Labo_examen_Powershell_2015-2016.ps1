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
                888P     Y888  "Y88P"  888     888  "Y88888 888 
                
                
                
                '

# =======================================================================================================
# =======================================================================================================
# =======================================================================================================


# ====================================== HERE BEGINS THE REAL WORK ======================================

<#
    .SYNOPSIS
        Copies items from a directory to a archive directory
    
    .DESCRIPTION
        This function enables a user to copy files from a source directory to a archive directory.
        The user can choose the age of the files that need to be copied. The age is a optional parameter
        that can be given to the function if this parameter is not given the default value used.
        The age is also expressed in days when provide to the function it will check and match the items
        from the source directory which "LastWriteTime" property is greater then the "age".
        Afterwards it will copy these items to the archive directory and delete the original files.
        As a precaution the "remove-item" has been commented out in the original script in order to prevent
        mistakes made by the user

    .PARAMETER OriginalDIR
        This parameter is the path of the directory that needs to be check and for which 
        a archive directory will be made.
        This is a mandatory parameter
        The name 

    .PARAMETER ArchiveDIR
        This parameter is the path of the archive directory in which the copied items
        will be stored.
        This is a mandatory parameter 

    .PARAMETER HowOld
        This parameter is the threshold of each file's time span between the current date and the LastWriteTime in days.
        Which means if the time span of a file between the current date and the LastWriteTime is greater then
        this parameter the file will be copied to the archive directory and
        the original will be removed (Not in this script in order to prevent the user of making mistakes).
        This is a optional parameter.
        The default value is set to 365 days. 

    .PARAMETER Logfile
        The parameter is the name of the logfile that keeps track wich files where copied.
        The logfile contains the name and the LastWriteTime of the each file that is copied 
        This is a optional parameter.
        The default name is set to "log.txt".

    .EXAMPLE
        Archive-Files -OriginalDir "Source" -ArchiveDir "Archive"

        Copies the files which time span between the current date and the LastWriteTime in days is greater
        then 365 days from the directory "Source" to the directory "Archive"
        Afterwards the name and LastWriteTime is writen inside the logfile

    .EXAMPLE
        Archive-Files -OriginalDir "Source" -ArchiveDir "Archive" -HowOld 10 -Logfile "Mylogfile.txt"

        Copies the files which time span between the current date and the LastWriteTime in days is greater
        then 10 days from the directory "Source" to the directory "Archive"
        Afterwards the name and LastWriteTime is writen inside the logfile "Mylogfile.txt"

#>
function Archive-Files
{
    param
    (
    [parameter(Mandatory=$true)][string]$OriginalDIR,
    [parameter(Mandatory=$true)][string]$ArchiveDIR,
    [parameter(Mandatory=$false)][int]$HowOld=365,
    [parameter(Mandatory=$false)][string]$Logfile="log.txt"
    )



    begin # In the "begin" section we will see if all our parameters do in fact exists in the filesystem
    {
       
        if(Test-Path -Path "$OriginalDIR") # Test if the original directory already exists  (1) / if not quit the script => Catch
        {

        # If (1) is OK and the original directory does exist we can continue

            if(!(Test-Path -Path "$ArchiveDIR")) # Test if the archive directory already exists (2) / if not create the archive directory
            {
                # Make a directory where you will store the archived files (The archive directory is always created in your current location)
                New-Item -Path . -Name $ArchiveDIR -ItemType Directory
                # Make a logfile where you will note the copied files's name and LastWriteTime
                New-Item -Path ./$ArchiveDIR -Name $Logfile -ItemType File
            }
            else
            {
                if(!(Test-Path -Path ./$ArchiveDIR/$Logfile)) # Test if the logfile already exists (3) / if not create the logfile
                {
                    # Make a logfile where you will note the copied files's name and LastWriteTime
                    New-Item -Path ./$ArchiveDIR -Name $Logfile -ItemType File
                }
            }  

            # We create a directory with the current date as name inside the archive directory
            # in order to keep things tidy and neat 
            $Today = Get-Date -Format "dddd dd-MM-yyyy"
        
            if (!(Test-Path -Path ./$ArchiveDIR/$Today))
            {
                New-Item -Path ./$ArchiveDIR -Name $Today -ItemType Directory
            }
        }
        else
        {
            Write-Host -BackgroundColor Red "Source directory can not be found or does not exist"
        }
    }

    process # In the process section we check which element from our original directory are to old and copy these into the archive directory
    {
        if(Test-Path -Path "$OriginalDIR")
        {
            # We write the current date and time to the logfile
            Get-Date | Out-File -FilePath ./$ArchiveDIR/$Logfile -Append 

            $Items_in_DIR = Get-ChildItem -Path "$OriginalDIR" -Recurse
            $To_Old_Items = @()
            foreach($el in $Items_in_DIR)
            {
        
                # For more info about the "New-TimeSpan" cmdlet 
                # => Get-Help New-TimeSpan => See examples and description
                # => New-TimeSpan | Get-Member => See properties

                # Copy each element that has: LastWriteTime > $HowOld (in days) to the archive directory
                if(New-TimeSpan -Start $el.LastWriteTime -End (Get-Date)| Where-Object -Property TotalDays -GT $HowOld)
                {
               
                    Copy-Item -Path $el.FullName -Destination ./$ArchiveDIR/$Today -Force
                
                    $To_Old_Items += $el
                }
            }
        }
    }

    end # In the end section we report back to the logfile and to the user which file were succesfully copied and how many
    {
        if(Test-Path -Path "$OriginalDIR")
        {
            $To_Old_Items | Select-Object -Property Name , LastWriteTime | Out-File -FilePath ./$ArchiveDIR/$Logfile -Append
       
            # Report back to the user which and how much items where copied
            Write-Host -BackgroundColor Green "`n`nItems succefully archived: $($To_Old_Items.Count)`n`n"
            Write-Host -BackgroundColor DarkGreen $To_Old_Items 
       
            <# The Assignement says that you must remove the items that were copied
               Uncomment this if you want to see the result

            foreach($el in $To_Old_Items)
            {

            Remove-Item -Path $el.FullName

            }

            #>


        }
    }
}



# =======================================================================================================
# I will not pause, I will not repeat myself, and you will not interrupt me.
# You think that because you're sitting where you are, and I am sitting where I am,
# that you are in control of what is about to happen.
# You're mistaken. I am in control, because I know things that you do not know.
# =======================================================================================================