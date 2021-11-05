# Simple script to provide IPs for EU Pingdom probe servers

$lines = Invoke-RestMethod -Uri "https://my.pingdom.com/probes/feed" -UseBasicParsing | Where-Object {$_.region -eq "EU"} | Select-Object description

foreach ($line in $lines) {
    # 1. IP: 52.48.244.35; Hostname: 52.48.244.35; State: Active; Country: Ireland; City: Dublin
    # 2. IP: 52.48.244.35
    # 3. 52.48.244.35
    $ip = $line.description.Split(";")[0].replace("IP: ", "")
    $ip
}
