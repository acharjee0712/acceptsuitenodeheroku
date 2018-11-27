echo %cd%
start heroku login
pause
git init
start heroku create suiteapi
pause
git remote -v
git status
git add .
git commit -am "push acceptsuitecode"
git push heroku master
cd ..
git init
start heroku create acceptapi
pause
git remote -v
git status
git add .
git commit -am "push acceptsuitecodeui"
git push heroku master
start https://acceptapi.herokuapp.com/index_all.html