ls *.pdf | Rename-Item -NewName {$_.name -replace "Reading2022-2023","ELAReading2022-2023"}
