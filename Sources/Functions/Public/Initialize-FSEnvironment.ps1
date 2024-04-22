<#
.SYNOPSIS
Initialize a new environment for FusionSuite.

.DESCRIPTION
Create a new environment for FusionSuite.

.PARAMETER DataBase
Choose which database to use.

.PARAMETER Environment
Choose which environment to use.

.EXAMPLE
Initialize-FSEnvironment -DataBase "MARIADB" -Environment "DEV"

.NOTES
General notes
#>
function Initialize-FSEnvironment
{
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet("MARIADB", "POSTGRESS")]
        [System.String]$DataBase = "MARIADB",
        [Parameter()]
        [ValidateSet("PROD", "DEV", "TEST")]
        [System.String]$Environment = "DEV"

    )

    begin
    {
        #Set-Variable -Name DockerFile -Value "$($PSScriptRoot)\ressources\DockerEnv\$DataBase\$Environment"
        Set-Variable -Name DockerFile -Value "C:\01-DEV\PSFusionSuite\Sources\Ressources\DockerEnv\MariaDB\DEV"
        Write-Verbose "You're choice is $DataBase in $Environment"
        Write-Verbose "You're configuration files are in $DockerFile"
    }

    process
    {
        Set-Location $DockerFile
        Start-Process -FilePath "docker-compose" -ArgumentList "up -d" -Wait
        Set-Location $PSScriptRoot
    }

    end
    {

    }
}