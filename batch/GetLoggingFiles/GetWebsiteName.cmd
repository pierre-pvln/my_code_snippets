:: Purpose:  set the current folder name as variable
:: Author:   pierre@pvln.nl
:: Revision: 2017 04 28 - initial version
::           2017 05 02 - if foldername starts with @ change the @ to _
::                        shorten the foldername to max 8 chars                         
::           2018 11 06 - shorten the foldername to max 12 chars                         

:: Setting the name of the directory with this script
:: https://superuser.com/questions/160702/get-current-folder-name-by-a-dos-command
::
FOR %%* IN (.) DO SET website_folder=%%~nx*

:: TODO
:: only use the first part of the foldername as website name 
:: the part before the first _ 
::
:: https://www.dostips.com/DtTipsStringManipulation.php#Snippets.SplitString
::

:: check if first char of website folder is @ if so change the website folder name
IF %website_folder:~0,1% == @ GOTO changeIt
GOTO theEnd

:changeIt
:: replace @ with _
:: 
:: http://www.dostips.com/DtTipsStringManipulation.php
SET website_folder=%website_folder:@=_%

:theEnd
:: set the website foldername to max 12 chars 
:: http://www.dostips.com/DtTipsStringOperations.php#Snippets.LeftString
SET website_folder=%website_folder:~0,12% 

:: remove any spaces
:: http://www.dostips.com/DtTipsStringOperations.php#Snippets.RemoveSpaces
SET website_folder=%website_folder: =%

:: TODO
:: check if length of website_folder is > 0
:: If not return an errorlevel
 