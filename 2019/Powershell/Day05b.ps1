function x2019_05b ([string]$inp)
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

        [int]$x = $codes[$i+1]; #0: position mode
        if($oppCodes[0] -eq 1) { [int]$x = $i+1; } #1: immediate mode
        [int]$y = $codes[$i+2]; #0: position mode
        if($oppCodes[1] -eq 1) { [int]$y = $i+2; } #1: immediate mode
        [int]$p = $codes[$i+3]; #0: position mode
        if($oppCodes[2] -eq 1) { [int]$p = $i+3; } #1: immediate mode


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

            3 { #Input (store input at address [param1])
                $val = read-host "provide input";
                $codes[$x] = [int]$val;
            }

            4 { #Output (return value from address [param1])
                Write-Host "Val[$x]; $([int]$codes[$x])";
            }

            5 { #jump-if-true (param1 != 0)
                if ([int]$codes[$x] -ne 0)
                {
                    $i = [int]$codes[$y]-3;
                }
                $i++;
            }

            6 { #jump-if-false (param1 == 0)
                if ([int]$codes[$x] -eq 0)
                {
                    $i = [int]$codes[$y]-3;
                }
                $i++;
            }

            7 { #less than (param1 < param2) store 1 or 0 at address [param3]
                if ([int]$codes[$x] -lt [int]$codes[$y])
                {
                    $codes[$p] = 1;
                }
                else
                {
                    $codes[$p] = 0;
                }
                $i += 2;
            }

            8 { #equals (param1 == param2) store 1 or 0 at address [param3]
                if ([int]$codes[$x] -eq [int]$codes[$y])
                {
                    $codes[$p] = 1;
                }
                else
                {
                    $codes[$p] = 0;
                }
                $i += 2;
            }

            99 { #End
                break outer:
            }
        }
    }
    #echo "code: $($codes[0])";
}

[string]$x = Get-Content "c:\tmp\input"
x2019_05b $x
