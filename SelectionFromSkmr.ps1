function global:selectSkmr($type = "none") {

    $filePath = "C:\Users\endle\myWorkspace\SelectionFromSkmr_byShell\songList.csv"
    $limited = ""
    $csv = $(Import-Csv -Path $filePath -Encoding UTF8)
    $list = New-Object System.Collections.ArrayList
    
    if ( $(Get-Date).DayOfWeek -eq "Tue" ) {
        $limited = "Tue"
    } elseif ( $(Get-Date).DayOfWeek -eq "Wed" ) {
        $limited = "Wed"        
    } elseif ( $(Get-Date).DayOfWeek -eq "Thu" ) {
        $limited = "Thu"        
    } elseif ( $(Get-Date).DayOfWeek -eq "Fri" ) {
        $limited = "Fri"        
    } else {
        $limited = "none"        
    }

    foreach ( $song in $csv ) {
        if ( ($type -eq "pretty") -and ($song.type -eq 1) ) {

            if ( $limited -eq $song.limited -or $song.limited -eq "all" ) {
                [void]$list.add($song)
            } elseif ( $limited -eq "none" ) {
                [void]$list.add($song)
            } else {
                try {
                    if ( $(New-TimeSpan $song.limited $(Get-Date)).Minutes -lt 0 ) {
                        [void]$list.add($song)
                    }
                } catch {}
            }

        } elseif ( ($type -eq "cool") -and ($song.type -eq 2) ) {
            
            if ( $limited -eq $song.limited -or $song.limited -eq "all" ) {
                [void]$list.add($song)
            } elseif ( $limited -eq "none" ) {
                [void]$list.add($song)
            } else {
                try {
                    if ( $(New-TimeSpan $song.limited $(Get-Date)).Minutes -lt 0 ) {
                        [void]$list.add($song)
                    }
                } catch {}
            }

        } elseif ( ($type -eq "active") -and ($song.type -eq 3) ) {
            
            if ( $limited -eq $song.limited -or $song.limited -eq "all" ) {
                [void]$list.add($song)
            } elseif ( $limited -eq "none" ) {
                [void]$list.add($song)
            } else {
                try {
                    if ( $(New-TimeSpan $song.limited $(Get-Date)).Minutes -lt 0 ) {
                        [void]$list.add($song)
                    }
                } catch {}
            }
            
        } elseif ( $type -eq "none" ) {
            
            if ( $limited -eq $song.limited -or $song.limited -eq "all" ) {
                [void]$list.add($song)
            } elseif ( $limited -eq "none" ) {
                [void]$list.add($song)
            } else {
                try {
                    if ( $(New-TimeSpan $song.limited $(Get-Date)).Minutes -lt 0 ) {
                        [void]$list.add($song)
                    }
                } catch {}
            }
            
        }
    }
    $index = $(Get-Random $list.Count)
    $song = $list[$index]

    return $song.title
}