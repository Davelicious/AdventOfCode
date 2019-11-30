function x2016_03a ([string]$inp)
{
    [Int]$ValidTriangles = 0;
    [Int]$InValidTriangles = 0;

    foreach($triangle in $inp -split "\r?\n")
    {
        $sides = $triangle -split "\s+";

        [int]$side1 = $sides[1]
        [int]$side2 = $sides[2]
        [int]$side3 = $sides[3]

        if ((($side1 + $side2) -gt $side3) -and (($side1 + $side3) -gt $side2) -and (($side2 + $side3) -gt $side1))
        {
            $ValidTriangles++
        } else
        {
            $InValidTriangles++
        }

    }
    echo "#Valid Triangles: $ValidTriangles"
    echo "#InValid Triangles: $InValidTriangles"
}

 


x2016_03a @"
  883  357  185
  572  189  424
  842  206  272
   55  656   94
  612  375   90
  663  550  179
"@
