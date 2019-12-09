function x2019_05a ([string]$inp)
{
    $codes = $inp -split ","

    :outer for ($i = 0; $i -lt $codes.Length; $i += 2)
    { 
    #echo "code: $($codes)";
        
        $instr = $codes[$i]
        [int]$instrCode = $instr
        [array]$oppCodes = 0,0,0

        if ($instr.Length -gt 2)
        {
            [int]$instrCode = $instr.Substring($instr.Length-2);
            [array]$oppCodebuf = $instr.Substring(0,$instr.Length-2).ToCharArray();
            [array]::Reverse($oppCodebuf);
            for ($j = 0; $j -lt 3; $j++)
            { 
                $oppCodes[$j] = [int]([string]$oppCodebuf[$j]) + 0
            }
        }

        [int]$x = $codes[$i+1];
        if($oppCodes[0] -eq 1) { [int]$x = $i+1; }
        [int]$y = $codes[$i+2];
        if($oppCodes[1] -eq 1) { [int]$y = $i+2; }
        [int]$p = $codes[$i+3];
        if($oppCodes[2] -eq 1) { [int]$p = $i+3; }


        Switch -Exact ($instrCode)
        {
            1 { #Add
                $codes[$p] = [int]$codes[$x] + [int]$codes[$y];
                $i += 2;
            }

            2 { #Multiply
                $codes[$p] = [int]$codes[$x] * [int]$codes[$y];
                $i += 2;
            }

            3 { #Input
                $val = read-host "provide input";
                $codes[$x] = [int]$val;
            }

            4 { #Output
                Write-Host "Val[$x]; $([int]$codes[$x])";
            }


            99 { #End
                break outer:
            }
        }
    }
}

[string]$x = Get-Content "input"
x2019_05a $x
