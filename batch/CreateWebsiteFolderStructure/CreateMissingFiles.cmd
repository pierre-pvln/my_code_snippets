:: Name:     CreateMissingFiles.cmd
:: Purpose:  Create the any missing default files projects folders
:: Author:   pierre@pvln.nl
:: Revision: 2019 05 10 - initial version
::
:: Code location: https://github.com/pierre-pvln/my_code_snippets/tree/master/batch/CreateWebsiteFolderStructure
::
::
:: Required environment variables
:: ==============================
:: - VERBOSE  how verbose output should be if not set script sets it to YES

@ECHO off
SETLOCAL ENABLEEXTENSIONS

::
:: Check if required environment variables are set.
:: If not set them to a safe default value or exit with error.
:: 
IF "%VERBOSE%" == "" (
   SET VERBOSE=YES
)

:: Create default files
::
:: ==================
:: HTACCESS README.md
:: ==================
ECHO [%~n0 ] _5_extensions\_installed\_htaccess ...

IF NOT EXIST _5_extensions\_installed\_htaccess (
   SET ERROR_MESSAGE=[ERROR] [%~n0 ] ... folder _5_extensions\_installed\_htaccess not found.
   GOTO ERROR_EXIT_SUBSCRIPT
)
CD _5_extensions\_installed\_htaccess
IF NOT EXIST "README.md" (
	ECHO.
	ECHO DIT BESTAND NIET AANPASSEN. WORDT AUTOMATISCH GEGENEREERD DOOR CreateWebsiteFolderStructure.cmd. ALLE WIJZIGINGEN ZIJN WEG NA UPDATE!
	ECHO.
	ECHO In deze map staan alle .htaccess bestanden.
	ECHO.
	ECHO Hierin is content security policy opgenomen, caching en gzip van bestanden.
	ECHO.
	ECHO Werkwijze:^<br^>
	ECHO.
	ECHO 1 .htaccess bestand downloaden van de server.
	ECHO.
	ECHO 2 copieren en de copie hernoemen naar .htaccess_yyyymmdd_from_site ^(dan is het origineel, wat werkt, in ieder geval beschikbaar^).
	ECHO.
	ECHO 3 wijzigingen doorvoeren in .htaccess bestand en opslaan.
	ECHO.
	ECHO 4 .htaccess bestand copieren en hernoemen naar .htaccess_yyyymmdd_to_site.
	ECHO.
	ECHO 5 .htaccess bestand uploaden naar de server.
	ECHO.
	) >README.md
IF %VERBOSE%==YES ECHO [%~n0 ] ... Files for _5_extensions\_installed\_htaccess created succesfully.
CD ..\..\..

::
:: ==================
:: HTACCESS where_to_get_scripts.txt
:: ==================
ECHO [%~n0 ] _6_scripts\_htaccess ...

IF NOT EXIST _6_scripts\_htaccess (
   SET ERROR_MESSAGE=[ERROR] [%~n0 ] ... folder _6_scripts\_htaccess not found.
   GOTO ERROR_EXIT_SUBSCRIPT
)
CD _6_scripts\_htaccess
IF NOT EXIST "where_to_get_scripts.txt" (
	ECHO.
	ECHO DIT BESTAND NIET AANPASSEN. WORDT AUTOMATISCH GEGENEREERD DOOR CreateWebsiteFolderStructure.cmd. ALLE WIJZIGINGEN ZIJN WEG NA UPDATE!
	ECHO.
	ECHO Ga naar:
	ECHO.
	ECHO https://github.com/pierre-pvln/htaccess_creator/tree/master/03_deploying
	ECHO.
	ECHO En volg de instructies in README.md
	ECHO.
	) >where_to_get_scripts.txt
IF %VERBOSE%==YES ECHO [%~n0 ] ... Files for _6_scripts\_htaccess succesfully.
CD ..\..

:: ======================
:: BACK-UP_INFORMATIE.TXT
:: ======================

ECHO [%~n0 ] _9_mgmt\_backup\joomla\productie ...

IF NOT EXIST _9_mgmt\_backup\joomla\productie (
   SET ERROR_MESSAGE=[ERROR] [%~n0 ] ... folder _9_mgmt\_backup\joomla\productie not found.
   GOTO ERROR_EXIT_SUBSCRIPT
)
CD _9_mgmt\_backup\joomla\productie
IF NOT EXIST "back-up_informatie.txt" (
	ECHO In deze map staan de back-ups die gemaakt zijn van de productie site en daar dus ook vanaf komen.
	ECHO Middels de back-ups die hier staan kan de site gerestored worden. 
	) >back-up_informatie.txt
IF %VERBOSE%==YES ECHO [%~n0 ] ... Files for _9_mgmt\_backup\joomla\productie created succesfully.
CD ..\..\..\..

ECHO [%~n0 ] _9_mgmt\_backup\joomla\test ...

IF NOT EXIST _9_mgmt\_backup\joomla\test (
   SET ERROR_MESSAGE=[ERROR] [%~n0 ] ... folder _9_mgmt\_backup\joomla\test not found.
   GOTO ERROR_EXIT_SUBSCRIPT
)
CD _9_mgmt\_backup\joomla\test
IF NOT EXIST "back-up_informatie.txt" (
	ECHO In deze map staan de back-ups die gemaakt zijn van de test site en daar dus ook vanaf komen.
	ECHO Middels de back-ups die hier staan kan de site gerestored worden. 
	) >back-up_informatie.txt
IF %VERBOSE%==YES ECHO [%~n0 ] ... Files for _9_mgmt\_backup\joomla\test created succesfully.
CD ..\..\..\..

:: ============================
:: j4_backend for aMultis FILES
:: ============================
CD _3_styling\j4_backend\_aMultis
IF NOT EXIST "hulp_nodig_max_150_x_max_50.txt" (
	ECHO Grootte van het logo in de de hulp nodig module. 
	) >hulp_nodig_max_150_x_max_50.txt

IF NOT EXIST "website_bij_login_max_120_x_max_40.txt" (
	ECHO Grootte van het aMultis logo op backend login pagina. 
	) >website_bij_login_max_120_x_max_40.txt
IF %VERBOSE%==YES ECHO [%~n0 ] ... Files for _3_styling\j4_backend\_aMultis created succesfully.
CD ..\..\..

:: ============================
:: j4_brand for aMultis FILES
:: ============================
CD _3_styling\j4_brand
IF NOT EXIST "inlog_max_680_x_max_274.txt" (
	ECHO Grootte van het klant logo op de backend login pagina. 
	) >inlog_max_680_x_max_274.txt

IF NOT EXIST "brand_small_max_1024_x_max_1024.txt" (
	ECHO Grootte van het klant logo in de kleine versie backend pagina. 
	) >brand_small_max_1024_x_max_1024.txt

IF NOT EXIST "brand_large_max_1248_x_max_428.txt" (
	ECHO Grootte van het klant logo in de grote versie backend pagina. 
	) >brand_large_max_1248_x_max_428.txt

IF %VERBOSE%==YES ECHO [%~n0 ] ... Files for _3_styling\j4_brand created succesfully.
CD ..\..

:: ============================
:: customization FILES
:: ============================
CD _3_styling\_customization\media_WebFolder\templates\administrator\atum\css

IF %VERBOSE%==YES ECHO [%~n0 ] ... Files for _3_styling\_customization\media_WebFolder\templates\administrator\atum\css created succesfully.
CD ..\..\..\..\..\..\..

CD _3_styling\_customization\templates_WebFolder\shaper_helixultimate\css

IF %VERBOSE%==YES ECHO [%~n0 ] ... Files for _3_styling\_customization\templates_WebFolder\shaper_helixultimate\css created succesfully.
CD ..\..\..\..\..

GOTO CLEAN_EXIT_SUBSCRIPT

:ERROR_EXIT_SUBSCRIPT
ECHO %ERROR_MESSAGE%
EXIT /B 1

:CLEAN_EXIT_SUBSCRIPT   
EXIT /B 0
