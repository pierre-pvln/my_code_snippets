:: @name      ScriptFile.cmd
:: @purpose   Boilerplate script file
:: @package   my_code_snippets 
:: @author    pierre@pvln.nl
:: @copyright (C) 2020-2021 Pierre Veelen
:: @version   v0.0.1 2021-07-27

::
:: Required environment variables
:: ==============================
::
:: NONE
::
:: struc_utils_folder        ..\struc\utils\
:: global_settings_folder    ..\_set\
:: source_code_folder        ..\code\src\
:: update_server_folder      ..\code\src\update_server
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
::
:: (re)set environment variables
::
SET VERBOSE=YES
::
:: Setting for Error messages
::
SET ERROR_MESSAGE=errorfree



:::
::: THE CODE
:::



GOTO CLEAN_EXIT

:ERROR_EXIT
cd "%cmd_dir%" 
ECHO *******************
ECHO %ERROR_MESSAGE%
ECHO *******************

   
:CLEAN_EXIT   
:: Wait some time and exit the script
::
timeout /T 10


