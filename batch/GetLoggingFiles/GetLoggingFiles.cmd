:: Name:     GetLoggingFiles.cmd
:: Purpose:  get the logging files from the website
:: Author:   pierre@pvln.nl
:: Revision: 2018 11 20 - initial version
::           2019 01 09 - changed mget * to mget *.php and get index.html
::

@ECHO off
SETLOCAL ENABLEEXTENSIONS

:: BASIC SETTINGS
:: ==============
:: Setting the name of the script
SET me=%~n0
:: Setting the name of the directory with this script
SET parent=%~p0
:: Setting the drive of this commandfile
SET drive=%~d0
:: Setting the directory and drive of this commandfile
SET cmd_dir=%~dp0

:: STATIC VARIABLES
:: ================
::CALL _set_website.cmd
IF EXIST GetWebsiteName.cmd (
   CALL GetWebsiteName.cmd
) ELSE (
   SET ERROR_MESSAGE=File GetWebsiteName.cmd with website info settings doesn't exist
   GOTO ERROR_EXIT
)

:: Get ftp settings
cd ..\..\_settings
IF EXIST ftp%website_folder%_settings.cmd (
   CALL ftp%website_folder%_settings.cmd
) ELSE (
   SET ERROR_MESSAGE=File ftp%website_folder%_settings.cmd with ftp settings for the website: %website_folder% doesn't exist
   GOTO ERROR_EXIT
)

cd "%cmd_dir%"
:: Sets the proper date and time stamp with 24Hr Time for log file naming convention
:: source http://stackoverflow.com/questions/1192476/format-date-and-time-in-a-windows-batch-script
::
SET dtStampYYYY=%date:~9,4%
SET dtStampMMDD=%date:~6,2%%date:~3,2%

:: Make sure the directory to hold the logging files exists
IF NOT EXIST ".\_9_mgmt\_logging\%dtStampYYYY%" (MD ".\_9_mgmt\_logging\%dtStampYYYY%")
CD ".\_9_mgmt\_logging\%dtStampYYYY%"
:: Create directory to hold logging files 
IF NOT EXIST "%dtStampMMDD%" (MD "%dtStampMMDD%")
CD "%dtStampMMDD%"

:: ======================================
::
SET ftp_download_folder="joomla_01/logs"
SET local_folder=".\logs"

IF NOT EXIST "%local_folder%" (MD "%local_folder%")
:: Get the logging files
::
:: remove any existing ..\..\..\..\..\..\_settings\_ftp_files.txt file
IF EXIST "..\..\..\..\..\..\_settings\_ftp_files.txt" (del "..\..\..\..\..\..\_settings\_ftp_files.txt")
::
:: Create ..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO %ftp_user_downloadserver%>>..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO %ftp_pw_downloadserver%>>..\..\..\..\..\..\_settings\_ftp_files.txt
:: Change to binary mode
ECHO binary>>..\..\..\..\..\..\_settings\_ftp_files.txt
:: Enter local folder
ECHO lcd %local_folder%>>..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO cd %ftp_download_folder%>>..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO mget *.php>>..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO get index.html>>..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO bye>>..\..\..\..\..\..\_settings\_ftp_files.txt
:: run the actual FTP commandfile
:: -i : turns off the interactive mode which prompts for confirmation for every files.
:: -s : ftp script to use
ftp -i -s:..\..\..\..\..\..\_settings\_ftp_files.txt %ftp_downloadserver%
del ..\..\..\..\..\..\_settings\_ftp_files.txt
::
:: ======================================

:: ======================================
::
SET ftp_download_folder="joomla_01/administrator/logs"
SET local_folder=".\administrator\logs"

IF NOT EXIST "%local_folder%" (MD "%local_folder%")
:: Get the logging files
::
:: remove any existing ..\..\..\..\..\..\_settings\_ftp_files.txt file
IF EXIST "..\..\..\..\..\..\_settings\_ftp_files.txt" (del "..\..\..\..\..\..\_settings\_ftp_files.txt")
::
:: Create ..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO %ftp_user_downloadserver%>>..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO %ftp_pw_downloadserver%>>..\..\..\..\..\..\_settings\_ftp_files.txt
:: Change to binary mode
ECHO binary>>..\..\..\..\..\..\_settings\_ftp_files.txt
:: Enter local folder
ECHO lcd %local_folder%>>..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO cd %ftp_download_folder%>>..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO mget *.php>>..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO get index.html>>..\..\..\..\..\..\_settings\_ftp_files.txt
ECHO bye>>..\..\..\..\..\..\_settings\_ftp_files.txt
:: run the actual FTP commandfile
:: -i : turns off the interactive mode which prompts for confirmation for every files.
:: -s : ftp script to use
ftp -i -s:..\..\..\..\..\..\_settings\_ftp_files.txt %ftp_downloadserver%
del ..\..\..\..\..\..\_settings\_ftp_files.txt
::
:: ======================================

GOTO CLEAN_EXIT

:ERROR_EXIT
cd "%cmd_dir%" 
:: remove any existing _ftp_files.txt file
IF EXIST ".\..\..\..\..\..\_settings\_ftp_files.txt" (del ".\..\..\..\..\..\_settings\_ftp_files.txt")
ECHO *******************
ECHO Error: %ERROR_MESSAGE%
ECHO *******************

:CLEAN_EXIT   
cd "%cmd_dir%" 
timeout /T 10
