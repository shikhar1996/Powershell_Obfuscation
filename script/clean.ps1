$clean = Get-ChildItem -Path './clean/'
$clean

$data = foreach($i in $clean){
    $scriptResult = ([PSCustomObject] (Get-RvoFeatureVector $i.FullName)) | ConvertTo-CSV -NoTypeInformation
    # $scriptResult
    # $scriptResult += "," + $i.Name
    $scriptResult
    break
}
$data | Set-Content cleanHeader.csv

# $scriptResult | Add-Member -MemberType NoteProperty -Name 'fileName' -Value $i.Name

# $analyzedCommandLines = $clean | %{
#     $scriptResult = ([PSCustomObject] (Get-RvoFeatureVector $i)) | ConvertTo-CSV -NoTypeInformation | Select -Last 1
#     if($_.DBO_Obfuscated -match 'clean')
#     {
#         $scriptResult += ",0"
#     }
#     else
#     {
#         $scriptResult += ",1"
#     }

#     $scriptResult
# }
# $analyzedCommandLines | Set-Content AnalyzedCommandLines.csv
