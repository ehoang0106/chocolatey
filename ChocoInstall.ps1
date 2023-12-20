

$chocoInstallPath = "$($env:SystemDrive)\ProgramData\chocolatey"
$apps = @("office365business", "googlechrome", "tightvnc", "adobereader")

function Install-Choco {
    
    if(Test-Path -path $chocoInstallPath)
    {   
        #check if chocolatey already installed
        Write-Host "Chocolatey already installed!"
    }
    else {
        #install chocolatey
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }
    
}

function Install-Package {
    param (
        [string[]]$apps
    )

    foreach($app in $apps)
    {
        choco install $app
    }
}

function Install-Menu {
    while($true)
    {
        Write-Host "`n----------------------"
        Write-Host "Enter (1) to install choco"
        Write-Host "Enter (2) to install software"
        Write-Host "Enter (3) to exit"
        Write-Host "`n----------------------"

        $option = Read-Host "Enter option"


        if($option -eq "1")
        {
            Install-Choco
        }
        elseif($option -eq "2")
        {
            Install-Package -apps $apps
        }
        elseif($option -eq "3")
        {
            break
        }
        else {
            Write-Host "Invalid input. Try again!`n"
        }

    }
    
}
    

Install-Menu