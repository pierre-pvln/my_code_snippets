:: Name:          CreateMgmtFolderStructure.cmd
:: Purpose:       Create the mgmtm folder structure for website projects in current directory
:: Author:        pierre@pvln.nl
::
:: Code location: https://github.com/pierre-pvln/my_code_snippets/tree/master/batch/CreateMgmtFolderStructure
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

:: Create folder structure
::
ECHO @_WEBSITE_SOCIAL_@ ...
IF NOT EXIST @_WEBSITE_SOCIAL_@    (md @_WEBSITE_SOCIAL_@)

ECHO _facebook ...
IF NOT EXIST _facebook   (md _facebook)
    CD _facebook
        :: Creating README.md
        ECHO. >README.md
        ECHO DIT BESTAND NIET AANPASSEN! >>README.md
        ECHO WORDT AUTOMATISCH GEGENEREERD DOOR CreateMgmtFolderStructure.cmd >>README.md
        ECHO ALLE WIJZIGINGEN ZIJN WEG NA UPDATE! >>README.md
        ECHO. >>README.md
        ECHO In deze map(pen) staan de bestanden voor de facebook site(s). >>README.md   
        ECHO.>>README.md
        CD ..

ECHO _google ...
IF NOT EXIST _google   (md _google)
    CD _google
        :: Creating README.md
        ECHO. >README.md
        ECHO DIT BESTAND NIET AANPASSEN! >>README.md
        ECHO WORDT AUTOMATISCH GEGENEREERD DOOR CreateMgmtFolderStructure.cmd >>README.md
        ECHO ALLE WIJZIGINGEN ZIJN WEG NA UPDATE! >>README.md
        ECHO. >>README.md
        ECHO In deze map(pen) staan de bestanden voor de google site(s). >>README.md   
        ECHO.>>README.md
        CD ..

ECHO _linkedin ...
IF NOT EXIST _linkedin   (md _linkedin)
    CD _linkedin
        :: Creating README.md
        ECHO. >README.md
        ECHO DIT BESTAND NIET AANPASSEN! >>README.md
        ECHO WORDT AUTOMATISCH GEGENEREERD DOOR CreateMgmtFolderStructure.cmd >>README.md
        ECHO ALLE WIJZIGINGEN ZIJN WEG NA UPDATE! >>README.md
        ECHO. >>README.md
        ECHO In deze map(pen) staan de bestanden voor de linkedin site(s). >>README.md   
        ECHO.>>README.md
        CD ..

ECHO _settings ...
IF NOT EXIST _settings   (md _settings)
    CD _settings
        IF NOT EXIST history   (md history)
        IF NOT EXIST pictures    (md pictures)
        CD pictures
                :: Creating README.md
                ECHO. >README.md
                ECHO DIT BESTAND NIET AANPASSEN! >>README.md
                ECHO WORDT AUTOMATISCH GEGENEREERD DOOR CreateMgmtFolderStructure.cmd >>README.md
                ECHO ALLE WIJZIGINGEN ZIJN WEG NA UPDATE! >>README.md
                ECHO. >>README.md
                ECHO This folder contains: >>README.md
                ECHO * the picture used in documents in .\users folder >>README.md
                ECHO * the picture used in .\settings documents >>README.md
                ECHO.>>README.md
            CD ..
        IF NOT EXIST users     (md users)
        CD users
                IF NOT EXIST history   (md history)
            CD ..
        IF NOT EXIST notes     (md notes)
        :: Creating README.md
        ECHO. >README.md
        ECHO DIT BESTAND NIET AANPASSEN! >>README.md
        ECHO WORDT AUTOMATISCH GEGENEREERD DOOR CreateMgmtFolderStructure.cmd >>README.md
        ECHO ALLE WIJZIGINGEN ZIJN WEG NA UPDATE! >>README.md
        ECHO. >>README.md
        ECHO In deze map staan alle relevante settings. >>README.md   
        ECHO.>>README.md
    CD ..

ECHO _website ...
IF NOT EXIST _website   (md _website)
    CD _website
        ECHO. >README.md
        ECHO DIT BESTAND NIET AANPASSEN! >>README.md
        ECHO WORDT AUTOMATISCH GEGENEREERD DOOR CreateMgmtFolderStructure.cmd >>README.md
        ECHO ALLE WIJZIGINGEN ZIJN WEG NA UPDATE! >>README.md
        ECHO. >>README.md
        ECHO In deze map(pen) staan de bestanden voor de website(s). >>README.md 
        ECHO Iedere website heeft een eigen map. >>README.md
        ECHO De mapnaam begin met @ en dan de websitenaam. >>README.md 
        ECHO In deze map(pen) staan de bestanden voor de website(s). >>README.md 
        ECHO.>>README.md
    CD ..

ECHO _mgmt_links ...
IF NOT EXIST _mgmt_links  (md _mgmt_links)
    CD _mgmt_links
        ECHO. >README.md
        ECHO DIT BESTAND NIET AANPASSEN! >>README.md
        ECHO WORDT AUTOMATISCH GEGENEREERD DOOR CreateMgmtFolderStructure.cmd >>README.md
        ECHO ALLE WIJZIGINGEN ZIJN WEG NA UPDATE! >>README.md
        ECHO. >>README.md
        ECHO In deze map(pen) staan de bestanden met links voor de website(s). >>README.md   
        ECHO.>>README.md
CD ..



:: Wait some time and exit the script
::
timeout /T 5
