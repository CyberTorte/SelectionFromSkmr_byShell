function global:selectSkmr($type = "none") {

    $filePath = "C:\Users\endle\myWorkspace\SelectionFromSkmr_byShell\songList.csv"
    
    if ($type -ceq "none") {
        $csv = $(Import-Csv -Path $filePath -Encoding UTF8)
        $point = Get-Random $csv.count

        return $csv[$point].title
    }
}