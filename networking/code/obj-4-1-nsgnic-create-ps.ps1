#Build a new Inbound Rule to Allow TCP Traffic on Port 80 to the Subnet
$rule1 = New-AzureRmNetworkSecurityRuleConfig -Name PORT_HTTP_80 `
                                              -Description "Allow HTTP" `
                                              -Access Allow `
                                              -Protocol Tcp `
                                              -Direction Inbound `
                                              -Priority 100 `
                                              -SourceAddressPrefix * `
                                              -SourcePortRange * `
                                              -DestinationAddressPrefix 10.0.0.0/24 `
                                              -DestinationPortRange 80

#Create a new Network Secruity Group and add the HTTP Rule
$nsg = New-AzureRmNetworkSecurityGroup -ResourceGroupName ExamRefRGPS `
                                       -Location centralus `
                                       -Name "ExamRefWEBVM1-nsg" `
                                       -SecurityRules $rule1

#Associate the Rule with the NIC in the Virtual Network ExamRefVNET-PS
$nic = Get-AzureRmNetworkInterface -ResourceGroupName ExamRefRGPS -Name examrefwebvm1892

$nic.NetworkSecurityGroup = $nsg

Set-AzureRmNetworkInterface -NetworkInterface $nic

