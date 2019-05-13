#!/usr/bin/env pwsh
# input parameter
param(
    [String]$GreetMsg = "Hello World",
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
