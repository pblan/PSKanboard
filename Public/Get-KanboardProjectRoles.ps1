Function Get-KanboardProjectRoles {
    <#
    .SYNOPSIS
    Get the project roles.
    .DESCRIPTION
    Get the project roles.
    .EXAMPLE
    
    #>  
    [CmdletBinding()]
    param ()

    $Request = @{
        jsonrpc="2.0"
        method="getProjectRoles"
        id=1
    } | ConvertTo-Json

    $response = Invoke-KanboardAPI -Request $Request

    $response
}