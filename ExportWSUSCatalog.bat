@echo off

REM ***
REM *** Set some defaults
REM ***

REM Volume size

Set MyVolumeSize=1500m

REM Path for the WSUS repository

Set PathToArchive=E:\WSUS\WsusContent

REM Where the final resting place of the archive will be

Set Repository=E:\Source\wsus\

REM ***
REM *** The date is available. Parse the output of DATE /T
REM ***

For /F "tokens=1-4 delims=/.- " %%A in ('date /T') do if %%D!==! (set %1=%%A&set %2=%%B&set YYYY=%%C) else (set DOW=%%A&set %1=%%B&set %2=%%C&set YYYY=%%D)
(Set DateStamp=%YYYY%%MM%%DD%)

REM Inform the user of the stats

Echo.
Echo Archiving %PathToArchive%
Echo Target directory = %Repository%
Echo Base filename = %MyArchiveName%
Echo Volume Size = %MyVolumeSize%
Echo.
Echo beginning archive - this will take a bit.
Echo.

REM Export

wsusutil export %Repository%%DateStamp%_WSUSCatalog.xml.gz e:\scripts\%YYYY%%MM%%DD%_WSUSExport.log

ScriptDone:
