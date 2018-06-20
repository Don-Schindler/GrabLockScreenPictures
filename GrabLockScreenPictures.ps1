# This script will COPY all the lock screen pictures for Win10 to a new directory, adding the .JPG extension, and overwriting any duplicates.
# Don Schindler 8/5/2016
#
#
#This is the path to the assets:
# C:\Users\<Current User>\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets
$strCurrentUserPath = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"
#
#Now need a path to where you want to put them...
Add-Type -AssemblyName System.Windows.Forms
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
    RootFolder = 'Desktop'
}
[void]$FolderBrowser.ShowDialog()
$strDestPath = $FolderBrowser.SelectedPath

$FileList = Get-ChildItem $strCurrentUserPath
ForEach ($File in $FileList) {
    Write-Host $File
    $NewFileName = "$strDestPath\$File" + ".jpg"
    Copy-Item $File.FullName -Destination $NewFileName -Force 
    
}
# End of Program
