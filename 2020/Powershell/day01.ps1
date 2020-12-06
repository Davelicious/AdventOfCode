#day01
function x2020_01a ($inp)
{
    :outer foreach ($item in $inp) # -split " ") #-Split "`r`n" #[Environment]::NewLine
    {
        #Write-Output($item)
        :inner foreach ($item2 in $inp ) #-split " ")
        {
            if (([int]$item + [int]$item2) -eq 2020)
            {
                Write-Output($item + "+" + $item2 + " = " + ([int]$item + [int]$item2) + " = " +  ([int]$item * [int]$item2))
                exit #break inner
            }
        }
    }
}

function x2020_01b ($inp)
{
    :outer foreach ($item in $inp) # -split @(" ")) #-Split "`r`n" #[Environment]::NewLine
    {
        #Write-Output($item)
        :inner1 foreach ($item2 in $inp ) #-split @(" "))
        {
            #Write-Output($item)
            :inner2 foreach ($item3 in $inp ) #-split @(" "))
            {
                if (([int]$item + [int]$item2 + [int]$item3) -eq 2020)
                {
                    Write-Output($item + "+" + $item2 + "+" + $item3 + " = " + ([int]$item + [int]$item2 + [int]$item3) + " = " +  ([int]$item * [int]$item2 * [int]$item3))
                    exit #break inner2
                }
            }
        }
    }
}



##Day01
$input = Get-Content "input_01.txt"
x2020_01a($input)
x2020_01b($input)
