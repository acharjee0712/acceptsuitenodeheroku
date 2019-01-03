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


REM check for the file existence and read the values
if EXIST "userInputs.json" (
for /f delims^=^"^ tokens^=4 %%a in ('find "apiAppnName" "userInputs.json"') do (set apiApp=%%a)
for /f delims^=^"^ tokens^=4 %%a in ('find "uiAppName" "userInputs.json"') do (set uiApp=%%a)
) else (
 echo userInputs.json file not found
 pause 
 exit
)

REM NULL check for the JSON values
if [%apiApp%] == [] (
echo Please provide apiAppnName value in userInputs.json file 
pause
exit
)
if [%uiApp%] == [] (
echo Please provide uiAppName value in userInputs.json file 
pause
exit
)

REM heroku app login
call heroku login --interactive


cd ..
cd src
echo "Initiating git repository.."
git init
REM get user confirmation to delte the app if alreday exists in the account
set /p input=Heroku app %apiApp% will get deleted if already exists.Do you wish to continue (y/n)?
if '%input%' == 'n' EXIT
echo Deleting the app if already exists
call heroku apps:destroy --app %apiApp%  --confirm %apiApp%
echo "Starting the app creation.."
call heroku create %apiApp%
git remote -v
call bundle install
git status
git add .
git commit -am "push acceptsuitecode"

REM Uncomment if proxy seting is required
REM set HTTP_PROXY=http://%user%:%password%@%domain%:%port%
REM set HTTPS_PROXY=http://%user%:%password%@%domain%:%port%

REM Deployment of application
git push heroku master


cd ..
echo "Initiating git repository.."
git init
REM get user confirmation to delte the app if alreday exists in the account
set /p input=Heroku app %uiApp% will get deleted if already exists.Do you wish to continue (y/n)?
if '%input%' == 'n' EXIT
call heroku apps:destroy --app %uiApp%  --confirm %uiApp%
echo "Starting the app creation.."
call heroku create %uiApp%
git remote -v
git status
git add .
git commit -am "push acceptsuitecodeui"
REM Deployment of application
git push heroku master
echo Launching the app..
REM launching the application
start https://%uiApp%.herokuapp.com/index_all.html
EXIT