#day06
function x2020_06a ($inp)
{
    $YesCount = 0
    $YestotalCount = 0
    $data = ""
     
    :outer foreach ($item in $inp)
    {
        $data += $item
        if(!$item)
        {
            $YesCount = ($data.ToCharArray() | select -Unique).Count
            $YestotalCount += $YesCount
            $data = ""
        }
    }
    Write-Output("#YestotalCount: " +$YestotalCount)
}

function x2020_06b ($inp)
{
    $YesCount = 0
    $YestotalCount = 0
    $data = @()
    $skip = $false #skip if 0 count
     
    :outer foreach ($item in $inp)
    {
        if($item)
        {
            if (!$skip)
            {
                if (!$data) 
                {
                    $data = $item.ToCharArray()
                }
                else
                {
                    $data = (Compare-Object $data $item.ToCharArray() -IncludeEqual -ExcludeDifferent -PassThru)
                    $skip = ($data.Count -eq 0)
                }
            }
        } else
        { 
            $YesCount = ($data).Count
            $YestotalCount += $YesCount
            $data =  @()
            $skip = $false
        }
    }
    Write-Output("#YestotalCount: " +$YestotalCount)
}




##Day06
$input = Get-Content "input_06.txt"
#$input = Get-Content "input_06_test.txt"
x2020_06a($input)
x2020_06b($input)
