function global:addSkmr([String]$name, [int]$type) {
    $filePath = "C:\Users\endle\myWorkspace\SelectionFromSkmr_byShell\songList.csv"
    $song = New-Object PSObject | Select-Object title,type

    $song.title = $name
    $song.type = $type

    $song | Export-Csv -Path $filePath -Encoding UTF8 -NoTypeInformation -Append
}