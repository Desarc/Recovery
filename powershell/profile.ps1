Set-Location 'C:\code'

# function Fix-WSL
# {
#     Get-NetIPInterface -InterfaceAlias 'vEthernet (WSL)' | Set-NetIPInterface -InterfaceMetric 1
#     Get-NetAdapter | Where-Object { $_.InterfaceDescription -Match 'Cisco AnyConnect' } | Set-NetIPInterface -InterfaceMetric 6000
# }