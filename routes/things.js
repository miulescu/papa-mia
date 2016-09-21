var express = require('express');
var router = express.Router();

// var connection = require('../config/connection');


var mysql      = require('mysql');


var pool      =    mysql.createPool({
     connectionLimit : 100, //important
     host     : 'us-cdbr-iron-east-04.cleardb.net',
     user     : 'b08de066efb4af',
     password : 'f2b5ff54',
     database : 'heroku_a1165f5d43ce0fe',
     debug    :  false
 });

router.get('/', function(req, res){
	pool.getConnection(function(err,connection){
	 if (err) {
           connection.release();
           res.json({"code" : 100, "status" : "Error in connection database"});
           return;
         }   
 
	 connection.query("select * from Categorii",function(err,rows){
             connection.release();
             if(!err) {
                 res.json(rows);
             }           
         });

	
      
    });

	 // res.send('GET route on things.');
});


router.post('/', function(req, res){
	res.send('POST route on things.');
});
//export this router to use in our index.js
module.exports = router;