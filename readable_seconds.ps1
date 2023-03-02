####################################################
# AUTHOR:	F.Bischof (info@meer-web.nl)           #
# VERSION:	1.0.1								   #
# DATE:		01-03-2023							   #
####################################################

if (!$ARGS[0]) {
    Write-Host "Please submit the number of seconds"
    exit
} else {
    $NUMBER = $ARGS[0]
}

function recalc {
    # Days
    if ($NUMBER -ge 86400) {
        $DAYS = [math]::floor($NUMBER / 86400)
        $NUMBER = $NUMBER - ($DAYS * 86400)
    } else {
        $DAYS = 0
    }

    # Hours
    if ($NUMBER -ge 3600) {
        $HOURS = [math]::floor($NUMBER / 3600)
        $NUMBER = $NUMBER - ($HOURS * 3600)
    } else {
        $HOURS = 0
    }

    # Minutes
    if ($NUMBER -ge 60) {
        $MINUTES = [math]::floor($NUMBER / 60)
        $NUMBER = $NUMBER - ($MINUTES * 60)
    } else {
        $MINUTES = 0
    }

    # Seconds
    $SECONDS = $NUMBER

    # Add all to array
    $NUMBER = @($DAYS, $HOURS, $MINUTES, $SECONDS)
    
    Return $NUMBER
}

$NUMBER = recalc

# Output
Write-Host "Days:" $NUMBER[0]
Write-Host "Hours:" $NUMBER[1]
Write-Host "Minutes:" $NUMBER[2]
Write-Host "Seconds:" $NUMBER[3]
Write-Host "$NUMBER[0]:$NUMBER[1]:$NUMBER[2]:$NUMBER[3]"