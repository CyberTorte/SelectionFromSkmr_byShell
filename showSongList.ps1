function global:showSongSkmr($type = "none", $today) {

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

    if ($today) {
        foreach ( $line in $csv ) {
            $song = New-Object PSObject | Select-Object id,title 
            if ( ($type -eq "pretty") -and ($line.type -eq 1) ) {

                if ( $limited -eq $line.limited -or $line.limited -eq "all" ) {
                    $song.id = $line.id
                    $song.title = $line.title
                    [void]$list.add($song)
                } elseif ( $limited -eq "none" ) {
                    $song.id = $line.id
                    $song.title = $line.title
                    [void]$list.add($song)
                } else {
                    try {
                        if ( $(New-TimeSpan $line.limited $(Get-Date)).Minutes -lt 0 ) {
                            $song.id = $line.id
                            $song.title = $line.title
                            [void]$list.add($song)
                        }
                    } catch {}
                }

            } elseif ( ($type -eq "cool") -and ($line.type -eq 2) ) {
                
                if ( $limited -eq $line.limited -or $line.limited -eq "all" ) {
                    $song.id = $line.id
                    $song.title = $line.title
                    [void]$list.add($song)
                } elseif ( $limited -eq "none" ) {
                    $song.id = $line.id
                    $song.title = $line.title
                    [void]$list.add($song)
                } else {
                    try {
                        if ( $(New-TimeSpan $line.limited $(Get-Date)).Minutes -lt 0 ) {
                            $song.id = $line.id
                            $song.title = $line.title
                            [void]$list.add($song)
                        }
                    } catch {}
                }

            } elseif ( ($type -eq "active") -and ($line.type -eq 3) ) {
                
                if ( $limited -eq $line.limited -or $line.limited -eq "all" ) {
                    $song.id = $line.id
                    $song.title = $line.title
                    [void]$list.add($song)
                } elseif ( $limited -eq "none" ) {
                    $song.id = $line.id
                    $song.title = $line.title
                    [void]$list.add($song)
                } else {
                    try {
                        if ( $(New-TimeSpan $line.limited $(Get-Date)).Minutes -lt 0 ) {
                            $song.id = $line.id
                            $song.title = $line.title
                            [void]$list.add($song)
                        }
                    } catch {}
                }
                
            } elseif ( $type -eq "none" ) {
                
                if ( $limited -eq $line.limited -or $line.limited -eq "all" ) {
                    $song.id = $line.id
                    $song.title = $line.title
                    [void]$list.add($song)
                } elseif ( $limited -eq "none" ) {
                    $song.id = $line.id
                    $song.title = $line.title
                    [void]$list.add($song)
                } else {
                    try {
                        if ( $(New-TimeSpan $line.limited $(Get-Date)).Minutes -lt 0 ) {
                            $song.id = $line.id
                            $song.title = $line.title
                            [void]$list.add($song)
                        }
                    } catch {}
                }
                
            }
        }
    } else {
        foreach ($line in $csv) {
            $song = New-Object PSObject | Select-Object id,title 
            $song.id = $line.id
            $song.title = $line.title
            [void]$list.add($song)
        }
    }

    return $list
}