# Accept Suite
Developer Guide to deploy the Node.js using Express.js Web API Application 

## Prerequisite:
* Sublime Text or  visual studio code 2017 or any editor of your choice.
* Node.js version 4.8.4 or higher . Download Link: https://nodejs.org/en/download/
* Heroku account (New account can be created using the link https://signup.heroku.com/)
* Downlaod and install Heroku CLI using the link https://devcenter.heroku.com/articles/heroku-cli#download-and-install


## Steps to deploy the web API in Heroku 


*   [Download the code to local folder](../../../master/README.md#steps-to-download-the-code-from-the-repository)  **If the code is not downloaded already**

*   Navigate to the folder .\accept-sample-app-node\src

* 	Open the command prompt in administrator mode.

* 	Set proxy using the below command(Provide your username and password)<br/>
    import HTTP_PROXY=http://USERNAME:PASSWORD@PROXY_DOMAIN:PROXY_PORT<br/>
    import HTTPS_PROXY=http://USERNAME:PASSWORD@PROXY_DOMAIN:PROXY_PORT

* Run the command "heroku login" and provide the login credentials for heroku.
* Run the command **git init** (before running the command, delete the git folder in the root path if exists)
* Run the command "heroku create APPLICATIONNAME". Eg:- heroku create webnodeapi
* Check the remote URL using the command “git remote -v”. it should be the created app's git URL.
   Eg:-
      heroku  https://git.heroku.com/webnodeapi.git (fetch)
      heroku  https://git.heroku.com/webnodeapi.git (push)

* Run “git status” command, it will provide the details of file not pushed to heroku git.

* Run the command “git add .” to add the untracked file to heroku git.

* Run "git commit –am "PUSH_COMMENT"" command to commit the changes to heroku git.

* Finally, run the command “git push heroku master” which will do the deployment. Deployed URL will be displayed on successful deployment.


## URL format of Accept Suite WEB
    https://APPLICATIONNAME.herokuapp.com/acceptsuite/METHODNAME?REQUIREDQUERYPARAMETERS

Eg:- https://webnodeapi.herokuapp.com/acceptsuite/AcceptJs?apiLoginId=VALUE&apiTransactionKey=VALUE&Token=VALUE


## QueryParameter Details

1>AcceptJs and AcceptJS UI - apiLoginId, apiTransactionKey, Token

2>AcceptHosted without customer profile - apiLoginId, apiTransactionKey, iframeCommunicatorUrl

3>AcceptHosted with customer profile - apiLoginId, apiTransactionKey, customerId, iframeCommunicatorUrl

4>AcceptCustomer - apiLoginId, apiTransactionKey, iframeCommunicatorUrl, customerId

## OPen SSL certificate
*  If certificate expries , please add the no of days in place of xxx, & run the below command from command prompt  in order to renew the certificate<br/>
     openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days XXX








 