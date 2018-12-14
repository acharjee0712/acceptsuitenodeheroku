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
cd AcceptSuiteWebApi
echo "Initiating git repository.."
git init
read
echo "Heroku app rubyacceptsuiteapi will get deleted if already exists.Do you wish to continue (y/n)?"
read input
echo $input
if [ "$input" == "n" ];
then
 exit 1
fi
echo Deleting the app if already exists
heroku apps:destroy --app rubyacceptsuiteapi  --confirm rubyacceptsuiteapi
echo "Starting the app creation.."
heroku create rubyacceptsuiteapi
git remote -v
bundle install
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
echo "Heroku app rubyacceptsuiteui will get deleted if already exists.Do you wish to continue(y/n)?"
read input
if [ "$input" == "n" ];
then
 exit 1
fi
heroku apps:destroy --app rubyacceptsuiteui  --confirm rubyacceptsuiteui
echo "Starting the app creation.."
heroku create rubyacceptsuiteui
git remote -v
git status
git add .
git commit -am "push acceptsuitecodeui"
git push heroku master
echo Launching the app..
start https://rubyacceptsuiteui.herokuapp.com/index_all.html
exit 0