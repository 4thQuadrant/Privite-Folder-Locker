cls
@echo off
title Pulse 
color 0a
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
:LOCK
ren youtube "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Pulse locked
goto End
:UNLOCK
set/p "pass=>"
if NOT %pass%== letmeintenet747 goto End
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" YouTube
start explorer.exe "D:\video\YouTube"
start D:\video\YouTube\youtubePlaylist.xspf
goto End
:End



