Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
$Image = $FileBrowser.ShowDialog()

$Path = 'C:\Users\clayt\tkelchbeasonart'
$Artwork = Read-Host -Prompt 'Name your piece of artwork'
$Size = Read-Host -Prompt 'Enter the size in format (9 x 11)'
$Medium = Read-Host -Prompt 'Enter medium e.g. copic market, gel pen'

$PageName = $Artwork -replace '\s','_'
Move-Item -Path $FileBrowser.FileName -Destination $Path\artwork\$PageName.jpg

Copy-Item -Path $Path\pages\template.html -Destination $Path\pages\$PageName.html

$PageContent = Get-Content -Path $Path\pages\$PageName.html
$PageContent = $PageContent -replace 'artworkName', $Artwork
$PageContent = $PageContent -replace 'pictureName', $PageName
$PageContent = $PageContent -replace 'size', $Size
$PageContent = $PageContent -replace 'medium', $Medium

$PageContent | Set-Content -Path $Path\pages\$PageName.html