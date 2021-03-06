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
Get-ChildItem -Path 'git\bin' -Filter '*.sh' | Copy-Item -Destination "$userBinDir\"

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

# install 7-Zip
choco install 7zip --confirm

# install groovy
choco install groovy --confirm

# install .NET Core SDK
choco install dotnetcore-sdk --version=2.2.402 --confirm --allow-multiple
choco install dotnetcore-sdk --version=3.1.301 --confirm --allow-multiple
choco install dotnetcore-windowshosting --version=2.2.8 --confirm --allow-multiple
choco install dotnetcore-windowshosting --version=3.1.5 --confirm --allow-multiple

# install dotnet script
dotnet tool install --global dotnet-script

# install dotnet-dev-certs
dotnet tool install --global dotnet-dev-certs

# enable WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All -NoRestart

# enable WSL2
# WSL 2 does not work with Cisco AnyConnect VPN
# Invoke-WebRequest https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile 'C:\temp\wsl_update_x64.msi'
# msiexec.exe /i 'c:\temp\wsl_update_x64.msi' /quiet /norestart
# wsl --set-default-version 2

# does not set up everything correctly, install manually from Windows Store
# choco install wsl-ubuntu-1804 --confirm

# enable Hyper V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart

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

if (-not (Test-Path 'C:\code'))
{
    New-Item 'C:\code' -ItemType 'Directory'
}

Set-Location 'C:\code'

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