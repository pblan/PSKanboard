Function Get-KanboardVersion {
    <#
    .SYNOPSIS
    Get the application version
    .DESCRIPTION
    Get the application version
    .EXAMPLE
    
    #>  
    [CmdletBinding()]
    param ()

    $Request = @{
        jsonrpc="2.0"
        method="getVersion"
        id=1
    } | ConvertTo-Json

    $response = Invoke-KanboardAPI -Request $Request

    $response
}