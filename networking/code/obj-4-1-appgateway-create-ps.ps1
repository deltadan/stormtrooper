# Create a subnet in the ExamRefVNET-PS VNet with the Address Range of 10.0.98.0/26

$vnet = Get-AzureRmVirtualNetwork -ResourceGroupName ExamRefRGPS `
                                  -Name ExamRefVNET-PS

Add-AzureRmVirtualNetworkSubnetConfig -Name AppGateway `
                                      -AddressPrefix "10.0.98.0/26" `
                                      -VirtualNetwork $vnet
Set-AzureRmVirtualNetwork -VirtualNetwork $vnet


# Create a public IP address that is used to connect to the application gateway.
$publicip = New-AzureRmPublicIpAddress -ResourceGroupName ExamRefRGPS `
                                       -Name ExamRefAppGW-PubIP `
                                       -Location "Central US" `
                                       -AllocationMethod Dynamic

# Create a gateway IP configuration. The gateway picks up an IP address from the configured subnet and routes network traffic to the IP addresses in the backend IP pool.

$vnet = Get-AzureRmvirtualNetwork -Name "ExamRefVNET-PS" -ResourceGroupName "ExamRefRGPS"
$subnet = Get-AzureRmVirtualNetworkSubnetConfig -Name "AppGateway" -VirtualNetwork $vnet 
$gipconfig = New-AzureRmApplicationGatewayIPConfiguration -Name "AppGwSubnet01" -Subnet $subnet

# Configure a backend pool with the addresses of your web servers. You could add pool members here as well.

$pool = New-AzureRmApplicationGatewayBackendAddressPool -Name "appGatewayBackendPool" 

# Configure backend http settings to determine the protocol and port that is used when sending traffic to the backend servers.

$poolSetting = New-AzureRmApplicationGatewayBackendHttpSettings -Name "appGatewayBackendHttpSettings" `
                                                                -Port 80 `
                                                                -Protocol Http `
                                                                -CookieBasedAffinity Disabled `
                                                                -RequestTimeout 30

# Configure a frontend port that is used to connect to the application gateway through the public IP address

$fp = New-AzureRmApplicationGatewayFrontendPort -Name frontendport01 `
                                                -Port 80

# Configure the frontend IP configuration with the public IP address created earlier.

$fipconfig = New-AzureRmApplicationGatewayFrontendIPConfig -Name fipconfig01 `
                                                           -PublicIPAddress $publicip

# Configure the listener.  The listener is a combination of the front end IP configuration, protocol, and port and is used to receive incoming network traffic. 

$listener = New-AzureRmApplicationGatewayHttpListener -Name listener01 `
                                                      -Protocol Http `
                                                      -FrontendIPConfiguration $fipconfig `
                                                      -FrontendPort $fp

# Configure a basic rule that is used to route traffic to the backend servers. 

$rule = New-AzureRmApplicationGatewayRequestRoutingRule -Name rule1 `
                                                        -RuleType Basic `
                                                        -BackendHttpSettings $poolSetting `
                                                        -HttpListener $listener `
                                                        -BackendAddressPool $pool

# Configure the SKU for the application gateway, this determines the size and whether or not WAF is used.

$sku = New-AzureRmApplicationGatewaySku -Name "WAF_Medium" `
                                        -Tier "WAF" `
                                        -Capacity 2

# Create the application gateway

New-AzureRmApplicationGateway -Name ExamRefAppGWPS `
                              -ResourceGroupName ExamRefRGPS `
                              -Location "Central US" `
                              -BackendAddressPools $pool `
                              -BackendHttpSettingsCollection $poolSetting `
                              -FrontendIpConfigurations $fipconfig  `
                              -GatewayIpConfigurations $gipconfig `
                              -FrontendPorts $fp `
                              -HttpListeners $listener `
                              -RequestRoutingRules $rule `
                              -Sku $sku `
                              -WebApplicationFirewallConfiguration

# Set WAF Configuration to Enabled

$AppGw = Get-AzureRmApplicationGateway -Name ExamRefAppGWPS -ResourceGroupName ExamRefRGPS
Set-AzureRmApplicationGatewayWebApplicationFirewallConfiguration -ApplicationGateway $AppGw `
                                                                 -Enabled $True `
                                                                 -FirewallMode "Detection" `
                                                                 -RuleSetType "OWASP" `
                                                                 -RuleSetVersion "3.0"                       





                              