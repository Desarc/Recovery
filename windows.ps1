# install Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install groovy
choco install groovy

dotnet tool install -g dotnet-script


# enable Hyper V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

choco install kubernetes-helm -y