:: https://drive.google.com/drive/folders/178phBlMe5f5WKRa4luwsoLUBo8BWSx9m?usp=sharing

@echo OFF

SET /p cpu="32 Bit or 64 Bit: "
IF /I "%cpu%" EQU "32" (goto init32)
IF /I "%cpu%" EQU "64" (goto init64)

:init32
	SET /p haveJava="Java Is Installed? [Y/N]: "
	IF /I "%haveJava%"=="Y" (goto checkGradle32)
	IF /I "%haveJava%"=="N" (goto installJava32)

:init64
	SET /p haveJava= "Java Is Installed? [Y/N]: "
	IF /I "%haveJava%"=="Y" (goto checkGradle64)
	IF /I "%haveJava%"=="N" (goto installJava64)

:installJava32
	echo Installing Java 32 Bit
	WGET "https://drive.google.com/uc?export=download&id=1_u2ZLxJTyVj6D-xyBD0DfNrUrorpVDXa"
	.\JDK-1.8.exe
	START /W .\installJDK.exe
	WGET "https://drive.google.com/uc?export=download&id=1o3IMP5EC5PMMpu53hp6Wmqdv5bKt7erA"
	.\JRE-1.8.exe
	START /W .\installJRE.exe
	SETX -m JAVA_HOME "C:\Program Files (x86)\Java\jdk1.8.0_161"
	goto checkGradle32

:installJava64
	echo Installing Java 64 Bit
	WGET "https://drive.google.com/uc?export=download&id=1SzDItCIqxdgiGBLqXns0C5q3GPwOM47f"
	.\JDK-1.8.exe
	START /W .\installJDK.exe
	WGET "https://drive.google.com/uc?export=download&id=1ZHw8OeERyMFyfDF2fMEcumu-9RV2WrKj"
	.\JRE-1.8.exe
	START /W .\installJRE.exe
	SETX -m JAVA_HOME "C:\Program Files\Java\jdk1.8.0_161"
	goto checkGradle64

:checkGradle32
	SET /p haveGradle= "Gradle Is Installed? [Y/N]: "
	IF /I "%haveGradle%"=="Y" (goto checkGit32)
	IF /I "%haveGradle%"=="N" (goto setGradle32)

:checkGradle64
	SET /p haveGradle= "Gradle Is Installed? [Y/N]: "
	IF /I "%haveGradle%"=="Y" (goto checkGit64)
	IF /I "%haveGradle%"=="N" (goto setGradle64)
	
:setGradle32
	echo Downloading and Setting Gradle 4.6
	WGET "http://www.7-zip.org/a/7z1801.exe"
	.\7z1801.exe
	START /W .\7Z.exe
	WGET "https://services.gradle.org/distributions/gradle-4.6-bin.zip?_ga=2.83703056.7895938.1520299690-534844830.1520299690"
	"C:\Program Files (x86)\7-Zip\7z.exe" e gradle-4.6-bin.zip
	MOVE %cd%/gradle C:\
	SETX -m GRADLE=";C:\Gradle\gradle-4.6\bin"
	goto checkGit32

:setGradle32
	echo Downloading and Setting Gradle 4.6
	WGET "http://www.7-zip.org/a/7z1801-x64.exe"
	.\7z1801-x64.exe
	START /W .\7Z.exe
	WGET "https://services.gradle.org/distributions/gradle-4.6-bin.zip?_ga=2.83703056.7895938.1520299690-534844830.1520299690"
	"C:\Program Files\7-Zip\7z.exe" e gradle-4.6-bin.zip
	MOVE %cd%/gradle C:\
	SETX -m GRADLE=";C:\Gradle\gradle-4.6\bin"
	goto checkGit64

:checkGit32
	SET /p haveGit= "Git Is Installed? [Y/N]: "
	IF /I "%haveGit%"=="Y" (goto finishedInstallation)
	IF /I "%haveGit%"=="N" (goto installGit32)

:checkGit64
	SET /p haveGit= "Git Is Installed? [Y/N]: "
	IF /I "%haveGit%"=="Y" (goto finishedInstallation)
	IF /I "%haveGit%"=="N" (goto installGit64)

:installGit32
	echo Installing Git 32 Bit
	WGET "https://drive.google.com/uc?export=download&id=1KYB3bVvkJpIIkOwAu-oUc-adJ4wnlPRZ"
	.\Git-2.16.2.exe
	START /W .\installGit.exe
	goto finishedInstallation

:installGit64
	echo Installing Git 64 Bit
	WGET "https://drive.google.com/uc?export=download&id=1qek18DiIyCmKbtjZU71OhZZVX8dgVytR"
	.\Git-2.16.2.exe
	START /W .\installGit.exe
	goto finishedInstallation

:finishedInstallation
	echo All Necessary Files Installed and Set, Install IntelliJ
	echo Script is Finished, Exiting
exit
