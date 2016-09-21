var express = require("express");
var bodyParser = require("body-parser");
var app = express();
 
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
 
var things = require('./routes/things.js'); 
//both index.js and things.js should be in same directory
app.use('/things', things); 

var port = process.env.PORT || 5000;
var server = app.listen(port, function () {
    console.log("Listening on port %s...", port);
});