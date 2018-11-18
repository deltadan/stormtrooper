# Load VNETA and VNETB into Variables
$vneta = Get-AzureRmVirtualNetwork `
-Name "VNETA" `
-ResourceGroupName "VNETARG"

$vnetb = Get-AzureRmVirtualNetwork `
-Name "VNETB" `
-ResourceGroupName "VNETBRG"

# Peer VNETA to VNETB.
Add-AzureRmVirtualNetworkPeering `
  -Name 'VNETA-to-VNETB' `
  -VirtualNetwork $vneta `
  -RemoteVirtualNetworkId $vnetb.Id

# Peer VNETB to VNETA.
Add-AzureRmVirtualNetworkPeering `
  -Name 'VNETA-to-VNETB' `
  -VirtualNetwork $vnetb `
  -RemoteVirtualNetworkId $vneta.Id

#Check on the Peering Status
  Get-AzureRmVirtualNetworkPeering `
  -ResourceGroupName VNETARG `
  -VirtualNetworkName VNETA `
  | Format-Table VirtualNetworkName, PeeringState