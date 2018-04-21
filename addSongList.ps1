function global:addSkmr([String]$name, [String]$type = "all", [String]$limited = "all") {
    $filePath = "C:\Users\kbc16\workspace\private\SelectionFromSkmr_byShell\songList.csv"
    $csv = $(Import-Csv -Path $filePath -Encoding UTF8)
    $song = New-Object PSObject | Select-Object id,title,type,limited

    $song.id = $csv.count + 1
    $song.title = $name
    
    if ( ($type -eq "pretty") -or ($type -eq 1) )  {
        $song.type = 1
    } elseif ( ($type -eq "cool") -or ($type -eq 2) ) {
        $song.type = 2
    } elseif ( ($type -eq "active") -or ($type -eq 3) ) {
        $song.type = 3
    } else {
        $song.type = 4
    }

    if ($limited -eq "all") {
        $song.limited = "all"
    }elseif ( ($limited -eq "Tue") -or ($limited -eq "Tuesday") ) {
        $song.limited = "Tue"
    } elseif ( ($limited -eq "Wed") -or ($limited -eq "Wednesday") ) {
        $song.limited = "Wed"
    } elseif ( ($limited -eq "Thu") -or ($limited -eq "Thursday") ) {
        $song.limited = "Thu"
    } elseif ( ($limited -eq "Fri") -or ($limited -eq "Friday") ) {
        $song.limited = "Fri"
    } else {
        $song.limited = [Datetime]::Parse($limited)
    }

    $song | Export-Csv -Path $filePath -Encoding UTF8 -NoTypeInformation -Append
}