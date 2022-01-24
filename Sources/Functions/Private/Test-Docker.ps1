function Test-Docker
{
    if (Get-Service -Name Docker -ErrorAction SilentlyContinue)
    {
        return $true
    }
    else
    {
        return $false
    }
}