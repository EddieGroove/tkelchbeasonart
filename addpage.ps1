Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
$Image = $FileBrowser.ShowDialog()

$Artwork = Read-Host -Prompt 'Name your piece of artwork'
$Size = Read-Host -Prompt 'Enter the size in format (9 x 11)'
$Medium = Read-Host -Prompt 'Enter medium e.g. copic market, gel pen'

$PageName = $Artwork -replace '\s','_'
Move-Item -Path $FileBrowser.FileName -Destination C:\Users\clayt\tkelchbeasonart\artwork\$PageName.jpg

New-Item .\tkelchbeasonart\pages\$PageName.html