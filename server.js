const express = require('express');
const app = express();
const path = require('path')
const https = require("https"),
var fs = require("fs");

var sslOptions = { //to add ssl certificate
    key: fs.readFileSync('key.pem'),
    cert: fs.readFileSync('cert.pem'),
    passphrase: '0712'
};

app.get('/index_all.html',(req,resp) => {
    resp.sendFile(path.join(__dirname,'index_all.html'));
    

});
app.use(express.static('./'));
app.use(function  (req,  res,  next) { // allow origin

    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
    
});  

https.createServer(sslOptions,app).listen(1482, () => {
    console.log('server started in 1482');
});