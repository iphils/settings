oh-my-posh.exe init pwsh --config "C:\Users\Philips.pokkatt2\OneDrive - Wood PLC\Documents\WindowsPowerShell\atomic.omp.json" | Invoke-Expression

Import-Module PSReadLine
Import-Module z
Import-Module Terminal-Icons
# Set list view as default prediction view
Set-PSReadLineOption -PredictionView List

Set-PSReadLineKeyHandler -Key Alt+w `
                         -BriefDescription SaveInHistory `
                         -LongDescription "Save current line in history but do not execute" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
}

