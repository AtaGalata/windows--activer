@echo off
chcp 65001
setlocal
cls
fsutil dirty query %SystemDrive% >log.txt || goto UAC
set num = 1
if(num equ 2) (
	:UAC
	echo Yönetici olarak çalıştırın.
	pause
	exit 
	
)
:Start
set /p input="Key Girin: "
cls
echo "| %input% | Aktifleştiriliyor."
slmgr.vbs /ipk "%input%"
slmgr.vbs /skms kms.lotro.cc
slmgr.vbs -ato
cls
echo "| %input% | İşlem Sonlandırıldı. Yeniden Başlatılıyor..."
shutdown /r /t 5 /f /d p:4:1
pause
exit