echo Please enter the username;
read  username
echo Please enter the password;
read -s password
export HTTP_PROXY=http://$username:$password@internet.visa.com:80
export HTTPS_PROXY=http://$username:$password@internet.visa.com:443
echo "PLEASE TERMINATE JOB(CTRL+C with Y as INPUT) AFTER HEROKU LOGIN TO CONTINUE WITH DEPLOYMENT"
heroku login
echo Success
Exit
#AcceptSuiteWebAPI
cd Acceptsuitewebapi
echo "Initiating git repository.."
git init
echo Heroku app nodeacceptsuiteapi will get deleted if already exists.Do you wish to continue yes/no?;
read input
echo $input
if [ "$input" == "no" ];
then
 exit 1
fi
echo Deleting the app if already exists
heroku apps:destroy --confirm nodeacceptsuiteapi 
echo "Starting the app creation.."
heroku create nodeacceptsuiteapi
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
echo Heroku app nodeacceptsuiteui will get deleted if already exists.Do you wish to continue(y/n)?;
read input
if [ "$input" == "n" ];
then
 exit 1
fi
heroku apps:destroy --confirm nodeacceptsuiteui
echo "Starting the app creation.."
heroku create nodeacceptsuiteui
git remote -v
git status
git add .
git commit -am "push acceptsuitecodeui"
git push heroku master
echo Launching the app..
start https://nodeacceptsuiteui.herokuapp.com/index_all.html
