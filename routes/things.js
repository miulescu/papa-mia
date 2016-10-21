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
 
	 connection.query("select * from restaurante",function(err,rows){
             connection.release();
             if(!err) {
                 res.json(rows);
             }           
         });

	
      
    });

	 // res.send('GET route on things.');
});

router.get('/:id/categorii/', function(req, res){
    // res.send('Ati ales restaurantul cu id ' + req.params.id );

    pool.getConnection(function(err,connection){
     if (err) {
           connection.release();
           res.json({"code" : 100, "status" : "Error in connection database"});
           return;
         }   
 
     connection.query("select distinct categorii.cat_nume, categorii.cat_id from meniu_categorii_items \
                inner join categorii on meniu_categorii_items.cat_id = categorii.cat_id \
                where id_restaurant = " + req.params.id ,function(err,rows){
             connection.release();
             if(!err) {
                 res.json(rows);
             }           
         });
    });
});

router.get('/:id/', function(req, res){
    // res.send('Ati ales restaurantul cu id ' + req.params.id );

    pool.getConnection(function(err,connection){
     if (err) {
           connection.release();
           res.json({"code" : 100, "status" : "Error in connection database"});
           return;
         }   
 
     connection.query("select distinct * from restaurante r \
                left join  restaurante_info i on r.rest_id = i.idInfo \
                left join adrese a on r.rest_id = a.idAdrese \
                where r.rest_id = "  + req.params.id ,function(err,rows){
             connection.release();
             if(!err) {
                 res.json(rows);
             }           
         });
    });
});

router.get('/:id/categorii/:idcategorie/', function(req, res){
    // res.send('Ati ales categoria cu id ' + req.params.idcategorie );

    pool.getConnection(function(err,connection){
     if (err) {
           connection.release();
           res.json({"code" : 100, "status" : "Error in connection database"});
           return;
         }   
 
     connection.query('select  * from meniu_categorii_items  m inner join categorii c on m.cat_id = c.cat_id inner join items i on i.Items_id = m.Item_id \
                      where id_restaurant = ' + req.params.id + ' and c.cat_id = ' + req.params.idcategorie , function(err,rows){
             connection.release();
             if(!err) {
                 res.json(rows);
             }           
         });
    });
});

router.get("/:id/categorii/:idcategorie/items/:iditem/", function(req, res){
    // res.send('Ati ales itemul cu id ' + req.params.iditem );

    pool.getConnection(function(err,connection){
     if (err) {
           connection.release();
           res.json({"code" : 100, "status" : "Error in connection database"});
           return;
         }   
 
     connection.query('select  * from meniu_categorii_items  m inner join items i on m.Item_id = i.Items_id  \
                      where m.Item_id = ' + req.params.iditem , function(err,rows){
             connection.release();
             if(!err) {
                 res.json(rows);
             }           
         });
    });
});



router.post('/', function(req, res){
	res.send('POST route on things.');
});
//export this router to use in our index.js
module.exports = router;