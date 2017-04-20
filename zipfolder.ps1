<#The rar.exe is needed in the same location as to where the archiving will take place
 Takes toldest 5 folders and creates split volume archiving of 250MB  size.
#>
$folder = read-host 'Enter folder location'

$Data = (get-childitem $folder -directory | sort LastWriteTime -Descending | select-object -Last 5).Name

ForEach ($file in $Data)

{

%{&$folder\RAR.exe a -r -ai -v250m $folder\$file.rar $File}

}

 
