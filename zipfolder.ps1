#The rar.exe is needed

$folder = read-host 'Enter folder location'

$Data = (get-childitem $folder -directory | sort LastWriteTime -Descending | select-object -Last 5).Name

ForEach ($file in $Data)

{

%{&$folder\RAR.exe a -r $folder\$file.rar $File}

}

 
