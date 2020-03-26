:: https://stackoverflow.com/questions/7308586/using-batch-echo-with-special-characters

CLS 
ECHO RUNNING WITH EXTERNAL FUNCTION CALL

@ECHO off
::
:: inspiration: http://batcheero.blogspot.com/2007/06/how-to-enabledelayedexpansion.html
:: using ENABLEDELAYEDEXPANSION and !env-var! ensures correct operation of script 
::
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

SET EEN_VARIABELE=EenTekstVoorNu

:: !! Do not use " or ' at beginning or end of the list. 
:: Separate Vars with space. Var can not contain space in the name! 
SET CHECK_ENVIRONMENT_VARS_LIST=EEN_VARIABELE staging_command output_dir

SET ERROR_MESSAGE=NO_ERROR

FOR %%x IN (%CHECK_ENVIRONMENT_VARS_LIST%) DO (
	ECHO [INFO ] Checking for %%x ...
	call .\functions\CheckEnvVarHasValue.cmd %%x
	IF "!ERROR_MESSAGE!" NEQ "NO_ERROR" GOTO ERROR_EXIT_SUBSCRIPT
)

PAUSE
SET
EXIT /B

:ERROR_EXIT_SUBSCRIPT
ECHO:ERROR_EXIT_SUBSCRIPT
PAUSE
EXIT /B
