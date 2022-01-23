#Generated at 01/22/2022 19:32:25 by Laurent LIENHARD
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
        $GetImageCommand = @'
docker image ls fusionsuite:mariadbdev
'@

        Set-Variable -Name DockerFile -Value "$($PSScriptRoot)\ressources\DockerEnv\$DataBase\$Environment"
        Write-Verbose "You're choice is $DataBase in $Environment"
        Write-Verbose "You're configuration files are in $DockerFile"
    }

    process
    {
        Set-Location $DockerFile
        Start-Process -FilePath "docker-compose" -ArgumentList "up -d" -Wait

        <#         $result = Invoke-Expression -Command $GetImageCommand
        for ($i = 0; $i -le ($result.Count - 1); $i++)
        {
            if ($result[$i] -match "([\d|\w]{12})")
            {
                $ImageId = $Matches[0]
            }
        }
        Write-Verbose ('[{0:O}] ImageID {1}' -f (Get-Date), $ImageID)#>
    }

    end
    {

    }
}
