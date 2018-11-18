# Add VM IP Addresses to the Backend Pool of App Gateway
$appGw = Get-AzureRmApplicationGateway -Name "ExamRefAppGWPS" -ResourceGroupName "ExamRefRGPS"
$backendPool = Get-AzureRmApplicationGatewayBackendAddressPool -Name "appGatewayBackendPool" -ApplicationGateway $AppGw
$nic01 = Get-AzureRmNetworkInterface -Name "examrefwebvm1480" -ResourceGroupName "ExamRefRGPS"
$nic02 = Get-AzureRmNetworkInterface -Name "examrefwebvm2217" -ResourceGroupName "ExamRefRGPS"
Set-AzureRmApplicationGatewayBackendAddressPool -ApplicationGateway $appGw `
                                                -Name $backendPool `
                                                -BackendIPAddresses $nic01.IpConfigurations[0].PrivateIpAddress,$nic02.IpConfigurations[0].PrivateIpAddress