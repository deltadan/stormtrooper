# Update exsisting NIC to use a Static IP Addpress and set the IP
$nic=Get-AzureRmNetworkInterface -Name examrefwebvm1892 -ResourceGroupName ExamRefRGPS
$nic.IpConfigurations[0].PrivateIpAllocationMethod = "Static"
$nic.IpConfigurations[0].PrivateIpAddress = "10.0.0.5"
Set-AzureRmNetworkInterface -NetworkInterface $nic