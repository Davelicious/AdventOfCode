function x2019_02a ([string]$inp,[int]$noun,[int]$verb)
{
    $codes = $inp -split ","
    $codes[1] = $noun;
    $codes[2] = $verb;
    

    :outer for ($i = 0; $i -lt $codes.Length; $i += 4)
    { 
    #echo "code: $($codes)";
        [int]$o = $codes[$i]
        [int]$x = $codes[$i+1]
        [int]$y = $codes[$i+2]
        [int]$p = $codes[$i+3]

        Switch -Exact ($o)
        {
            1 { #Add
                $codes[$p] = [int]$codes[$x] + [int]$codes[$y];
            }

            2 { #Multiply
                $codes[$p] = [int]$codes[$x] * [int]$codes[$y];
            }

            99 { #End
                break outer:
            }
        }
        if ([int]$codes[$p] -eq $checkval)
        {
            
        }
    }
    return [int]$codes[0];
    #echo "code: $($codes[0])";
}



function x2019_02b ([string]$inp)
{
    [int]$checkval = 19690720;
    for ($noun = 0; $noun -lt 100; $noun++)
    { 
        for ($verb = 0; $verb -lt 100; $verb++)
        { 
            $result = x2019_02a $inp $noun $verb
            if ($result -eq $checkval)
            {
                echo "code: $($noun * 100 + $verb)";
            }
        }        
    }
}


x2019_02b "1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,6,19,1,9,19,23,2,23,10,27,1,27,5,31,1,31,6,35,1,6,35,39,2,39,13,43,1,9,43,47,2,9,47,51,1,51,6,55,2,55,10,59,1,59,5,63,2,10,63,67,2,9,67,71,1,71,5,75,2,10,75,79,1,79,6,83,2,10,83,87,1,5,87,91,2,9,91,95,1,95,5,99,1,99,2,103,1,103,13,0,99,2,14,0,0"
