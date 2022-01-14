@REM @echo off
start node scripts/keep-tso.mjs
@REM timeout /t 5
@REM SET /P KEY=< key.txt
@REM SET TSO_KEY=%KEY%
@REM echo zowe tso send as %%TSO_KEY%% --data "ex 'ibmuser.rexx(member)'"