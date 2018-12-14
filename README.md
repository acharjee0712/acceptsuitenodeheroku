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

Readme files  of each product are available in the below link.
 ** acceptsuitenodeheroku\documents**

## Two ways to deploy Accept Suite Node.js Application

## [Manual Deployment](https://github.com/AuthorizeNet/accept-sample-app-node#Step-by-Step-Guide-for-Manual-Deployment)
## [Automatic Deployment](https://github.com/AuthorizeNet/accept-sample-app-node#Step-by-Step-Guide-for-Automatic-Deployment)

## Step by Step Guide for Manual Deployment:

These instructions is for running the Accept Suite UI on your local machine for development and testing purposes.

## Prerequisite:
*	Node.js 4.1.2 or higher Download Link: https://nodejs.org/en/download/
*   Sublime Text/Visual studio code 2017 or any HTML editor.
*	Heroku account (New account can be created using the link https://signup.heroku.com/)
*   Downlaod and install Heroku CLI using the link https://devcenter.heroku.com/articles/heroku-cli#download-and-install

## Steps to download the code from the repository:

* Click on Clone or Download button from the repository.

* Popup Displays 2 Options Open in Desktop or Download ZIP

![Image of CloneorDownloadButton](documents/images/githunlink.JPG)

*Click on Download ZIP and choose the folder C:\GitHUb_node to save.
![Image of DownloadToGitHubFolder](documents/images/zipfile.JPG)

* UnZip the folder accept-sample-app-node-master

* Once UnZipped , accept-sample-app-node-master Folder contains css, js , HTML files along with few folders.

![Image of FolderStructure](documents/images/folder_structure.JPG)
 

* Open the folder **Acceptsuitewebapi**

### Steps to deploy the application in Heroku

•Open the command prompt in administrator mode

•Set proxy using the below command(Provide your username and password)<br/>
     **set HTTP_PROXY=http://USERNAME:PASSWORD@internet.visa.com:80**<br/>
     **set HTTPS_PROXY=http://USERNAME:PASSWORD@internet.visa.com:443**

•Run the command "heroku login" and provide the login credentials for heroku.

•Go inside the application & then go to the folder src path where acceptsuite.js  file exists and  then copy the path , paste it to command prompt & 
run the command "git init" (before running the command, delete the git folder in the root path if exists)

•Run the command "heroku create ". Eg:- heroku create webnodeapi

•Check the remote URL using the command “git remote -v”. it should be the created app's git URL,<br/>
 Eg:-   
        **heroku  https://git.heroku.com/webnodeapi.git (fetch)**<br/>
        **heroku  https://git.heroku.com/webnodeapi.git (push)**

•Run “git status” command, it will provide the details of file not pushed to heroku git.


•Run the command “git add .” to add the untracked file to heroku git.


•Run "git commit –am "PUSH_COMMENT"" command to commit the changes to heroku git.


•Finally, run the command “git push heroku master” which will do the deployment. Deployed URL will be displayed on successful deployment.

* Once deployed Successfully , update the URL's in Constants.js file as described below.

* **Constants.js file contains Keys which is used globally across the application.**

## API URL's Section:

The URLs should be provided with in the following format.

**https://acceptsuitenodejsui.herokuapp.com/index_all.html**

* ** ApiMethodName ** parameter is dynamic and that need to be replaced with Product Type name 
detailed description is explained below.

* AcceptJSRequestUrl/AcceptUI.JS RequestUrl : URL to invoke Accept JS web service.

	**Sample URL: https://webnodeapi.herokuapp.com/acceptsuite/AcceptJs**


* AcceptHostedRequestUrl : URL to get the token value for Accept Hosted.

	**Sample URL: https://webnodeapi.herokuapp.com/acceptsuite/AcceptHosted**


* AcceptCustomerRequestUrl : URL to get the token value for Accept Customer.

	**Sample URL: https://webnodeapi.herokuapp.com/acceptsuite/AcceptCustomer**


* ValidateCustomerRequestUrl : URL to invoke a web api method to validate customer ID.

	**Sample URL: https://webnodeapi.herokuapp.com/acceptsuite/validateCustomer**
 
 
## Merchant Authentication Details:

The following are the parameters with values that remains constant throughout the application. These parameters are used in script through Ajax calls for performing payments.

* ** Initially default sandbox credentials are provided, User can update his own Credentials. **

* ClientKey

![Image of ClientKey](documents/images/clientKey.PNG)

* ApiLoginID

![Image of ApiLoginID](documents/images/apiLogin.PNG)

* ApiTransactionKey

![Image of ApiTransactionKey](documents/images/apiTransactionKey.PNG)

### Create Website on Heroku

• Go to the the root folder path where index_all.html file exists & paste it to command prompt  and run the command "git init" 
   (before running the command, delete the git folder in the root path if exists)

• Run the command "heroku create ". Eg:- heroku create acceptsuitenodejsui

•Check the remote URL using the command “git remote -v”. it should be the created app's git URL,<br/>
 Eg:- 
      **heroku  https://git.heroku.com/acceptsuitenodejsui.git (fetch)**<br/>
	  **heroku  https://git.heroku.com/acceptsuitenodejsui.git (push)**
	  
• Run “git status” command, it will provide the details of file not pushed to heroku git.

• Run "git commit –am "PUSH_COMMENT"" command to commit the changes to heroku git.

•Finally, run the command “git push heroku master” which will do the deployment. Deployed URL will be displayed on successful deployment.

## browse the website

Sample URL: https://acceptsuitenodejsui.herokuapp.com/index_all.html

![Image of dashboard](documents/images/dashboard.PNG)

## Step by Step Guide for Automatic Deployment

*   [Download the code to the local folder](../master/README.md#steps-to-download-the-code-from-the-repository)

*	[Prerequisite](../master/README.md#prerequisite)

#Steps to follow while running the  shell script
• Double click the shell script file **deploy.sh** at .\accept-sample-app-node\scripts folder.

*   Application will be launched automatically on successful deployment and the URL will be 
  URL: https://acceptsuitenodejsui.herokuapp.com/index_all.html in Chrome Browser.

![Image of dashboard](documents/images/dashboard.PNG)

##Trouble Shoot

• While deploying the app, if encounter with  could not resolve host/could not read from remote repository issue  , please follow the steps describe below 
![Images of  could not resolve host](documents/images/deploy_issue.JPG)

• Download the certificate file i.e:- cacert.pem file.

• copy the path of cacert.pem file , & paste it as variable values with variable name as SSL_CERT-FILE in your system environment variables









	 
	  
	  
