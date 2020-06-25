if (-not (Test-Path 'C:\temp'))
{
    New-Item 'C:\temp' -ItemType 'Directory'
}

# Update Powershell features
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force
Update-Module -Name PowerShellGet

Copy-Item -Path 'powershell\profile.ps1' -Destination 'C:\Windows\System32\WindowsPowerShell\v1.0'
Copy-Item -Path 'git\.gitconfig' -Destination 'C:\Users\.gitconfig'
Copy-Item -Path 'git\.bash_profile' -Destination 'C:\Users\.bash_profile'
Copy-Item -Path 'git\.bashrc' -Destination 'C:\Users\.bashrc'

# install Microsoft Visual C++ Redistributable for Visual Studio 2015-2019
choco install vcredist140 --confirm

# Install WinGet -- does not work, install manually from Microsoft Store
# Add-AppxPackage Microsoft.VCLibs.x64.14.00.appx
# https://www.howtogeek.com/285410/how-to-install-.appx-or-.appxbundle-software-on-windows-10/
# Invoke-WebRequest 'https://github.com/microsoft/winget-cli/releases/download/v0.1.4331-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle' -OutFile 'C:\temp\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle'
# Add-AppxPackage -Path 'C:\temp\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle'

# install VS Code
choco install vscode --confirm

# install Visual Studio
choco install visualstudio2019enterprise --confirm

# install groovy
choco install groovy --confirm

# install .NET Core SDK
choco install dotnetcore-sdk --confirm

# install dotnet core

dotnet tool install -g dotnet-script

# enable WSL2 and install Ubuntu
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Invoke-WebRequest https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile 'C:\temp\wsl_update_x64.msi'
msiexec.exe /i 'c:\temp\wsl_update_x64.msi' /quiet /norestart

wsl --set-default-version 2

choco install wsl-ubuntu-1804 --confirm

# enable Hyper V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

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

# Spotify -- this might require some manual intervention
# https://chocolatey.org/packages/spotify
choco install spotify --confirm

# Postman
choco install postman --confirm

# dotpeek
choco install dotpeek --confirm

if (-not (Test-Path 'C:\code'))
{
    New-Item 'C:\code' -ItemType 'Directory'
}

Set-Location 'C:\code'

git config --global http.sslbackend schannel

git clone https://dips-alm/DefaultCollection/DIPS/_git/Buildsystem
git clone https://dips-alm/DefaultCollection/DIPS/_git/OctopusDeploy-Templates
git clone https://dips-alm/DefaultCollection/DIPS/_git/OctopusDeploy-Templates-WebApi
git clone https://dips-alm/DefaultCollection/DIPS/_git/Arena-Delivery
git clone https://dips-alm/DefaultCollection/DIPS/_git/AnsiblePlaybooks
git clone https://dips-alm/DefaultCollection/DIPS/_git/AnsibleInventory
git clone https://dips-alm/DefaultCollection/DIPS/_git/ArtifactoryTerraform
git clone https://dips-alm/DefaultCollection/DIPS/_git/ArtifactoryUserPlugins
git clone https://dips-alm/DefaultCollection/DIPS/_git/ProgetArtifactorySync
git clone https://dips-alm/DefaultCollection/DIPS/_git/TrondheimInstaller
git clone https://dips-alm/DefaultCollection/DIPS/_git/TeamOptimus

Set-Location 'C:\github\Recovery'

Write-Warning 'If something went wrong, try rebooting or restarting the shell.'