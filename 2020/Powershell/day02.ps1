#day02
function x2020_02a ($inp)
{
    $validPwds = 0
    $invalidPwds = 0
 
    :outer foreach ($item in $inp) # -split @(" ")) #-Split "`r`n" #[Environment]::NewLine
    {
        #Write-Output($item)
        $chopped = ($item -split "-|: | ")
        $pwd = $chopped[3]
        $minLength = [int]$chopped[0]
        $maxLength = [int]$chopped[1]
        $pwdchar = $chopped[2]
 
        $charCount = ($pwd.ToCharArray() -eq $pwdchar).count
        if (($charCount -ge $minLength) -and ($charCount -le $maxLength))
        {$validPwds++} else {$invalidPwds++}
    }
    Write-Output("Valid Passwords: " + $validPwds)
    Write-Output("InValid Passwords: " + $invalidPwds)
}

function x2020_02b ($inp)
{
    $validPwds = 0
    $invalidPwds = 0
 
    :outer foreach ($item in $inp) # -split @(" ")) #-Split "`r`n" #[Environment]::NewLine
    {
        #Write-Output($item)
        $chopped = ($item -split "-|: | ")
        $pwd = $chopped[3]
        $pos1 = [int]$chopped[0]
        $pos2 = [int]$chopped[1]
        $pwdchar = $chopped[2]
        #Write-Output(($pwd[$pos1-1]) + ":" + ($pwd[$pos2-1]))
 
        if (($pwd[$pos1-1] -eq $pwdchar) -xor ($pwd[$pos2-1] -eq $pwdchar))
        {$validPwds++} else {$invalidPwds++}
    }
    Write-Output("Valid Passwords: " + $validPwds)
    Write-Output("InValid Passwords: " + $invalidPwds)
}



#Day02
$input = Get-Content "input_02.txt"
x2020_02a($input)
x2020_02b($input)
