#day04
function x2020_04a ($inp)
{
    $passportFields= @("byr","iyr","eyr","hgt","hcl","ecl","pid") #,"cid")
    $validCount = 0
    $passports = 0
    $passportdata = ""
 
    :outer foreach ($item in $inp)
    {
        $passportdata += $item + " "
        if(!$item)
        {
            $passports++
            if (($passportFields | ?{$passportdata -match $_}).count -eq $passportFields.Count)
            {$validCount++} else {Write-Output("false: " + $passportdata)}
            $passportdata = ""
        }
    }
    Write-Output("#Passports: " +$passports)
    Write-Output("#valid IDs: " + $validCount)
}

function x2020_04b ($inp)
{
    $passportFields = @("byr","iyr","eyr","hgt","hcl","ecl","pid") #,"cid")
    $eyeColors = @("amb","blu","brn","gry","grn","hzl","oth")
    $validCount = 0
    $passports = 0
    $passportdata = ""
    $validID= $false
 
    :outer foreach ($item in $inp)
    {
        $passportdata += $item + " "
        if(!$item)
        {
            $passports++
            $validID = $false
            if (($passportFields | ?{$passportdata -match $_}).count -eq $passportFields.Count)
            {
                $validID = $true
                foreach($passitem in ($passportdata -split " "))
                {
                    $passField = $passitem.trim().split(":")[0]
                    $passValue = $passitem.trim().split(":")[1]
                    switch ($passField)
                    {
                        "byr" { if(([int]$passValue -lt 1920) -or ([int]$passValue -gt 2002))
                        {$validID = $false} }                  
                        "iyr" { if(([int]$passValue -lt 2010) -or ([int]$passValue -gt 2020))
                        {$validID = $false} } 
                        "eyr" { if(([int]$passValue -lt 2020) -or ([int]$passValue -gt 2030))
                        {$validID = $false} } 
                        "hgt" {                            
                            if($passValue -notmatch "^\d{2,3}(cm|in)$")
                            {$validID = $false; break;}
                            $length = [int]($passValue -replace "(cm|in)$","")
                            if(($passValue -match "cm$") -and (($length -lt 150) -or ($length -gt 193)))
                            {$validID = $false}
                            if(($passValue -match "in$") -and (($length -lt 59) -or ($length -gt 76)))
                            {$validID = $false}
                        }
                        "hcl" { if($passValue -notmatch "^#(\d|[a-f]){6}$")
                        {$validID = $false} }
                        "ecl" { if($eyeColors -notcontains $passValue)
                        {$validID = $false} }
                        "pid" { if($passValue -notmatch "^\d{9}$")
                        {$validID = $false} }
                        Default {}
                    }
                }
               
            }
            if($validID) {$validCount++}
            $passportdata = ""
        }
    }
    Write-Output("#Passports: " +$passports)
    Write-Output("#valid IDs: " + $validCount)
}



##Day04
$input = Get-Content "input_04.txt"
x2020_04a($input)
x2020_04b($input)
