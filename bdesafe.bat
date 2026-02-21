@echo off
if exist bdesafe.ico del /q /s bdesafe.ico
magick bdesafe.png -background none -alpha on -define icon:auto-resize=16,32 bdesafe.ico
pause
