

# read file and upate value in file using powershell
(Get-Content c:\temp\test.txt).replace('[MYID]', 'MyValue') | Set-Content c:\temp\test.txt



# if you want to delete the file older than 7 days or more here is powershell
$limit = (Get-Date).AddDays(-7)
$path = "C:\inetpub\wwwroot\Images\tmpImages"

# Delete files older than the $limit.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force

# Delete any empty directories left behind after deleting the old files.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse
