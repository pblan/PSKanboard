Function Get-KanboardDefaultTaskColors {
    <#
    .SYNOPSIS
    Get the application default task colors.
    .DESCRIPTION
    Get the application default task colors.
    .EXAMPLE
    
    #>  
    [CmdletBinding()]
    param ()

    $Request = @{
        jsonrpc="2.0"
        method="getDefaultTaskColors"
        id=1
    } | ConvertTo-Json

    $response = Invoke-KanboardAPI -Request $Request

    $response
}