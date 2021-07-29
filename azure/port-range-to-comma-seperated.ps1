# Genarate comma seperated port range for fw ri;es
$range_start = 60000
$range_end = 60100

$csv = ""

for ($i = $range_start; $i -lt $range_end; $i++) {
    $csv += "$i,"
}

$csv += $range_end

$csv