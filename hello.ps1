#!/usr/bin/env pwsh
# input parameter
param(
    [String]$GreetMsg,
    [String]$UserName
)

function GetMsg ($Greeting, $Name) {

    $ret = "{0} {1}" -f $Greeting, $Name;
    if ($IsWindows) {
        $ret = $ret + ' On Windows';
    }
    $ret;
}   
 
$msg = GetMsg $GreetMsg $UserName;
Write-Host $msg;