$obfus = Get-ChildItem -Path './obfuscated/'
$obfus

$data2 = foreach($i in $obfus){
    $scriptResult2 = ([PSCustomObject] (Get-RvoFeatureVector $i.FullName)) | ConvertTo-CSV -NoTypeInformation | Select-Object -Last 1
    # $scriptResult
    $scriptResult2 += "," + $i.Name
    $scriptResult2
}
$data2 | Set-Content obfuscated.csv