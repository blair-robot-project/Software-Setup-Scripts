@echo OFF

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{26A24AE4-039D-4CA4-87B4-2F64180151F0}" > nul
if errorlevel 1 goto installJavaByCP
if errorlevel 0 goto skipJavaInstallation

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Git_is1" > nul
if errorlevel 1 goto installGitByCP
if errorlevel 0 goto skipGitInstallation

:installJavaByCP
	if %OS%==32BIT goto installJava32
	if %OS%==64BIT goto installJava64

:installJava32
	echo Installing Java 32BIT
	START /WAIT %0\Redist\x86\jdk-8u151-windows-i586.exe 
	setx %JAVA_HOME% "C:\Program Files (x86)\Java\jdk1.8.0_151" /m
	goto setGradle

:installJava64
	echo Installing Java 64BIT
	START /WAIT %0\Redist\x64\jdk-8u151-windows-x64.exe
	setx %JAVA_HOME% "C:\Program Files\Java\jdk1.8.0_151" /m
	goto setGradle

:skipJavaInstallation
	echo Application Found, Canceling Installation
	goto setGradle
	
:setGradle
	echo Properly Setting the Latest Version of Gradle
	runas /savecred /profile /user:Administrator gradleJava.bat
	SET GRADLE=";C:\Gradle\gradle-4.4\bin"
	goto installGitByCP

:installGitByCP
	if %OS%==32BIT goto installGit32
	if %OS%==64BIT goto installGit64

:installGit32
	echo Installing Git - 32
	START /WAIT %0\Redist\x86\Git-2.15.1.2-32-bit.exe
	goto exit

:installGit64
	echo Installing Git - 64
	START /WAIT %0\Redist\x64\Git-2.15.1.2-64-bit.exe
	goto exit

:skipJavaInstallation
	echo Application Found, Canceling Installation
	goto exit

:exit
	echo All Necessary Files Installed and Set, Install IntelliJ
    echo Script is Finished, Exiting
    exit