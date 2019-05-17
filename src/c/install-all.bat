@ECHO OFF
SETLOCAL
SET BASE=%~DP0
CHDIR /D %BASE%
CALL LIB\INSTALL
CALL INSTALL abspath -lcore
CALL INSTALL enp -lcore
CALL INSTALL lefix -lcore
CALL INSTALL printenv -lcore
CALL INSTALL realpath -lcore
CALL INSTALL unp -lcore
ENDLOCAL
