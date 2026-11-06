@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem
@rem SPDX-License-Identifier: Apache-2.0
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  web02 startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables, and ensure extensions are enabled
setlocal EnableExtensions

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and WEB02_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

"%COMSPEC%" /c exit 1

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

"%COMSPEC%" /c exit 1

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\web02.jar;%APP_HOME%\lib\resteasy-undertow-7.0.5.Final.jar;%APP_HOME%\lib\resteasy-client-7.0.5.Final.jar;%APP_HOME%\lib\resteasy-core-7.0.5.Final.jar;%APP_HOME%\lib\resteasy-client-api-7.0.5.Final.jar;%APP_HOME%\lib\resteasy-core-spi-7.0.5.Final.jar;%APP_HOME%\lib\undertow-servlet-2.3.26.Final.jar;%APP_HOME%\lib\undertow-core-2.3.26.Final.jar;%APP_HOME%\lib\xnio-nio-3.8.16.Final.jar;%APP_HOME%\lib\xnio-api-3.8.16.Final.jar;%APP_HOME%\lib\wildfly-client-config-1.0.1.Final.jar;%APP_HOME%\lib\jboss-threads-3.7.0.Final.jar;%APP_HOME%\lib\wildfly-common-2.0.0.jar;%APP_HOME%\lib\smallrye-common-expression-2.4.0.jar;%APP_HOME%\lib\smallrye-common-function-2.6.0.jar;%APP_HOME%\lib\smallrye-common-net-2.4.0.jar;%APP_HOME%\lib\smallrye-common-ref-2.4.0.jar;%APP_HOME%\lib\smallrye-common-constraint-2.6.0.jar;%APP_HOME%\lib\jboss-logging-3.6.3.Final.jar;%APP_HOME%\lib\jakarta.annotation-api-2.1.1.jar;%APP_HOME%\lib\jakarta.ws.rs-api-4.0.0.jar;%APP_HOME%\lib\jakarta.xml.bind-api-3.0.1.jar;%APP_HOME%\lib\jakarta.servlet-api-6.0.0.jar;%APP_HOME%\lib\jandex-3.4.0.jar;%APP_HOME%\lib\reactive-streams-1.0.4.jar;%APP_HOME%\lib\jakarta.activation-api-2.1.4.jar;%APP_HOME%\lib\angus-activation-2.0.3.jar;%APP_HOME%\lib\jakarta.validation-api-3.1.1.jar;%APP_HOME%\lib\httpclient-4.5.14.jar;%APP_HOME%\lib\commons-codec-1.22.1.jar;%APP_HOME%\lib\httpcore-4.4.16.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\smallrye-common-annotation-2.6.0.jar;%APP_HOME%\lib\smallrye-common-cpu-2.6.0.jar;%APP_HOME%\lib\smallrye-common-os-2.4.0.jar


@rem Execute web02
@rem endlocal doesn't take effect until after the line is parsed and variables are expanded
@rem which allows us to clear the local environment before executing the java command
endlocal & "%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %WEB02_OPTS%  -classpath "%CLASSPATH%"  %* & call :exitWithErrorLevel

:exitWithErrorLevel
@rem Use "%COMSPEC%" /c exit to allow operators to work properly in scripts
"%COMSPEC%" /c exit %ERRORLEVEL%
