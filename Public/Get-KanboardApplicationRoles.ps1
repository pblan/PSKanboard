Function Get-KanboardApplicationRoles {
    <#
    .SYNOPSIS
    Get the application roles.
    .DESCRIPTION
    Get the application roles.
    .EXAMPLE
    
    #>  
    [CmdletBinding()]
    param ()

    $Request = @{
        jsonrpc="2.0"
        method="getApplicationRoles"
        id=1
    } | ConvertTo-Json

    $response = Invoke-KanboardAPI -Request $Request

    $response
}