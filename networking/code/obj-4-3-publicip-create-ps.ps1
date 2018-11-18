# Creating a Public IP Address
# Set Variables
$publicIpName = "ExamRef-PublicIP1-PS"
$rgName = "ExamRefRGPS"
$dnsPrefix = "examrefpubip1ps"
$location = "centralus"

# Create the Public IP
New-AzureRmPublicIpAddress -Name $publicIpName `
                           -ResourceGroupName $rgName `
                           -AllocationMethod Static `
                           -DomainNameLabel $dnsPrefix `
                           -Location $location