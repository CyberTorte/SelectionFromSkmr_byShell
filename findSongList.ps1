function global:findSongID([String]$title) {
    $filePath = "C:\Users\endle\myWorkspace\SelectionFromSkmr_byShell\songList.csv"
    $csv = $(Import-Csv -Path $filePath -Encoding UTF8 | Where-Object {$_.title -eq $title} )

    return $csv.id
}