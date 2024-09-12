# Set the download folder path
$downloadFolder = "C:\Users\$env:USERNAME\Downloads\PokemonTools"

# Create the download folder if it doesn't exist
if (-Not (Test-Path -Path $downloadFolder)) {
    New-Item -ItemType Directory -Force -Path $downloadFolder
}

# Define the URLs and file names
$tools = @{
    "Lunar IPS"          = "https://fusoya.eludevisibility.org/lips/lips100.zip"
    "AdvanceMap"         = "https://www.romhacking.net/utilities/716/download/"
    "XSE"                = "https://www.pokecommunity.com/attachment.php?attachmentid=61446&d=1228374332"
    "AdvanceText"        = "https://www.pokecommunity.com/attachment.php?attachmentid=45842&d=1171336175"
    "PokePic"            = "https://www.romhacking.net/utilities/489/download/"
    "APE"                = "https://www.pokecommunity.com/attachment.php?attachmentid=71882&d=1243275393"
    "YAPE"               = "https://www.pokecommunity.com/attachment.php?attachmentid=65481&d=1234011234"
    "Sappy"              = "https://www.romhacking.net/utilities/436/download/"
    "HxD"                = "https://mh-nexus.de/downloads/HxDSetup.zip"
    "VisualBoyAdvance"   = "https://www.emulator-zone.com/files/emulators/gba/vba/vba-wx-2.0.2.zip"
    "mGBA"               = "https://github.com/mgba-emu/mgba/releases/download/0.10.1/mgba-0.10.1-win64.7z"
    "TileMolester"       = "https://www.romhacking.net/utilities/115/download/"
    "GBAPatcher"         = "https://www.romhacking.net/utilities/540/download/"
}

# Function to download files
function Download-Tool {
    param (
        [string]$url,
        [string]$fileName
    )

    $outputPath = Join-Path $downloadFolder $fileName
    Write-Host "Downloading $fileName from $url"
    Invoke-WebRequest -Uri $url -OutFile $outputPath
}

# Download each tool
foreach ($tool in $tools.GetEnumerator()) {
    $fileName = "$($tool.Key).zip"
    Download-Tool -url $tool.Value -fileName $fileName
}

Write-Host "All tools downloaded to $downloadFolder"
