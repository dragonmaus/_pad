@ECHO OFF
SETLOCAL
SET BASE=%~DP0
CHDIR /D %BASE%
CALL LIB\INSTALL
CALL INSTALL enp -lcore
CALL INSTALL lefix -lcore
CALL INSTALL printenv -lcore
CALL INSTALL unp -lcore
ENDLOCAL
