# Import JSON from a file

$json_data = Get-Content -Raw -Path nested.json | ConvertFrom-Json

$json_data.name

$json_data.age

$json_data.cars.count

foreach ($car in $json_data.cars) {
    $car.make
}