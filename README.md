# Accept Suite Integration with Node.js WEB API

# Deploy Accept Suite Node.js Application

## Very detailed explanation of each product type.
Authorized.Net Accept suite has below products.
*	Accept JS
*	Accept UI
*	Accept Hosted
*	Accept Customer

Detailed explanation of each product are available in the below links.
https://developer.authorize.net/api/reference/features/accept.html
https://developer.authorize.net/api/reference/features/acceptjs.html
https://developer.authorize.net/api/reference/features/accept_hosted.html
https://developer.authorize.net/api/reference/features/customer_profiles.html#Using_the_Accept_Customer_Hosted_Form

Readme files  of each product are available in the below link.</br>
 acceptsuitenodeheroku\documents

## Two ways to deploy Accept Suite Node.js Application


## [Manual Deployment](../master/README.md#Step-by-Step-Guide-for-Manual-Deployment)
## [Automatic Deployment](../master/README.md#Step-by-Step-Guide-for-Automatic-Deployment)

## Steps to download the code from the repository:

* Click on Clone or Download button from the repository.

* Popup Displays 2 Options Open in Desktop or Download ZIP

![Image of CloneorDownloadButton](docs/images/githunlink.JPG)

* Click on Download ZIP and choose the folder C:\GitHUb_node to save.
![Image of DownloadToGitHubFolder](docs/images/zipfile.JPG)

* UnZip the folder accept-sample-app-node-master.zip

* Once UnZipped , accept-sample-app-dotnet-master Folder contains css, js , HTML files along with few folders.

![Image of FolderStructure](docs/images/FolderStructure.JPG)

## Step by Step Guide for Manual Deployment

## Prerequisite:
*	Node.js 4.1.2 or higher Download Link: https://nodejs.org/en/download/
*   Sublime Text/Visual studio code 2017 or any HTML editor.
*	Heroku account (New account can be created using the link https://signup.heroku.com/)
*   Downlaod and install Heroku CLI using the link https://devcenter.heroku.com/articles/heroku-cli#download-and-install
*   Download the jq file using the link https://stedolan.github.io/jq/download/ & rename the file as jq and 
    placed it in your system on the path specified  C:\Program Files\Git\usr\bin
![Image of jq file](docs/images/jq.JPG)  

*  Add the path  C:\Program Files\Git\usr\bin into system environment variables , if not added
![Image of env path ](docs/images/env.JPG) 


*   [Download the code to the local folder](../master/README.md#steps-to-download-the-code-from-the-repository)

* Open the folder **src**

* [ Details steps for Web Api Deployment ](../master/src/README.md#Steps-to-deploy-the-web-API-in-Heroku)

## API URL's Section

The WEB API URLs should be provided in constant.js file in the following format.

Format for WEB API URL 
https://APPLICATIONNAME.herokuapp.com/acceptsuite/ApiMethodName

* **ApiMethodName** parameter is dynamic and that need to be replaced with Product Type name.  

* **APPLICATIONNAME** parameter is dynamic and it took value by using "jsondata.apiAppnName" from userInputs.json file (scripts/userInputs.json).

* userInputs.json file has the default values for application name as well as for hosting the application in web page.

 Below are the sample URLs of web api methods
 * AcceptJSRequestUrl/AcceptUI.JS RequestUrl : URL to invoke Accept JS web service. 

	**Sample URL: 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/AcceptJs'**


* AcceptHostedRequestUrl : URL to get the token value for Accept Hosted.

	**Sample URL: 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/AcceptHosted'**


* AcceptCustomerRequestUrl : URL to get the token value for Accept Customer.

	**Sample URL: 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/AcceptCustomer'**


* ValidateCustomerRequestUrl : URL to invoke a web api method to validate customer ID.

	**Sample URL: 'https://' + jsondata.apiAppnName + '.herokuapp.com/acceptsuite/validateCustomer'**
	
## Merchant Authentication Details:

The following are the parameters with values that remains constant throughout the application. These parameters are used in script through Ajax calls for performing payments.

* **Initially default sandbox credentials are provided, User can update his own Credentials.** 

* ClientKey

![Image of ClientKey](docs/images/clientKey.PNG)

* ApiLoginID

![Image of ApiLoginID](docs/images/apiLogin.PNG)

* ApiTransactionKey

![Image of ApiTransactionKey](docs/images/apiTransactionKey.PNG)

## Create Website on Heroku

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

## browse the website

Sample URL: https://acceptsuitenodejsui.herokuapp.com/index_all.html

![Image of dashboard](docs/images/dashboard.JPG)

## Step by Step Guide for Automatic Deployment

*   [Download the code to the local folder](../master/README.md#steps-to-download-the-code-from-the-repository)

*	[Prerequisite](../master/README.md#prerequisite)

# Steps to follow while running the  shell script
* Double click the shell script file **deploy.sh** at .\accept-sample-app-node\scripts folder.

![Image of deployment file](docs/images/deploy.JPG)

*   Application will be launched automatically on successful deployment and the URL will be 
  URL: https://acceptsuitenodejsui.herokuapp.com/index_all.html in Chrome Browser.

![Image of dashboard](docs/images/dashboard.JPG)

## Trouble Shoot

• While deploying the app, if encounter with  could not resolve host/could not read from remote repository issue  , please follow the steps describe below <br/>

![Images of  could not resolve host](docs/images/deploy_issue.JPG)

• Download the certificate file i.e:- cacert.pem file.

• copy the path of cacert.pem file , & paste it as variable values with variable name as SSL_CERT-FILE in your system environment variables









	 
	  
	  
