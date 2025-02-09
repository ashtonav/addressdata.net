Set-StrictMode -Version Latest

# This script:
#  - Looks in csv\Country\State\City.csv
#  - Creates Databases\Country.db for each Country
#  - Inserts each City.csv as a table named "City, State"
#  - Enables FTS on that table for all columns

# 1) Identify the script's directory
$ScriptDir    = Split-Path $MyInvocation.MyCommand.Definition -Parent

# 2) Hard-coded Input and Output folders
$SourceFolder = Join-Path $ScriptDir "csv"
$OutputFolder = Join-Path $ScriptDir "databases"

Write-Host "Source (Input) Folder: $SourceFolder"
Write-Host "Output Folder:         $OutputFolder"
Write-Host ""

# 3) Ensure Input folder exists
if (!(Test-Path $SourceFolder)) {
    Write-Host "ERROR: 'csv' folder not found at: $SourceFolder"
    return
}

# 4) Ensure Output folder exists
if (!(Test-Path $OutputFolder)) {
    Write-Host "Creating 'databases' folder at: $OutputFolder"
    New-Item -ItemType Directory -Path $OutputFolder | Out-Null
}

# 5) Check sqlite-utils is on the PATH
if (-not (Get-Command "sqlite-utils" -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: 'sqlite-utils' is not on the PATH. Install via 'pip install sqlite-utils' and retry."
    return
}

# Get all country folders
$countries = Get-ChildItem -Path $SourceFolder -Directory

foreach ($country in $countries) {
    Write-Host "=== Country: $($country.Name) ==="

    # Construct a single .db file named after the country
    $safeCountryName = $country.Name
    $countryDbName   = "$safeCountryName.db"
    $countryDbPath   = Join-Path $OutputFolder $countryDbName

    # If the DB file already exists (from a previous run), remove it
    if (Test-Path $countryDbPath) {
        Write-Host "Removing old database: $countryDbPath"
        Remove-Item $countryDbPath
    }

    # Gather all "states" under the country
    $states = Get-ChildItem -Path $country.FullName -Directory

    foreach ($state in $states) {
        Write-Host "  State: $($state.Name)"

        # Find all CSV files in this state folder
        # If cities are in deeper folders, consider adding -Recurse
        $csvFiles = Get-ChildItem -Path $state.FullName -Filter *.csv -File

        foreach ($csvFile in $csvFiles) {
            # City name = CSV filename (minus extension)
            $cityName   = [System.IO.Path]::GetFileNameWithoutExtension($csvFile.Name)
            $safeCity   = $cityName
            $safeState  = $state.Name

            # The table name should be "City, State"
            $tableName  = "$safeCity`, $safeState"

            Write-Host "    Creating/Updating $countryDbName -> Table: $tableName"

            # 1) Insert the CSV data into the table
            & sqlite-utils `
                insert $countryDbPath `
                $tableName `
                $csvFile.FullName `
                --csv

            # 2) Enable FTS on the newly inserted table
           # Write-Host "    Enabling FTS on table: $tableName"
           # & sqlite-utils `
           #     enable-fts $countryDbPath `
           #     $tableName `
           #    "House number" `
           #    "Street name" `
           #    "Postal code" `
           #    "Latitude" `
           #    "Longitude"
        }
        Write-Host ""
    }

    Write-Host ""
}

Write-Host "Done!"
