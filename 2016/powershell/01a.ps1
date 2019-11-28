function x2016_01a ([string]$inp)
{
    $CoordX = 0;
    $CoordY = 0;
    $Pos = 0; #0=N 1=E 2=S 3=W

    foreach($elem in $inp -split ", ")
    {
        if ($elem.StartsWith("R") )
        {
            $Pos = (++$Pos) % 4
        } elseif ($elem.StartsWith("L") )
        {
            $Pos = ($Pos +3) % 4
        }

        Switch -Exact ($Pos)
        {
            0 {
                $CoordY += $elem.Substring(1);
            }
            1 {
                $CoordX += $elem.Substring(1);
            }
            2 {
                $CoordY -= $elem.Substring(1);
            }
            3 {
                $CoordX -= $elem.Substring(1);
            }
        }
        #echo "$elem | $pos | x: $CoordX | y: $CoordY | Dist: $([math]::Abs($CoordX) + [math]::Abs($CoordY))"
    }
    echo "x:  $CoordX"
    echo "y:  $CoordY"
    echo "Distance:  $([math]::Abs($CoordX) + [math]::Abs($CoordY)) "
}



x2016_01a "L4, L1, R4, R1, R1, L3, R5, L5, L2, L3, R2, R1, L4, R5, R4, L2, R1, R3, L5, R1, L3, L2, R5, L4, L5, R1, R2, L1, R5, L3, R2, R2, L1, R5, R2, L1, L1, R2, L1, R1, L2, L2, R4, R3, R2, L3, L188, L3, R2, R54, R1, R1, L2, L4, L3, L2, R3, L1, L1, R3, R5, L1, R5, L1, L1, R2, R4, R4, L5, L4, L1, R2, R4, R5, L2, L3, R5, L5, R1, R5, L2, R4, L2, L1, R4, R3, R4, L4, R3, L4, R78, R2, L3, R188, R2, R3, L2, R2, R3, R1, R5, R1, L1, L1, R4, R2, R1, R5, L1, R4, L4, R2, R5, L2, L5, R4, L3, L2, R1, R1, L5, L4, R1, L5, L1, L5, L1, L4, L3, L5, R4, R5, R2, L5, R5, R5, R4, R2, L1, L2, R3, R5, R5, R5, L2, L1, R4, R3, R1, L4, L2, L3, R2, L3, L5, L2, L2, L1, L2, R5, L2, L2, L3, L1, R1, L4, R2, L4, R3, R5, R3, R4, R1, R5, L3, L5, L5, L3, L2, L1, R3, L4, R3, R2, L1, R3, R1, L2, R4, L3, L3, L3, L2, L1"
