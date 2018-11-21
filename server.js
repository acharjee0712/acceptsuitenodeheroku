const express = require('express');
const app = express();
const path = require('path')
const https = require("https"),
fs = require("fs");
var http = require('http');
var sslOptions = {
    key: fs.readFileSync('key.pem'),
    cert: fs.readFileSync('cert.pem'),
    passphrase: '0712'
};

app.get('/index_all.html',(req,resp) => {
    resp.sendFile(path.join(__dirname,'index_all.html'));
    console.log("")

});
app.use(express.static('./'));
app.use(function  (req,  res,  next) {

    // res.setHeader('Access-Control-Allow-Origin', '*');
    // res.setHeader('Access-Control-Allow-Methods', '*');
    // res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    // res.setHeader('Access-Control-Allow-Credentials', true);
    // next();
    var allowedOrigins = ['https://10.173.102.22:8080', 'https://localhost:8080', 'https://10.173.102.22:1482', 'https://localhost:1482'];
    var origin = req.headers.origin;
    //if (allowedOrigins.indexOf(origin) > -1) {
        res.setHeader('Access-Control-Allow-Origin', 'https://localhost:1482');
    //}

    res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Credentials', true);
    return next();
});  

https.createServer(sslOptions,app).listen(1482, () => {
    console.log('server started in 1482');
});