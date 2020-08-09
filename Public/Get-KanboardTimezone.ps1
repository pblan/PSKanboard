Function Get-KanboardTimezone {
    <#
    .SYNOPSIS
    Get the application timezone.
    .DESCRIPTION
    Get the application timezone.
    .EXAMPLE
    
    #>  
    [CmdletBinding()]
    param ()

    $Request = @{
        jsonrpc="2.0"
        method="getTimezone"
        id=1
    } | ConvertTo-Json

    $response = Invoke-KanboardAPI -Request $Request

    $response
}