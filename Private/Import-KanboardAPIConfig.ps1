Function Import-KanboardAPIConfig {
    <#
    .Synopsis
       Check for existing config and writes contents.
    .DESCRIPTION
       Check for existing config and writes contents.
    .EXAMPLE
        Import-KanboardAPIConfig
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $ConfigPath = "$env:appdata\PSKanboard\PSKanboardConfig.xml"
    )

    if (Test-Path $ConfigPath) {
        Import-Clixml $ConfigPath
    
    } else {
        Write-Error 'Unable to locate config file at $($ConfigPath). You may have to run Save-KanboardAPIConfig.'
        break
    }
}

