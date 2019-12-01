function x2019_01b ([string]$modules)
{
    [int]$result = 0;

    foreach($module in $modules -split "\r?\n")
    {
        [int]$subResult = $module;
        while ($subResult -gt 0)
        {
            $subResult = [Math]::Floor($subResult / 3) - 2;
            if ($subResult -gt 0)
            {
                $result += $subResult
            }
        }
        
    }
    return $result
}

x2019_01b @"
73617
104372
131825
85022
105514
"@
