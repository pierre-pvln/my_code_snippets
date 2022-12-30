:: Name:     CreateItAll.cmd
:: Purpose:  Create the baseline folder structure
:: Author:   pierre@pvln.nl
:: Revision: 2019 05 10 - initial version
::
:: Code location: https://github.com/pierre-pvln/my_code_snippets/tree/master/batch/CreateWebsiteFolderStructure
::

@ECHO off
SETLOCAL ENABLEEXTENSIONS

::
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

::
:: (re)set environment variables
::
SET VERBOSE=YES

IF EXIST ./CreateFolderStructure.cmd (
   CALL ./CreateFolderStructure.cmd
   IF %ERRORLEVEL% NEQ 0 (
      SET ERROR_MESSAGE=[ERROR] [%~n0 ] ... Script CreateFolderStructure.cmd returned error %ERRORLEVEL%
      GOTO ERROR_EXIT
   )
) ELSE (
   SET ERROR_MESSAGE=[ERROR] [%~n0 ] ... File CreateFolderStructure.cmd doesn't exist
   GOTO ERROR_EXIT
)
IF %VERBOSE%==YES ECHO [%~n0 ] ... Folder structure created succesfully.

IF EXIST ./CreateMissingFiles.cmd (
   CALL ./CreateMissingFiles.cmd
   IF %ERRORLEVEL% NEQ 0 (
      SET ERROR_MESSAGE=[ERROR] [%~n0 ] ... Script CreateMissingFiles.cmd returned error %ERRORLEVEL%
      GOTO ERROR_EXIT
   )
) ELSE (
   SET ERROR_MESSAGE=[ERROR] [%~n0 ] ... File CreateMissingFiles.cmd doesn't exist
   GOTO ERROR_EXIT
)
IF %VERBOSE%==YES ECHO [%~n0 ] ... Missing files created succesfully.

GOTO CLEAN_EXIT

:ERROR_EXIT
cd "%cmd_dir%" 
ECHO *******************
ECHO %ERROR_MESSAGE%
ECHO *******************
   
:CLEAN_EXIT
:: Wait some time and exit the script
::
timeout /T 5
