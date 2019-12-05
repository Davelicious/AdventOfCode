function x2019_04ab ([string]$inp)
{
    [int]$min = $inp.Split("-")[0];
    [int]$max = $inp.Split("-")[1];
 
    [int]$validCount = 0;
    [int]$validCount2 = 0;
    [array]$validpwds = $null;
    [array]$validpwds2 = $null;
 
    #foreach ($pwd in $inp -split "\r?\n")
    for ($pwd = $min; $pwd -lt $max; $pwd++)
    {
        [bool]$valid = $true;
        [bool]$doubledigit = $false;
        [bool]$doubledigit2 = $false;
        [string]$strpwd = $pwd;
 
        :inner for ($i = 0; $i -lt 5; $i++)
        {
            if ($strpwd[$i] -gt $strpwd[$i+1]) { $valid = $false; break inner;}
            if ($strpwd[$i] -eq $strpwd[$i+1])
            {
                $doubledigit = $true;

                [int]$repeatsize = 2;
                for ($j = ($i+1); $j -lt 5; $j++)
                {
                    if ($strpwd[$j] -eq $strpwd[$j+1])
                    {
                        $repeatsize++;
                    }
                    else 
                    { break; }
                }
                
                if ($repeatsize -eq 2)
                { $doubledigit2 = $true }

                if ($repeatsize -gt 2)
                { $i += $repeatsize -2 ; }
                #else
                #{ $valid = $false; echo $pwd; break inner; }
               
            }
        }
 
        if($valid -and $doubledigit)
            { $validCount++; $validpwds += $pwd}
        if($valid -and $doubledigit2)
            { $validCount2++; $validpwds2 += $pwd}
 
    }


    echo "# Valid passwords (Part1):  $validCount"
    #echo $validpwds
   
    echo "# Valid passwords (Part2):  $validCount2"
 
    echo ""
}
 
 
 
x2019_04ab "147981-691423"
