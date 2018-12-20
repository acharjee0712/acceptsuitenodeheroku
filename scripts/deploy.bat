@echo off
REM Uncomment if proxy seting is required
REM echo Please enter the system username
REM set /p user=

REM echo Please enter the system password
REM set /p password=

REM echo Please enter the proxy domain
REM set /p domain=

REM echo Please enter the proxy port
REM set /p port=

REM set HTTP_PROXY=http://%user%:%password%@%domain%:%port%
REM set HTTPS_PROXY=http://%user%:%password%@%domain%:%port%

call heroku login --interactive


cd ..
cd src
echo "Initiating git repository.."
git init
set /p input=Heroku app webnodeapi will get deleted if already exists.Do you wish to continue (y/n)?
if '%input%' == 'n' EXIT
echo Deleting the app if already exists
call heroku apps:destroy --app webnodeapi  --confirm webnodeapi
echo "Starting the app creation.."
call heroku create webnodeapi
git remote -v
git status
git add .
git commit -am "push acceptsuitecode"
REM Uncomment if proxy seting is required
REM set HTTP_PROXY=http://%user%:%password%@%domain%:%port%
REM set HTTPS_PROXY=http://%user%:%password%@%domain%:%port%
git push heroku master


cd ..
echo "Initiating git repository.."
git init
set /p input=Heroku app acceptsuitenodejsui will get deleted if already exists.Do you wish to continue (y/n)?
if '%input%' == 'n' EXIT
call heroku apps:destroy --app acceptsuitenodejsui  --confirm acceptsuitenodejsui
echo "Starting the app creation.."
call heroku create acceptsuitenodejsui
git remote -v
git status
git add .
git commit -am "push acceptsuitecodeui"
git push heroku master
echo Launching the app..
start https://acceptsuitenodejsui.herokuapp.com/index_all.html
EXIT