::clears the screen of this command prompt.
cls

::doesn't show the commands in this command prompt.
@echo off

::title of the command prompt, you can replace it to whatever you want.
title Pulse

::colour of the command prompt, it really looks good in green on black. more here https://www.computerhope.com/color.htm
color 0a

::logic check here, if the folder is already locked, then try unlocking it first.
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK


::now defining lock, 
:LOCK

::lock logic level one, rename the Original Folder you want to lock into something which we cannnot remember easily and cannot be opened in deafault way.
ren "camera roll" "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

::lock logic level two, hide it.
::lock logic level three, make it a system file so that windows won't show it even when hidden files visiblity is turned on by the user. 
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

::you can inject code here like 'echo folder is locked' or 'echo folder locked sucessfully' and 'pause' the code to show that locking process is completed.
::we are not doing it here as it is not our intention to show what's going on as a security measure.
::unlike in the Movies and TV shows they show that "hacking is completed" prompts LOL.
::but you can check the folder location to see if it exits or not by refreshing the file explorer path.

::as locking is done, we will end the script here.
goto End


::defining unlock,
:UNLOCK

::unlock logic level one, set a term pass for passoword.
:: note that greater than sign is only for visibility in cmd prompt, you can remove > symbol to see completely blank command prompt screen when unlocking.
set/p "pass=>"

::unlock logic level two, If you enter anything other than the password you mentioned below, it will end the script without going further.
::logic won't work if you use space in password and also don't remove "goto End" & "if NOT %pass%==" in that line.
::Enter your password' in the below line after double equals & before "goto End" by replacing existing password with the password you wanted to enter.
if NOT %pass%== letme@iN goto End

::If the password is match then this will undo the 'lock logic'.
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

::make sure your renamed folder has same name as the one you locked in lock logic level one command.
::here it is renamed to Camera Roll insted as original camera roll just to show folder names are not case sensitive.
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" "Camera Roll"

::as unlocking is done, we can end the script here. But I've added additional features that can be very helpful as they save a few clicks.
::as soon as you enter the correct password you can set it to open that desired folder/file/playlist using below command.

::logic here is starting the file expolrer with our mentioned folder directory, here is an example derectory.
start explorer.exe "D:\video\Camera Roll"

::or you can just start the file/video itself which was locked iniside our folder, here is example for starting a VLC playlist.
start D:\video\Camera Roll\Myplaylist.xspf

::Now we will end the script here.
goto End


::we wan't nothing to happen after END, so we defined it at the end of our processes.
:End



