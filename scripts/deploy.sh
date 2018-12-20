echo Please enter the system username;
read  username
echo Please enter the system password;
read -s password
export HTTP_PROXY=http://$username:$password@internet.visa.com:80
export HTTPS_PROXY=http://$username:$password@internet.visa.com:443
echo "PLEASE TERMINATE JOB(CTRL+C with Y as INPUT) AFTER HEROKU LOGIN TO CONTINUE WITH DEPLOYMENT"
heroku login --interactive
#AcceptSuiteWebAPI
cd ..
cd src
echo "Initiating git repository.."
git init
read
echo "Heroku app webnodeapi will get deleted if already exists.Do you wish to continue (y/n)?"
read input
echo $input
if [ "$input" == "n" ];
then
 exit 1
fi
echo Deleting the app if already exists
heroku apps:destroy --app webnodeapi  --confirm webnodeapi
echo "Starting the app creation.."
heroku create webnodeapi
git remote -v
git status
git add .
git commit -am "push acceptsuitecode"
export HTTP_PROXY=http://$username:$password@internet.visa.com:80
export HTTPS_PROXY=http://$username:$password@internet.visa.com:443
git push heroku master
#AcceptSuiteUI
cd ..
echo "Initiating git repository.."
git init
echo "Heroku app acceptsuitenodejsui will get deleted if already exists.Do you wish to continue(y/n)?"
read input
if [ "$input" == "n" ];
then
 exit 1
fi
heroku apps:destroy --app acceptsuitenodejsui  --confirm acceptsuitenodejsui
echo "Starting the app creation.."
heroku create acceptsuitenodejsui
git remote -v
git status
git add .
git commit -am "push acceptsuitecodeui"
git push heroku master
echo Launching the app..
start https://acceptsuitenodejsui.herokuapp.com/index_all.html
exit 0