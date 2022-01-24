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
        if (!(Test-Docker))
        {
            Write-Error "Docker must be installed"
            Break
        }
        Set-Variable -Name DockerFile -Value "$($PSScriptRoot)\ressources\DockerEnv\$DataBase\$Environment"
        Write-Verbose "You're choice is $DataBase in $Environment"
        Write-Verbose "You're configuration files are in $DockerFile"
    }

    process
    {
        Set-Location $DockerFile
        Start-Process -FilePath "docker-compose" -ArgumentList "up -d" -Wait
    }

    end
    {

    }
}

Initialize-FSEnvironment -verbose