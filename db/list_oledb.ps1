foreach ($provider in [System.Data.OleDb.OleDbEnumerator]::GetRootEnumerator())
{
    $v = New-Object PSObject
    for ($i = 0; $i -lt $provider.FieldCount; $i++)
    {
        Add-Member -in $v NoteProperty $provider.GetName($i) $provider.GetValue($i)
    }
    $v | Select SOURCES_NAME, SOURCES_DESCRIPTION
}
