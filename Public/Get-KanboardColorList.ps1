Function Get-KanboardColorList {
    <#
    .SYNOPSIS
    Get the application color list.
    .DESCRIPTION
    Get the application color list.
    .EXAMPLE
    
    #>  
    [CmdletBinding()]
    param ()

    $Request = @{
        jsonrpc="2.0"
        method="getColorList"
        id=1
    } | ConvertTo-Json

    $response = Invoke-KanboardAPI -Request $Request

    $response
}