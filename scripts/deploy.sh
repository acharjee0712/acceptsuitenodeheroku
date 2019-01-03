# Checking the userInputs.json file name
file=userInputs.json
n=$((RANDOM%50+5))
if [ ! -f "$file" ]
then
    echo "File '${file}' not found.please check the script folder for userInputs.json"
	sleep $n
	exit 1
fi
 
# Reading variable values from userInputs.json file
apiAppnName=$(jq -r '.apiAppnName' $file)
uiAppName=$(jq -r '.uiAppName' $file)

# Checking for null values for variables 
if  [  "$apiAppnName" == null ] || [ -z "$apiAppnName" ] || [  "$uiAppName" == null ] || [ -z "$uiAppName" ]
then 
  echo "variable apiAppnName or uiAppName  is null,please give proper variable values in userInputs.json  "
  sleep $n
	exit 1
fi
 
# enter the  system username & password 
echo Please enter the system username;
read  username
echo Please enter the system password;
read -s password
export HTTP_PROXY=http://$username:$password@internet.visa.com:80
export HTTPS_PROXY=http://$username:$password@internet.visa.com:443
echo "PLEASE TERMINATE JOB(CTRL+C with Y as INPUT) AFTER HEROKU LOGIN TO CONTINUE WITH DEPLOYMENT"
heroku login --interactive

#Start deploying web api 
cd ..
cd src
echo "Initiating git repository.."
git init
read
echo "Heroku app apiAppnName will get deleted if already exists.Do you wish to continue (y/n)?"
read input
echo $input
if [ "$input" == "n" ];
then
 exit 1
fi
echo "Deleting the app if already exists"
heroku apps:destroy --app $apiAppnName  --confirm $apiAppnName
echo "Starting the app creation.."
heroku create $apiAppnName
git remote -v
git status
git add .
git commit -am "push acceptsuitecode"
export HTTP_PROXY=http://$username:$password@internet.visa.com:80
export HTTPS_PROXY=http://$username:$password@internet.visa.com:443
git push heroku master

#Start deploying the Acceptsuite UI
cd ..
echo "Initiating git repository.."
git init
echo "Heroku app uiAppName will get deleted if already exists.Do you wish to continue(y/n)?"
read input
if [ "$input" == "n" ];
then
 exit 1
fi
heroku apps:destroy --app $uiAppName  --confirm $uiAppName
echo "Starting the app creation.."
heroku create $uiAppName
git remote -v
git status
git add .
git commit -am "push acceptsuitecodeui"
git push heroku master
echo Launching the app..

#launching the acceptsuite web application in browser.
start https://$uiAppName.herokuapp.com/index_all.html
exit 0