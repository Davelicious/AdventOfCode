#day03
function x2020_03a ($inp)
{
    $trees = 0
    $jump = 3
    $posX = 0
    $linelength = 0
 
    :outer foreach ($item in $inp)
    {
        if ($linelength -eq 0)
        { $linelength = $item.Length }
        else
        {
            $posX = ($posX + $jump) % $linelength
            if ($item.ToCharArray()[$posX] -eq '#')
            { $trees++ }
        }
    }
    Write-Output("Trees: " + $trees)
}

function x2020_03b ($inp)
{
    $trees = 0
    $treesTotal = 1
    $jumps = @((1,1),(3,1),(5,1),(7,1),(1,2))
    $posX = 0
    $line = 0
    $linelength = 0
 
    :outer foreach ($jump in $jumps)
    {
        $trees = 0
        $posX = 0
        $line = 0
        $linelength = 0
        :inner foreach ($item in $inp)
        {
            if ($linelength -eq 0)
            { $linelength = $item.Length }
            else
            {
                $line++;
                if($line -eq $jump[1])
                {
                    $line = 0
                    $posX = ($posX + $jump[0]) % $linelength
                    if ($item.ToCharArray()[$posX] -eq '#')
                    { $trees++ }
                }
            }
        }
        Write-Output("Trees[" + $jump[0] + "," + $jump[1] + "]: " + $trees)
        $treesTotal *= $trees
    }
    Write-Output("TreesTotal: " + $treesTotal)
}



##Day03
$input = Get-Content "input_03.txt"
x2020_03a($input)
x2020_03b($input)
