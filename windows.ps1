if (-not (Test-Path 'C:\temp'))
{
    New-Item 'C:\temp' -ItemType 'Directory'
}

# Update Powershell features
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force
Update-Module -Name PowerShellGet

$userDir = 'C:\Users\ori'
Copy-Item -Path 'powershell\profile.ps1' -Destination 'C:\Windows\System32\WindowsPowerShell\v1.0'
Copy-Item -Path 'git\.gitconfig' -Destination (Join-Path $userDir '.gitconfig')
Copy-Item -Path 'git\.bash_profile' -Destination (Join-Path $userDir '.bash_profile')
Copy-Item -Path 'git\.bashrc' -Destination (Join-Path $userDir '.bashrc')

$userBinDir = Join-Path $userDir 'bin'
if (-not (Test-Path $userBinDir))
{
    New-Item $userBinDir -ItemType 'Directory'
}

Get-ChildItem -Path 'git\bin' -Filter '*.sh' | Copy-Item -Destination "$userBinDir\"

# install VS Code
# choco install vscode --confirm

# install Visual Studio
choco install visualstudio2022enterprise --confirm

# install 7-Zip
choco install 7zip --confirm

# install groovy
choco install groovy --confirm

# install .NET 6
choco install dotnet-6.0-sdk --confirm

# install dotnet script
dotnet tool install --global dotnet-script

# install dotnet-dev-certs
dotnet tool install --global dotnet-dev-certs

# enable WSL2
wsl --install

# install docker
choco install docker-desktop --confirm

# install docker-compose
choco install docker-compose --confirm

# install helm
choco install kubernetes-helm --confirm

# install Slack
choco install slack --confirm

# Windows Terminal
# choco only installs preview as of 2020-06-24
# choco install microsoft-windows-terminal --confirm
# WinGet is only for insiders as of 2020-06-24
# winget install --id=Microsoft.WindowsTerminal -e
# install manually from Windows Store

# Spotify -- this might require some manual intervention
# https://chocolatey.org/packages/spotify
choco install spotify --confirm

# Postman
choco install postman --confirm

# dotpeek
choco install dotpeek --confirm

# NuGet package explorer
choco install nugetpackageexplorer --confirm

# Paint .NET
choco install paint.net --confirm

Write-Warning 'If something went wrong, try rebooting or restarting the shell.'