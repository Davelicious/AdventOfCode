#day05
function x2020_05a ($inp)
{
    $row = 0
    $col = 0
    $seatNr = 0
    $maxSeat = 0
    
    :outer foreach ($item in $inp)
    {
        $rowMin = 0
        $rowMax = 127
        $colMin = 0
        $colMax = 7

        for ($i = 0; $i -le 6; $i++)
        { 
            if($item[$i] -eq 'F') #lower half
            {
                $rowMax -= [int](($rowMax - $rowMin)/2)
                $row = $rowMin
            } else #'B' #upper half
            {
                $rowMin += [int](($rowMax - $rowMin)/2)
                $row = $rowMax
            }
        }
        for ($i = 7; $i -le 9; $i++)
        { 
            if($item[$i] -eq 'L') #lower half
            {
                $colMax -= [int](($colMax - $colMin)/2)
                $col = $colMin
            } else #'R' #upper half
            {
                $colMin += [int](($colMax - $colMin)/2)
                $col = $colMax
            }            
        }
        $seatNr = $row*8 +$col
        if ($seatNr -gt $maxSeat) {$maxSeat = $seatNr}
        #Write-Output( "$item > $row : $col : $seatNr")
    }
    Write-Output("#maxSeat: " + $maxSeat)
}

function x2020_05b ($inp)
{
    #$seats = New-Object int[] 1024 #created array of 1024 elements filled with 0
    $seats = [int[]]::new(1024) #created array of 1024 elements filled with 0
    $row = 0
    $col = 0
    $seatNr = 0
    $maxSeat = 0
    
    :outer foreach ($item in $inp)
    {
        $rowMin = 0
        $rowMax = 127
        $colMin = 0
        $colMax = 7

        for ($i = 0; $i -le 6; $i++)
        { 
            if($item[$i] -eq 'F') #lower half
            {
                $rowMax -= [int](($rowMax - $rowMin)/2)
                $row = $rowMin
            } else #'B' #upper half
            {
                $rowMin += [int](($rowMax - $rowMin)/2)
                $row = $rowMax
            }
        }
        for ($i = 7; $i -le 9; $i++)
        { 
            if($item[$i] -eq 'L') #lower half
            {
                $colMax -= [int](($colMax - $colMin)/2)
                $col = $colMin
            } else #'R' #upper half
            {
                $colMin += [int](($colMax - $colMin)/2)
                $col = $colMax
            }            
        }
        $seatNr = $row*8 +$col
        $seats[$seatNr] = $seatNr
        if ($seatNr -gt $maxSeat) {$maxSeat = $seatNr}
        #Write-Output( "$item > $row : $col : $seatNr")
    }
    for ($i = 1; $i -lt 1023; $i++)
    { 
        if($seats[$i] -eq 0)
        {
            if(($seats[$i-1] -ne 0) -and ($seats[$i+1] -ne 0))
            { Write-Output("Free: $i") }
        }
    }
}




##Day05
$input = Get-Content "input_05.txt"
#$input = Get-Content "input_05_test.txt"
x2020_05a($input)
x2020_05b($input)
