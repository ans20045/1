@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Server 2019 By 卐ヅANASヅ卍" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
curl -O https://raw.githubusercontent.com/ans2004/RDP/main/FILES/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Telegram.exe" "https://raw.githubusercontent.com/ans2004/RDP/main/FILES/Telegram.exe" > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" "https://raw.githubusercontent.com/ans2004/RDP/main/FILES/FastConfigVPS_v5.1.exe" > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\winrar_SETUP.exe" "https://raw.githubusercontent.com/ans2004/RDP/main/FILES/winrar-x64-602ar.exe" > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\HTTP BY ANAS.txt" "https://api.proxyscrape.com/v2/?request=getproxies&protocol=http&timeout=10000&country=all&ssl=all&anonymity=all" > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\SOCKS4 BY ANAS.txt" "https://api.proxyscrape.com/v2/?request=getproxies&protocol=socks4&timeout=10000&country=all&simplified=true" > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\SOCKS5 BY ANAS.txt" "https://api.proxyscrape.com/v2/?request=getproxies&protocol=socks5&timeout=10000&country=all" > out.txt 2>&1
net user administrator @ans2004123 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul

echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, be sure NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels "
echo User: Administrator
echo Pass: @ans2004123
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ping -n 10 127.0.0.1 >nul
