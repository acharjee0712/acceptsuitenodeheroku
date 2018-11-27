
const  express  =  require('express');
const  app  =  express();
var fs = require("fs");
var http = require('http');

var ApiContracts = require('./sdk-node-master/lib/apicontracts')
var getcustomerprofile = require('./sdk-node-master/sample-code-node/CustomerProfiles/get-customer-profile')
var getacceptcustomerprofilepage = require('./sdk-node-master/sample-code-node/CustomerProfiles/get-accept-customer-profile-page')
var getanacceptpaymentpage = require('./sdk-node-master/sample-code-node/PaymentTransactions/get-an-accept-payment-page')
var createpayment = require('./sdk-node-master/sample-code-node/PaymentTransactions/create-an-accept-payment-transaction')

var sslOptions = { //ssl certficate
  key: fs.readFileSync('key.pem'),
  cert: fs.readFileSync('cert.pem'),
  passphrase: '0712'
};


app.use(function  (req,  res,  next) { //allow origin for cors

  res.header("Access-Control-Allow-Origin",  "*");
  res.header("Access-Control-Allow-Methods",  "*");
  res.header("Access-Control-Allow-Headers",  "Origin,X-Requested-With,Content-Type,Accept");
  res.header("Access-Control-Allow-Credentials", true);
  next();
});


app.get('/myapp/acceptsuite/validateCustomer', (req, resp, next)  =>  {

  var apiloginid = req.query.apiLoginId;
  var transactionkey = req.query.apiTransactionKey;
  var customerprofileid = req.query.customerId;
  var obj = new acceptResponse();
  getcustomerprofile.getCustomerProfile(apiloginid, transactionkey, customerprofileid, function (res) {

    if (res != null) {
      if (res.getMessages().getResultCode() == ApiContracts.MessageTypeEnum.OK) {
        obj.status = 'True'
        obj.successValue = res.getMessages().getMessage()[0].getCode() + " " +
         res.getMessages().getMessage()[0].getText()
      }
      else {
        obj.status = 'False'
        obj.errorMessag = "error" + " " + res.getMessages().getMessage()[0].getCode() + " " + 
        res.getMessages().getMessage()[0].getText()
      }
    }
    else {
      obj.Status = 'False'
      return null
    }
    resp.send(obj)
  });
});
app.get('/myapp/acceptsuite/AcceptCustomer', (req, resp, next)  =>  {


  var apiloginid = req.query.apiLoginId;
  var transactionkey = req.query.apiTransactionKey;
  var customerprofileid = req.query.customerId;
  var hostedPaymentIFrameCommunicatorUrl = req.query.iFrameCommunicatorUrl;

  var obj = new acceptResponse();

  getacceptcustomerprofilepage.getAcceptCustomerProfilePage(apiloginid, transactionkey, customerprofileid, 
    hostedPaymentIFrameCommunicatorUrl, function (res) {

    if (res != null) {
      if (res.getMessages().getResultCode() == ApiContracts.MessageTypeEnum.OK) {
        obj.status = 'True'
        obj.successValue = res.getToken();
      }
      else {
        obj.status = 'False'
        obj.errorMessag = "error" + " " + res.getMessages().getMessage()[0].getCode() + " " + res.getMessages().getMessage()[0].getText()
      }
    }
    else {
      obj.Status = 'False'
      return null
    }
    resp.send(obj)
  })
});
app.get('/myapp/acceptsuite/AcceptHosted', (req, resp, next)  =>   {


  var apiloginid = req.query.apiLoginId;
  var transactionkey = req.query.apiTransactionKey;
  var customerprofileid = req.query.customerId;
  var iFrameCommunicatorUrl = req.query.iFrameCommunicatorUrl;
  var obj = new acceptResponse();
  getanacceptpaymentpage.getAnAcceptPaymentPage(apiloginid, transactionkey, customerprofileid, 
    iFrameCommunicatorUrl, function (res) {
    if (res != null) {
      if (res.getMessages().getResultCode() == ApiContracts.MessageTypeEnum.OK) {
        obj.status = 'True'

        obj.successValue = res.getToken();
      }
      else {
        obj.status = 'False'
        obj.errorMessage = "Failed to get hosted payment page Error: " + " " + 
        res.getMessages().getMessage()[0].getCode() + " " + 
        res.getMessages().getMessage()[0].getText()
      }
    }
    else {
      obj.Status = 'False'
      return null
    }
    resp.send(obj)
  })
});
app.get('/myapp/acceptsuite/AcceptJs', (req, resp, next)  =>   {


  var apiloginid = req.query.apiLoginId;
  var transactionkey = req.query.apiTransactionKey;
  var token = req.query.token;

  var obj = new acceptResponse();
  createpayment.createAnAcceptPaymentTransaction(apiloginid, transactionkey, token, function (res) {

    if (res != null) {
      if (res.getMessages().getResultCode() == ApiContracts.MessageTypeEnum.OK) {
        obj.status = 'True'

        obj.successValue = res.getTransactionResponse().getTransId();
      }
      else {
        obj.status = 'False'
        obj.errorMessage = "Failed Transaction" + " " + res.getMessages().getMessage()[0].getCode() + " " + 
        res.getMessages().getMessage()[0].getText()
      }
    }
    else {
      obj.Status = 'False'
      return null
    }
    resp.send(obj)
  })
});



http.createServer(sslOptions, app).listen(process.env.PORT || 8080, function ()  {
  console.log('server started in 8080');
});
class acceptResponse {
  getJSON() {
    utils.delete_null_properties(this, true);
    var obj = { 'ErrorResponse': this };
    return obj;
  }
  constructor(obj) {
    if (arguments.length == 1) {
      if (('successValue ' in obj) && (obj.successValue != null)) { this.setSuccessValue(obj.successValue); }
      if (('errorMessage' in obj) && (obj.errorMessage != null)) { this.setErrorMessage(new MessageType(obj.errorMessage)); }
      if (('status' in obj) && (obj.status != null)) { this.setStatus(obj.Status) }
    }
    else {
      this.setSuccessValue(null);
      this.setErrorMessage(null);
      this.setStatus(null);
    }
  }
  setSuccessValue(p_successValue) { this.successValue = p_successValue; }
  getSuccessValue() { if ('successValue' in this) { return this.successValue; } }
  setErrorMessage(p_errorMessage) { this.errorMessage = p_errorMessage; }
  getErrorMessage() { if ('errorMessage' in this) { return this.errorMessage; } }
  setStatus(p_status) { this.status = p_status; }
  getValue() { if ('status' in this) { return this.status; } }
}


