:: Name:     CreateFolderStructure.cmd
:: Purpose:  Create the baseline folder structure for website projects
:: Author:   pierre@pvln.nl
:: Revision: 2019 05 10 - initial version
::           2022 12 31 - folders added
::
:: Required environment variables
:: ==============================
:: - VERBOSE                    how verbose output should be if not set script sets it to YES
::

@ECHO off
SETLOCAL ENABLEEXTENSIONS

::
:: Check if required environment variables are set.
:: If not set them to a safe default value or exit with error.
:: 
IF "%VERBOSE%" == "" (
   SET VERBOSE=YES
)

:: Create folder structure
::
ECHO [%~n0 ] _0_generic ...
IF NOT EXIST _0_generic    (md _0_generic)
CD _0_generic
    IF NOT EXIST _documentation     (md _documentation)
CD ..

ECHO [%~n0 ] _1_testserver ...
IF NOT EXIST _1_testserver (md _1_testserver)

ECHO [%~n0 ] _2_content ...
IF NOT EXIST _2_content    (md _2_content)
CD _2_content
    IF NOT EXIST _articles     (md _articles)
    IF NOT EXIST _downloads    (md _downloads)
    IF NOT EXIST _fotorol      (md _fotorol)
    IF NOT EXIST _pictures     (md _pictures)
    IF NOT EXIST _mailings     (md _mailings)
    IF NOT EXIST _pagespeed    (md _pagespeed)
    IF NOT EXIST _videos       (md _videos)
	IF NOT EXIST _music        (md _music)
	IF EXIST _images (ren _images _images_MOVE_FILES)
CD ..

ECHO [%~n0 ] _3_styling ...
IF NOT EXIST _3_styling    (md _3_styling)
CD _3_styling
    IF NOT EXIST _admin        (md _admin)
    IF NOT EXIST _customize    (md _customize)
    CD _customize
       IF NOT EXIST _helix_ultimate (md _helix_ultimate)
       IF NOT EXIST _T3        (md _T3)
    CD ..
    IF NOT EXIST _edit         (md _edit)
    IF NOT EXIST _favicon      (md _favicon)
    IF NOT EXIST _fonts        (md _fonts)
    IF NOT EXIST _huisstijl    (md _huisstijl)
    CD _huisstijl
        IF NOT EXIST _history    (md _history)
    CD..
	IF NOT EXIST _logos        (md _logos)
    CD _logos
        IF NOT EXIST _history    (md _history)
    CD..
    IF NOT EXIST _mgmt         (md _mgmt)
    IF NOT EXIST _templates    (md _templates)
    CD _templates
        IF NOT EXIST _manuals    (md _manuals)
    CD..
    IF NOT EXIST _watermerk    (md _watermerk)
CD ..

ECHO [%~n0 ] _5_extensions ...
IF NOT EXIST _5_extensions (md _5_extensions)
CD _5_extensions
    IF NOT EXIST _installed    (md _installed)
    CD _installed
        IF NOT EXIST _joomlacore    (md _joomlacore)
        IF NOT EXIST _google      (md _google)
        IF NOT EXIST _htaccess    (md _htaccess)
        CD _htaccess
            IF NOT EXIST _history    (md _history)
            IF NOT EXIST _reports    (md _reports)
        CD ..
        IF NOT EXIST _robots      (md _robots)
        CD _robots
            IF NOT EXIST _history    (md _history)
            IF NOT EXIST _reports    (md _reports)
        CD ..
    CD ..
    IF NOT EXIST _removed      (md _removed)
    IF NOT EXIST _under_test   (md _under_test)
CD ..

ECHO [%~n0 ] _6_scripts ...
IF NOT EXIST _6_scripts    (md _6_scripts)
CD _6_scripts
    IF NOT EXIST _htaccess     (md _htaccess)
    IF NOT EXIST _robots       (md _robots)
    IF NOT EXIST _mysql        (md _mysql)
    IF NOT EXIST _php          (md _php)
	IF NOT EXIST _python       (md _python)
	IF NOT EXIST _cronjob      (md _cronjob)
	IF NOT EXIST _ssh          (md _ssh)
CD ..

ECHO [%~n0 ] _7_tricks ...
IF NOT EXIST _7_tricks     (md _7_tricks)

ECHO [%~n0 ] _8_releases ...
IF NOT EXIST _8_releases   (md _8_releases)

ECHO [%~n0 ] _9_mgmt ...
IF NOT EXIST _9_mgmt       (md _9_mgmt)
CD _9_mgmt
    IF NOT EXIST _backup       (md _backup)
    CD _backup
        IF NOT EXIST joomla           (md joomla)
        CD joomla
            IF NOT EXIST test         (md test)
            IF NOT EXIST productie    (md productie)
        CD ..
        IF NOT EXIST hosting_manager  (md hosting_manager)
    CD..
    IF NOT EXIST _logging      (md _logging)
    IF NOT EXIST _restore      (md _restore)
CD ..

GOTO CLEAN_EXIT_SUBSCRIPT

:ERROR_EXIT_SUBSCRIPT
ECHO %ERROR_MESSAGE%
EXIT /B 1

:CLEAN_EXIT_SUBSCRIPT   
EXIT /B 0
