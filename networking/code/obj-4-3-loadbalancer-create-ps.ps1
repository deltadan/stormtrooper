# Set Variables
$publicIpName = "ExamRefLB-PublicIP-PS"
$rgName = "ExamRefRGPS"
$dnsPrefix = "examreflbps"
$location = "centralus"
$lbname = "ExamRefLBPS"
$vnetName = "ExamRefVNET-PS"


# Create the Public IP
$publicIP = New-AzureRmPublicIpAddress -Name $publicIpName `
                           -ResourceGroupName $rgName `
                           -AllocationMethod Static `
                           -DomainNameLabel $dnsPrefix `
                           -Location $location

#Create Frontend IP Configuration
$frontendIP = New-AzureRmLoadBalancerFrontendIpConfig -Name ExamRefFrontEndPS `
                                                      -PublicIpAddress $publicIP

# Create Backend Pool
$beAddressPool = New-AzureRmLoadBalancerBackendAddressPoolConfig -Name ExamRefBackEndPoolPS

#Create HTTP Probe
$healthProbe = New-AzureRmLoadBalancerProbeConfig -Name HealthProbe `
                                                  -RequestPath '/' `
                                                  -Protocol http `
                                                  -Port 80 `
                                                  -IntervalInSeconds 5 `
                                                  -ProbeCount 2

#Create Load Balancer Rule
$lbrule = New-AzureRmLoadBalancerRuleConfig -Name ExamRefRuleHTTPPS `
                                            -FrontendIpConfiguration $frontendIP `
                                            -BackendAddressPool  $beAddressPool `
                                            -Probe $healthProbe `
                                            -Protocol Tcp `
                                            -FrontendPort 80 `
                                            -BackendPort 80

#Create Load Balancer
New-AzureRmLoadBalancer -ResourceGroupName $rgName `
                        -Name $lbName `
                        -Location $location `
                        -FrontendIpConfiguration $frontendIP `
                        -LoadBalancingRule $lbrule `
                        -BackendAddressPool $beAddressPool `
                        -Probe $healthProbe

# Add the Web Servers to the Backend Pool
$vnet = Get-AzureRmVirtualNetwork -Name $vnetName `
                                  -ResourceGroupName $rgName
$subnet = Get-AzureRmVirtualNetworkSubnetConfig -Name Apps `
                                                -VirtualNetwork $vnet            
$nic1 = Get-AzureRmNetworkInterface -Name examrefwebvm1480 `
                                    -ResourceGroupName $rgName
$nic1 | Set-AzureRmNetworkInterfaceIpConfig -Name ipconfig1 `
                                            -LoadBalancerBackendAddressPool $beAddressPool `
                                            -Subnet $subnet
$nic1 | Set-AzureRmNetworkInterface

$nic2 = Get-AzureRmNetworkInterface -Name examrefwebvm2217 `
                                    -ResourceGroupName $rgName
$nic2 | Set-AzureRmNetworkInterfaceIpConfig -Name ipconfig1 `
                                            -LoadBalancerBackendAddressPool $beAddressPool `
                                            -Subnet $subnet
$nic2 | Set-AzureRmNetworkInterface