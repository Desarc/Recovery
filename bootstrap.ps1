# Set-ExecutionPolicy 'Unrestricted'

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install git --confirm

New-Item 'C:\github' -ItemType 'Directory'

Set-Location 'C:\github'

git clone https://github.com/Desarc/Recovery.git

Set-Location 'C:\github\Recovery'