Function Get-KanboardDefaultTaskColor {
    <#
    .SYNOPSIS
    Get the application default task color.
    .DESCRIPTION
    Get the application default task color.
    .EXAMPLE
    
    #>  
    [CmdletBinding()]
    param ()

    $Request = @{
        jsonrpc="2.0"
        method="getDefaultTaskColor"
        id=1
    } | ConvertTo-Json

    $response = Invoke-KanboardAPI -Request $Request

    $response
}