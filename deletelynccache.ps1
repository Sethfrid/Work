stop-process -ProcessName lync
stop-process -ProcessName OUTLOOK
remove-item -path $env:UserProfile\AppData\Local\Microsoft\Office\15.0\Lync\*.com -Recurse -Force
Start-Process -FilePath "C:\Program Files (x86)\Microsoft Office\Office15\lync.exe"
Start-Process -FilePath "C:\Program Files (x86)\Microsoft Office\Office14\outlook.exe"
#Start-Process -FilePath "C:\Program Files (x86)\Microsoft Office\Office15\outlook.exe"
