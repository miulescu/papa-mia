var express = require("express");
var bodyParser = require("body-parser");
var app = express();
 
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
 
var things = require('./routes/things.js'); 
//both index.js and things.js should be in same directory
app.use('/things', things); 
 
var server = app.listen(3000, function () {
    console.log("Listening on port %s...", server.address().port);
});