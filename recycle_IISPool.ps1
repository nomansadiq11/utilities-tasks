
Function RecycleIIS([string]$arg1)
{
  $pc = $arg1

## List the app pools, note the __RELPATH of the one you want to kill: 
Get-WMIObject IISApplicationPool -Computer $pc -Namespace root\MicrosoftIISv2 -Authentication PacketPrivacy  
 
## Recycle a specific one: 
$Name = "W3SVC/APPPOOLS/Osn.Csrservice"  ## This is the Name from above 
$Path = "IISApplicationPool.Name='$Name'"      ## This is the __RELPATH 
 
Invoke-WMIMethod Recycle -Path $Path -Computer $pc -Namespace root\MicrosoftIISv2 
}

RecycleIIS("Server-IP")

