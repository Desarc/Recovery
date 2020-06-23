# Set-ExecutionPolicy 'Unrestricted'

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install git --confirm