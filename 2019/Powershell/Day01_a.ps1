function x2019_01a ([string]$modules)
{
    [int]$result = 0;

    foreach($module in $modules -split "\r?\n")
    {
        $result += [Math]::Floor($module / 3) - 2;
    }
    return $result
}

x2019_01a @"
73617
104372
131825
85022
105514
"@
