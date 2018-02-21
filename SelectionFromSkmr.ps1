function global:selectSkmr($type = "none") {

    $filePath = "C:\Users\endle\myWorkspace\SelectionFromSkmr_byShell\songList.csv"
    
    if ($type -ceq "none") {
        $csv = $(Import-Csv -Path $filePath -Encoding UTF8)
        $point = Get-Random $csv.count

        return $csv[$point].title
    } elseif ($type -eq "pretty") {
        $csv = $(Import-Csv -Path $filePath -Encoding UTF8 | Where-Object {$_.type -ceq 1})
        $point = Get-Random $csv.count

        return $csv[$point].title
    } elseif ($type -eq "cool") {
        $csv = $(Import-Csv -Path $filePath -Encoding UTF8 | Where-Object {$_.type -ceq 2})
        $point = Get-Random $csv.count

        return $csv[$point].title
    } elseif ($type -eq "active") {
        $csv = $(Import-Csv -Path $filePath -Encoding UTF8 | Where-Object {$_.type -ceq 3})
        $point = Get-Random $csv.count

        return $csv[$point].title
    }
}