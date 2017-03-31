<#
1.       Ability to take an input (UNC Path/Folder Name)
2.       Get all the directories in the specified folder and choose the oldest 5
3.       Use the command line version of winrar to zip the oldest 5 folders using the same name as the folder putting it in the same path

#>

$folder = 'c:\temp'

$Data = (get-childitem $folder -directory | sort LastWriteTime -Descending | select-object -Last 5).Name

ForEach ($file in $Data)

{

%{&$folder\RAR.exe a -r $folder\$file.rar $File}

}

 