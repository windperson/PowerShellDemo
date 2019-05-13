#!/usr/bin/env pwsh
# input parameter
param(
    [Parameter(ValueFromPipeline=$true, HelpMessage="Welcome message")]
    [String]$GreetMsg = "Hello World",
    [Parameter(HelpMessage="Greeting person, default will be login user name")]
    [String]$UserName = $env:USERNAME
)

function GetMsg ($Greeting, $Name) {
    if ([string]::IsNullOrWhiteSpace($Name)) {
        $Name = $env:HOSTNAME;
    }
    $ret = "{0} {1}" -f $Greeting, $Name;
    if ($IsWindows) {
        $ret = $ret + ' On Windows';
    }
    elseif ($IsMacOS) {
        $ret = $ret + ' On macOS';
    }
    elseif ($IsLinux) {
        $ret = $ret + ' On Linux' + " $(uname -r)";
    }
    $ret;
}

$msg = GetMsg $GreetMsg $UserName;
Write-Host $msg;
