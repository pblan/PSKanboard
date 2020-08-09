Function Invoke-KanboardAPI {
    <#
    .Synopsis
       Invokes a given Kanboard-API request according to a certain Kanboard config.
    .DESCRIPTION
       Invokes a given Kanboard-API request according to a certain Kanboard config.
    .EXAMPLE
        Invoke-KanboardAPI -Request $Request
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        $Request,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $ConfigPath = "$env:appdata\PSKanboard\PSKanboardConfig.xml"
    )

    $KanboardConfig = Import-KanboardAPIConfig $ConfigPath
    $user = $KanboardConfig.User
    $domain = $KanboardConfig.Domain
    $authHeader = $KanboardConfig.AuthHeader
    $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($KanboardConfig.Key)
    $key = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)

    $headers = @{
        "$authHeader" = $key;
    }

    $key = ConvertTo-SecureString $key -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential($user, $key)

    try  {
        $webContent = Invoke-RestMethod -Uri $domain -Headers $headers -FollowRelLink -Body $Request -Credential $cred -ContentType 'application/json'

        for ($i = 0; $i -lt $webContent.Length; $i++) {
            $webContentMerged += $webContent[$i]
        }

        Write-Verbose "Web Content: $($webContent)"
        $Result = $webContentMerged

        Remove-Variable key
        Remove-Variable headers
        Remove-Variable Request
    } 
    catch {
        $ErrorMessage = $_
        Write-Warning  -Message "$ErrorMessage."
        Write-Host ($ErrorMessage | Format-Table | Out-String)
    }
    
    Write-Output $Result
}