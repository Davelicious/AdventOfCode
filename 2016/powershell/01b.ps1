function x2016_01b ([string]$inp)
{
    $bmp = New-Object System.Drawing.Bitmap(1000, 1000)
    $CoordX = 0;
    $CoordY = 0;
    $Pos = 0; #0=N 1=E 2=S 3=W
    [array]$Path = $null
 
    $bmp.SetPixel($CoordX+500,$CoordY+500,"red")

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
            0 { #North
                for ($i = 1; $i -le $elem.Substring(1); $i++)
                {
                    [array]$Path += "$CoordX,$($CoordY+$i)"
                    $xx = 500+$CoordX
                    $yy = 500-$CoordY-$i
                    $bmp.SetPixel($xx,$yy,"blue")
                }
                $CoordY += $elem.Substring(1);
            }

            1 { #East
                for ($i = 1; $i -le $elem.Substring(1); $i++)
                {
                    [array]$Path += "$($CoordX+$i),$CoordY"
                    $xx = 500+$CoordX+$i
                    $yy = 500-$CoordY
                    $bmp.SetPixel($xx,$yy,"green")
                }
                $CoordX += $elem.Substring(1);
            }

            2 { #South
                for ($i = 1; $i -le $elem.Substring(1); $i++)
                {
                    [array]$Path += "$CoordX,$($CoordY-$i)"
                    $xx = 500+$CoordX
                    $yy = 500-$CoordY+$i
                    $bmp.SetPixel($xx,$yy,"orange")
                }
                $CoordY -= $elem.Substring(1);
            }

            3 { #West
                for ($i = 1; $i -le $elem.Substring(1); $i++)
                {
                    [array]$Path += "$($CoordX-$i),$CoordY"
                    $xx = 500+$CoordX-$i
                    $yy = 500-$CoordY
                    $bmp.SetPixel($xx,$yy,"yellow")
                }
                $CoordX -= $elem.Substring(1);
            }
        }
        #echo "$elem | $pos | x: $CoordX | y: $CoordY | Dist: $([math]::Abs($CoordX) + [math]::Abs($CoordY))"
    }

    echo "Distance of endpoint:  $([math]::Abs($CoordX) + [math]::Abs($CoordY)) "

    :outer for ($i = 1; $i -lt $Path.Length; $i++)
    {
        :inner for ($j = 0; $j -lt $i; $j++)
        {
            if ($Path[$i] -eq $Path[$j])
            {
                echo "Distance of first crossing:  $([math]::Abs($Path[$i].split(",")[0]) + [math]::Abs($Path[$i].split(",")[1])) "
                break outer
            }
        }
     }

    $bmp.Save("bmp.bmp")
    #OpenWith ("c:\temp\bmp.bmp")
    OpenWith ($pwd.path+"\"+"bmp.bmp")

}


x2016_01b "L4, L1, R4, R1, R1, L3, R5, L5, L2, L3, R2, R1, L4, R5, R4, L2, R1, R3, L5, R1, L3, L2, R5, L4, L5, R1, R2, L1, R5, L3, R2, R2, L1, R5, R2, L1, L1, R2, L1, R1, L2, L2, R4, R3, R2, L3, L188, L3, R2, R54, R1, R1, L2, L4, L3, L2, R3, L1, L1, R3, R5, L1, R5, L1, L1, R2, R4, R4, L5, L4, L1, R2, R4, R5, L2, L3, R5, L5, R1, R5, L2, R4, L2, L1, R4, R3, R4, L4, R3, L4, R78, R2, L3, R188, R2, R3, L2, R2, R3, R1, R5, R1, L1, L1, R4, R2, R1, R5, L1, R4, L4, R2, R5, L2, L5, R4, L3, L2, R1, R1, L5, L4, R1, L5, L1, L5, L1, L4, L3, L5, R4, R5, R2, L5, R5, R5, R4, R2, L1, L2, R3, R5, R5, R5, L2, L1, R4, R3, R1, L4, L2, L3, R2, L3, L5, L2, L2, L1, L2, R5, L2, L2, L3, L1, R1, L4, R2, L4, R3, R5, R3, R4, R1, R5, L3, L5, L5, L3, L2, L1, R3, L4, R3, R2, L1, R3, R1, L2, R4, L3, L3, L3, L1, L2"
