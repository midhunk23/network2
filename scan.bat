@echo off
echo Welcome to Simple Nmap Bash Scanner
set /p target="Enter the target IP or domain: "
set filename=results\%target%_scan.txt

if not exist results mkdir results
echo Scanning host: %target%
echo Results will be saved in %filename%

echo Running Ping Scan... > %filename%
nmap -sn %target% >> %filename%

echo. >> %filename%
echo Running Port Scan... >> %filename%
nmap -p- %target% >> %filename%

echo. >> %filename%
echo Running OS Detection and Service Version Scan... >> %filename%
nmap -A %target% >> %filename%

echo.
echo Scan completed. Check the file: %filename%
