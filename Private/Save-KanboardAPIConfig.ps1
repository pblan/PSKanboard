Function Save-KanboardAPIConfig {
   <#
   .Synopsis
      Used to store information about your Kanboard instance.
   .DESCRIPTION
      Used to store information about your Kanboard instance.
   .EXAMPLE
      Save-KanboardAPIConfig -Domain https://kanban.itc.rwth-aachen.de -Key "AaAHJvhcjbdvhdv6" -User "paddel"
   .NOTES
      Stores .xml in $env:appdata\PSKanboard\
   #>
   [CmdletBinding()]
   param(
      [Parameter(Mandatory=$true)] 
      [ValidateNotNullOrEmpty()] 
      $User,
      [Parameter(Mandatory=$true)] 
      [ValidateNotNullOrEmpty()] 
      $Key,
      [Parameter(Mandatory=$true)]
      [ValidateNotNullOrEmpty()] 
      $Domain,
      [Parameter()]
      [ValidateNotNullOrEmpty()]
      $ConfigPath = "$env:appdata\PSKanboard\PSKanboardConfig.xml",
      [Parameter()]
      [ValidateNotNullOrEmpty()]
      $AuthHeader = "X-API-Auth"
   )

   $parameters = @{
      User = $User
      Key = ConvertTo-SecureString -String $Key -AsPlainText -Force
      Domain = $Domain
      AuthHeader = $AuthHeader
   }

   if (!(Test-Path (Split-Path $ConfigPath))) {
      New-Item -ItemType Directory -Path (Split-Path $ConfigPath) | Out-Null
   }

   $parameters | Export-Clixml -Path $ConfigPath
   Remove-Variable Parameters
}

#Save-KanboardAPIConfig -Domain "https://kanboard.paddel.uber.space/jsonrpc.php" -User "paddel" -Key "68d929a3c095f467508260cd59110935ddadceee19e04ee082610ae02825"