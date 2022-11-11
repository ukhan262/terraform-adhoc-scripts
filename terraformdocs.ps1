Remove-Item .\README.md

$currentLocation = Split-Path -Path (Get-Location) -Leaf



$masterMdContent = @()
$masterMdContent += "# Parent Content: $currentLocation"
$masterMdContent += terraform-docs markdown . --show providers --show modules --show resources



terraform init
cd .\.terraform\modules


$currentDir = Get-ChildItem -Directory
$currentDir


foreach($dir in $currentDir) {
    $dirName = $dir.Name
    cd $dir.Name
    $masterMdContent += "# Sub-Module: $dirName"
    $masterMdContent += terraform-docs markdown . --show providers --show modules --show resources
    cd ..
}



cd ..
cd ..



$masterMdContent | out-file README.md
