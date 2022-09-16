ls *.pdf | Rename-Item -NewName {$_.name -replace "Fiscal2022-2023","EOY2022-2023"}
