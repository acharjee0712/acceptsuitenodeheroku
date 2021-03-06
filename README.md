# Accept Suite Integration with Node.js WEB API

## Detailed Explanation Of Each Product Type

Authorized.Net Accept suite has below products. Detailed explanation of each product are available in the below links.
*	[Accept JS](https://developer.authorize.net/api/reference/features/acceptjs.html)
*	[Accept UI](https://developer.authorize.net/api/reference/features/acceptjs.html)
*	[Accept Hosted](https://developer.authorize.net/api/reference/features/accept_hosted.html)
*	[Accept Customer](https://developer.authorize.net/api/reference/features/customer_profiles.html)

## Two Ways To Deploy Accept Suite Node.js Application

### [Manual Deployment](../master/README.md#Manual-Deployment)
### [Automatic Deployment](../master/README.md#Automatic-Deployment)

## Steps To Download The Code From The Repository:

* Click on <b>Clone or Download</b> button from the repository.

* Popup Displays 2 Options Open in Desktop or Download ZIP

![Image of CloneorDownloadButton](docs/images/githunlink.JPG)

* Click on Download ZIP and choose the folder C:\GitHUb_node to save.
![Image of DownloadToGitHubFolder](docs/images/zipfile.JPG)

* UnZip the folder accept-sample-app-node-master.zip

* Once UnZipped , accept-sample-app-dotnet-master Folder contains css, js , HTML files along with few folders.

![Image of FolderStructure](docs/images/FolderStructure.JPG)

## Manual Deployment

### Prerequisite:
*	Node.js 4.1.2 or higher - Download Link: https://nodejs.org/en/download/
*   Sublime Text/Visual studio code 2017 or any HTML editor.
*	Heroku account (New account can be created using the link https://signup.heroku.com/)
*   Download and install Heroku CLI using the link https://devcenter.heroku.com/articles/heroku-cli#download-and-install
*   Download the jq  library file  & rename the file as jq.exe and placed it in your system 
 
*   [Download the code to the local folder](../master/README.md#steps-to-download-the-code-from-the-repository)

* Open the folder **src**

* open command prompt in administrator mode & run the command <b>"npm install"</b></br>

* [ Details steps for Web Api Deployment ](../master/src/README.md#Steps-to-deploy-the-web-API-in-Heroku)

### API URL's Section

The WEB API URLs should be provided in constant.js file in the following format.

Format for WEB API URL 
https://APPLICATIONNAME.herokuapp.com/acceptsuite/ApiMethodName

* **ApiMethodName** parameter is dynamic and that need to be replaced with Product Type name.  

* **APPLICATIONNAME** parameter is dynamic and it takes value by using "jsondata.apiAppnName" from userInputs.json file (scripts/userInputs.json).

#### userinputs.json

* Provide the web api and UI application name for heroku deployment in ./scripts/userinputs.json file. (Values should not be empty or null)
    apiAppName - Web Api deployment heroku application name.
    uiAppName - Accept suite UI deployment heroku application name.
```
{
    "apiAppnName" : "myappwebapi",
    "uiAppName" : "myappnodeapiui"
}
```
 Below are the sample URLs of web api methods
 * AcceptJSRequestUrl/AcceptUI.JS RequestUrl : URL to invoke Accept JS web service. 

	**Sample URL: 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/AcceptJs'**


* AcceptHostedRequestUrl : URL to get the token value for Accept Hosted.

	**Sample URL: 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/AcceptHosted'**


* AcceptCustomerRequestUrl : URL to get the token value for Accept Customer.

	**Sample URL: 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/AcceptCustomer'**


* ValidateCustomerRequestUrl : URL to invoke a web api method to validate customer ID.

	**Sample URL: 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/validateCustomer'**
	
### Merchant Authentication Details:

The following are the parameters with values that remains constant throughout the application. These parameters are used in script through Ajax calls for performing payments.

* **Initially default sandbox credentials are provided, User can update his own Credentials.** 

* ClientKey

![Image of ClientKey](docs/images/clientKey.PNG)

* ApiLoginID

![Image of ApiLoginID](docs/images/apiLogin.PNG)

* ApiTransactionKey

![Image of ApiTransactionKey](docs/images/apiTransactionKey.PNG)

### Create Website on Heroku

*	Open the command prompt in administrator mode.

*   Set proxy using the below command(Provide your username and password)<br/>
    set HTTP_PROXY=http://USERNAME:PASSWORD@PROXY_DOMAIN:PROXY_PORT<br/>
    set HTTPS_PROXY=http://USERNAME:PASSWORD@PROXY_DOMAIN:PROXY_PORT<br/>
	
*	Run the command **heroku login**  and provide the login credentials for heroku.

*	Navigate to the root folder where index_all.html file exists and run the command **git init** (before running the command, delete the git folder in the root path if exists)

* Run the command "heroku create ". Eg:- heroku create acceptsuitenodejsui

* Check the remote URL using the command “git remote -v”. it should be the created app's git URL,<br/>
 Eg:- 
      **heroku  https://git.heroku.com/acceptsuitenodejsui.git (fetch)**<br/>
	  **heroku  https://git.heroku.com/acceptsuitenodejsui.git (push)**
	  
* Run “git status” command, it will provide the details of file not pushed to heroku git.

* Run "git commit –am "PUSH_COMMENT"" command to commit the changes to heroku git.

* Finally, run the command “git push heroku master” which will do the deployment. Deployed URL will be displayed on successful deployment.

### Browse The Website

Sample URL: https://acceptsuitenodejsui.herokuapp.com/index_all.html

![Image of dashboard](docs/images/dashboard.JPG)

## Automatic Deployment

*   [Download the code to the local folder](../master/README.md#steps-to-download-the-code-from-the-repository)

*	[Prerequisite](../master/README.md#prerequisite)

### Steps to follow while running the  shell script
* open the userInputs.json file in order to change the variable name(../master/README.md#API-URL's-Section)

* Double click the shell script file **deploy.sh** at .\accept-sample-app-node\scripts folder.

* Double click the Bat file **deploy.bat** at .\accept-sample-app-node\scripts folder for windows operating system.


![Image of deployment file](docs/images/deploy.JPG)

*   Application will be launched automatically on successful deployment and the URL will be</br>
  URL: https://acceptsuitenodejsui.herokuapp.com/index_all.html in Chrome Browser.

![Image of dashboard](docs/images/dashboard.JPG)

## Trouble Shoot

• While deploying the app, if you encounter- <b>could not resolve host/could not read from remote repository issue</b>, </br>
 please follow the steps describe below.<br/>

![Images of  could not resolve host](docs/images/deploy_issue.JPG)

• Download the certificate file i.e:- cacert.pem file.

• copy the path of cacert.pem file & paste it as variable values with variable name as SSL_CERT-FILE in your system environment variables










	 
	  
	  
