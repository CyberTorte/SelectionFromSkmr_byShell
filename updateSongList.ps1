function global:updateSkmr([String]$id, [String]$target, [String]$value) {
    $filePath = "C:\Users\kbc16\workspace\private\SelectionFromSkmr_byShell\songList.csv"
    $csv = $(Import-Csv -Path $filePath -Encoding UTF8)

    if ($target -eq "title") {
        $($csv | Where-Object { $_.id -eq $id }).title = $value
    } elseif ($target -eq "type") {

        $type = ""
        if ( ($value -eq "pretty") -or ($value -eq 1) )  {
            $type = 1
        } elseif ( ($value -eq "cool") -or ($value -eq 2) ) {
            $type = 2
        } elseif ( ($value -eq "active") -or ($value -eq 3) ) {
            $type = 3
        } else {
            $type = "all"
        }

        $($csv | Where-Object { $_.id -eq $id }).type = $type
    } elseif ($target -eq "limited") {

        $limited = ""
        if ($value -eq "all") {
            $limited = "all"
        }elseif ( ($value -eq "Tue") -or ($value -eq "Tuesday") ) {
            $limited = "Tue"
        } elseif ( ($value -eq "Wed") -or ($value -eq "Wednesday") ) {
            $limited = "Wed"
        } elseif ( ($value -eq "Thu") -or ($value -eq "Thursday") ) {
            $limited = "Thu"
        } elseif ( ($value -eq "Fri") -or ($value -eq "Friday") ) {
            $limited = "Fri"
        } else {
            $limited = [Datetime]::Parse($limited)
        }

        $($csv | Where-Object { $_.id -eq $id }).limited = $limited
    }

    $csv | Export-Csv -Path $filePath -Encoding UTF8 -NoTypeInformation
}