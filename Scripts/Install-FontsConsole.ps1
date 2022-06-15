$FontFiles = @(
"FiraCode-Bold.ttf"
"FiraCode-Light.ttf"
"FiraCode-Medium.ttf"
"FiraCode-Regular.ttf"
"FiraCode-Retina.ttf"
"NanumGothicCoding-Bold.ttf"
"NanumGothicCoding-Regular.ttf"
)

$Shell = New-Object -ComObject Shell.application
$Fonts = $Shell.NameSpace(0x14)
foreach ($FontFile in $FontFiles) {
    $Fonts.CopyHere(".\$FontFile")
}

$isInstalledFiraCode = $false
$isInstalledFiraCodeRetina = $false
$isInstalledNanumGothicCoding = $false
foreach ($font in $Fonts.Items()) {
    if ($font.name -match "Fira Code") { $isInstalledFiraCode = $true }
    if ($font.name -match "Fira Code Retina Medium") { $isInstalledFiraCodeRetina = $true }
    if ($font.name -match "NanumGothicCoding") { $isInstalledNanumGothicCoding = $true }
}

if ($isInstalledFiraCode) {Write-Host "Fira Code Font is installed"}
if ($isInstalledFiraCodeRetina) {Write-Host "Fira Code Retina Font is installed"}
if ($isInstalledNanumGothicCoding) {Write-Host "NanumGothicCoding Font is installed"}

if ( $isInstalledFiraCode -and $isInstalledFiraCodeRetina -and $isInstalledNanumGothicCoding) {
    Start-Process -FilePath C:\Windows\regedit.exe -ArgumentList "/s", ".\Console_TrueTypeFont.reg"
    Start-Process -FilePath C:\Windows\regedit.exe -ArgumentList "/s", ".\Current_User_Console.reg"
}