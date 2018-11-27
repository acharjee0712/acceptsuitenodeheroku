# Accept Suite Integration with Node.js WEB API

##Getting Started

These instructions is for running the Accept Suite UI on your local machine for development and testing purposes.


## Prerequisite:
*	Node.js 4.1.2 or higher Download Link: https://nodejs.org/en/download/
*   Sublime Text/Visual studio code 2017 or any HTML editor.
*	Heroku account (New account can be created using the link https://signup.heroku.com/)
*   Downlaod and install Heroku CLI using the link https://devcenter.heroku.com/articles/heroku-cli#download-and-install


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

## Integration
Constants.js file consists of required URLs that are used for WEB API calls and constant parameters that are used throughout the application.

URL format when deployed in heroku 
https://acceptsuitenodejsui.herokuapp.com/index_all.html
Below are the sample URLs of web api methods

* AcceptJSRequestUrl : URL to invoke Accept JS web service on payment.
![Image of AcceptJSRequestUrl](Github-Images/AcceptJSRequestUrl.JPG)
* AcceptHostedRequestUrl : URL to get the token value for Accept Hosted.
![Image of HostedRequestUrl](Github-Images/AcceptHostedRequestUrl.JPG)
* AcceptCustomerRequestUrl : URL to get the token value for Accept Customer.
![Image of CustomerRequestUrl](Github-Images/AcceptCustomerRequestUrl.JPG)
* ValidateCustomerRequestUrl : URL to invoke a web api method to validated customer ID.
![Image of ValidateCustomerUrl](Github-Images/ValidateCustomerRequestUrl.JPG)


The following are the parameters with values that remains constant throughout the application. These parameters are used in script through Ajax calls for performing payments.

* ClientKey
![Image of ClientKey](Github-Images/clientKey.PNG)
* ApiLoginID
![Image of ApiLoginID](Github-Images/apiLogin.PNG)
* ApiTransactionKey
![Image of ApiTransactionKey](Github-Images/apiTransactionKey.PNG)

### Steps to deploy the application in Heroku

•Clone the repsitory or download the code to the local folder.


•Open the command prompt in administrator mode

• Run npm config set proxy http://userproxy.visa.com
      npm config set https-proxy http://userproxy.visa.com

• Run npm install

• Run npm install express

•Set proxy using the below command(Provide your username and password)
 set HTTP_PROXY=http://USERNAME:PASSWORD@internet.visa.com:80
 set HTTPS_PROXY=http://USERNAME:PASSWORD@internet.visa.com:443


•Run the command "heroku login" and provide the login credentials for heroku.


•Go inside the application & then go to the folder Acceptsuitewebapipath where acceptsuite.js  file exists and  then copy the path , paste it to command prompt & 
run the command "git init" (before running the command, delete the git folder in the root path if exists)


•Run the command "heroku create ". Eg:- heroku create webnodeapi


•Check the remote URL using the command “git remote -v”. it should be the created app's git URL,
 Eg:- heroku  https://git.heroku.com/webnodeapi.git (fetch)
      heroku  https://git.heroku.com/webnodeapi.git (push)

•Run “git status” command, it will provide the details of file not pushed to heroku git.


•Run the command “git add .” to add the untracked file to heroku git.


•Run "git commit –am "PUSH_COMMENT"" command to commit the changes to heroku git.


•Finally, run the command “git push heroku master” which will do the deployment. Deployed URL will be displayed on successful deployment.

• Now go to the constants.js file inside the root folder & modifies the  below   url  with successfully deployed url  of above step.
Ex:-
   AcceptJSRequestUrl : 'https://webnodeapi.herokuapp.com/myapp/acceptsuite/AcceptJs',

   AcceptHostedRequestUrl : 'https://webnodeapi.herokuapp.com/myapp/acceptsuite/AcceptHosted',

   AcceptCustomerRequestUrl : 'https://webnodeapi.herokuapp.com/myapp/acceptsuite/AcceptCustomer',

   ValidateCustomerRequestUrl:'https://webnodeapi.herokuapp.com/myapp/acceptsuite/validateCustomer',
   
• Go to the the root folder path where index_all.html file exists & paste it to command prompt  and run the command "git init" (before running the command, delete the git folder in the root path if exists)

• Run the command "heroku create ". Eg:- heroku create acceptsuitenodejsui

•Check the remote URL using the command “git remote -v”. it should be the created app's git URL,
 Eg:- heroku  https://git.heroku.com/acceptsuitenodejsui.git (fetch)
      heroku  https://git.heroku.com/acceptsuitenodejsui.git (push)
	  
• Run “git status” command, it will provide the details of file not pushed to heroku git.

• Run "git commit –am "PUSH_COMMENT"" command to commit the changes to heroku git.

•Finally, run the command “git push heroku master” which will do the deployment. Deployed URL will be displayed on successful deployment.

## browse the website

Sample URL: https://acceptsuitenodejsui.herokuapp.com/index_all.html

![Image of dashboard](Github-Images/dashboard.PNG)

## Step by Step Guide for Automatic Deployment

## Prerequisite:

• Download node.js from https://nodejs.org/en/download/
• Heroku account (New account can be created using the link https://signup.heroku.com/)     
• Downlaod and install Heroku CLI using the link
     https://devcenter.heroku.com/articles/heroku-cli#download-and-install
• Open the command prompt & set the below proxy:-
     set HTTP_PROXY=http://USERNAME:PASSWORD@internet.visa.com:80
      set HTTPS_PROXY=http://USERNAME:PASSWORD@internet.visa.com:443
	 
# Steps to run the bat file after downloading the code

* Click on Clone or Download button from the repository.

* Popup Displays 2 Options Open in Desktop or Download ZIP

![Image of CloneorDownloadButton](Github-Images/githunlink.JPG)

* Click on Download ZIP and choose the folder C:\GitHUb_node to save.
![Image of DownloadToGitHubFolder](Github-Images/zipfile.JPG)

* UnZip the folder accept-sample-app-node-master

* Once UnZipped , accept-sample-app-node-master Folder contains css, js , HTML files along with few folders.

![Image of FolderStructure](Github-Images/batfile.JPG)
* ** Before running bat file its mandatory to follow all the prerequisite steps.**

* Double click on auto_note bat file, in order to run the Bat file.

#Steps to follow while running the Bat File

• It will open Two command prompt , go to the 2nd one & press any key.

![Image of 2nd command prompt](Github-Images/herokulogin.JPG)

• Heroku login page will open on browser.

![Image of Heroku login page](Github-Images/herokuloginpage.JPG)

• Click on log in, enter the credentials, it will show logged in after succefull loged in.

![Image of Succefull Heroku login page](Github-Images/loggedin.JPG)

• Go to the 1st command prompt & press any key to continue

![Image of 1st Command Prompt](Github-Images/1stcmd.JPG)

• It will open another new window to create the folder,close the new command prompt & back to the previous one
![Image of New Command Prompt](Github-Images/herokucreate.JPG)

•press any key to continue, it will open another command prompt , close that & move back to previous one.

![Image of New Command Prompt](Github-Images/cmdone.JPG)

• After  successfully deployment, it  will host the Accept Suite Application.

•Once batch file successfully execute it will automatically launch the Accept Suite 
  URL: https://acceptsuitenodejsui.herokuapp.com/index_all.html in Chrome Browser.

![Image of dashboard](Github-Images/dashboard.PNG)








	 
	  
	  
