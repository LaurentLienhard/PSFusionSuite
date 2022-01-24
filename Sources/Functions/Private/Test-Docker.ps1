function Test-Docker
{
    if (Get-Service -Name Docker)
    {
        return $true
    }
    else
    {
        return $false
    }
}