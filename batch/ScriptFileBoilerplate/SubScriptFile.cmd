:: @name      SubScriptFile.cmd
:: @purpose   Boilerplate subscript file
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



:::
::: THE CODE
:::



GOTO CLEAN_EXIT_SUBSCRIPT

:ERROR_EXIT_SUBSCRIPT
ECHO %ERROR_MESSAGE%
::timeout /T 5
EXIT /B 1

:CLEAN_EXIT_SUBSCRIPT   
::timeout /T 5
EXIT /B 0


