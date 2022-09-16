#find/replace text in a filename

ls *.pdf | Rename-Item -NewName {$_.name -replace "Fiscal2022-2023","EOY2022-2023"}

Get-ChildItem *.pdf | Rename-Item -NewName { $_.Name -replace ' ','' }

#recurses folder and finds all *.pdfs and copies them to another folder

dir -Path "H:\Home Docs" -Filter *.pdf -Recurse | ForEach-Object { Copy-Item $_.FullName "E:\New Home Docs" }

#gets file name information from txt file, loops through each file name and copies it to a directory
get-content diff.txt | foreach-object { copy-item -Path $_ -Destination "c:\files"}
