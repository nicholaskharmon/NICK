@echo off
rem
rem This is SubGit sample credential helper script.
rem 
rem Script is expected to provide credentials necessary to access Subversion repository.
rem
rem Script uses Input/Output protocol similar to that of Git credential helper with 
rem the exception that it is only called to get credentials, so command name could be 
rem ignored.
rem
rem Credential helper script is expected to be non-interactive, as it might be 
rem executed by a background process that has no access to the shell.
rem
rem Input/Output protocol: 
rem
rem Input:
rem
rem url=SVN_URL
rem protocol=SVN_URL_PROTOCOL
rem path=SVN_URL_PATH
rem rem optional:
rem username=PREFFERED_SVN_USER_NAME
rem
rem Output:
rem
rem username=SVN_USER_NAME
rem password=SVN_PASSWORD
rem
rem More details on the protocol could be found at 'https://www.kernel.org/pub/software/scm/git/docs/git-credential.htmlremIOFMT'
rem
rem Script that implements Input/Output protocol referenced above could be specified as a value
rem of auth.credentialHeplper configuration option in SubGit configuration file 
rem along with the optional arguments:
rem
rem [auth "default"]
rem
rem credentialHelper = /path/to/credentialHelper [args]
rem
rem Script is always executed in the Git repository root directory.
rem 

echo username=svnUser
echo password=svnPassword

exit 0