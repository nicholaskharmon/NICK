@echo off
rem
rem This is SubGit sample authors mapping script.
rem 
rem Script is expected to provide the following mappings:
rem
rem Git author name and email => Subversion user name
rem Subversion user name => Git author name and email
rem
rem Script reads values from the standard input and, depending on the values, it outputs either 
rem full Git author name and email or short Subversion user name.
rem
rem Input/Output protocol:
rem
rem Input:
rem FULL NAME
rem EMAIL
rem Output:
rem SHORT_SVN_NAME
rem
rem Input:
rem SHORT_SVN_NAME
rem Output:
rem FULL NAME
rem EMAIL
rem
rem Authors mapping script may be used instead or together with the static authors mapping.
rem
rem Script that implements Input/Output protocol described above could be specified as a value
rem of core.authorsFile configuration option in SubGit configuration file with optional arguments:
rem
rem [core]
rem
rem authorsFile = /path/to/mappingScript [args]
rem authorsFile = /path/to/staticMappingFile.txt
rem
rem Script is always executed in the repository root directory.
rem

setLocal EnableDelayedExpansion
set c=0

set elem[0]=""
set elem[1]=""

for /F "delims=" %%i in ('more') do (
    set elem[!c!]=%%i
    set /a c+=1
)

set NAME=!elem[0]!
set EMAIL=!elem[1]!

if !NAME!=="" (goto :ERROR)
if !EMAIL!=="" (goto :SVN2GIT)

:GIT2SVN
echo shortSvnUserName
set EXIT_CODE=0
goto :EXIT

:SVN2GIT
echo Full Name
echo author@email.com
set EXIT_CODE=0
goto :EXIT

:ERROR
set EXIT_CODE=1

:EXIT
exit /b !EXIT_CODE!