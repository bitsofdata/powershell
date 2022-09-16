#Script that builds out custom csv/txt file and zips result together with other files  

#Builds File
$path1 = Get-Location

function BuildMapFile {

    #Resets idlink.txt file and temporary element file
    if (test-path -path $path1\idtemp.txt) {
        Remove-Item -Path $path1\idtemp.txt
    }
    if (test-path -path $path1\idinfo.txt) {
        Remove-Item -Path $path1\idinfo.txt
    }

    #Param init
    
    $data = get-childitem -filter *.jpg -LiteralPath $path1 | Select-Object -ExpandProperty Name | Out-File "$path1\idtemp.txt"  #Sets temp element file
    $temp = get-content "$path1\idtemp.txt" #Gets element info
    $filepath = "$path1\idinfo.txt"

    #iterates each element entry and custom formats each line and appends to the idinfo.txt file

    foreach ($line in $temp) { 
        Write-Output($line.substring(0, 10) + "," + $line) | Out-File $filepath -Append 
    }


}

#Compress Files

function CompressBot {


    $compress = @{
        Path             = "$path1\idinfo.txt", "$path1\*.jpg"
        CompressionLevel = "Fastest"
        DestinationPath  = "$path1\files.Zip"
    }
    Compress-Archive @compress -Force

}


#Function call to Build the Patron Map File
BuildMapFile
#Function call to Zip photos and map file
CompressBot



