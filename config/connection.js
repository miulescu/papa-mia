var mysql = require('mysql');
 
function Connection() {
  this.pool = null;
 
  this.init = function() {
    this.pool = mysql.createPool({
      connectionLimit: 10,
      host: 'localhost',
      user: 'root',
      password: 'vladioan12',
      database: 'my_first_schema'
    });
    console.log('pool created');
  };
 
  this.acquire = function(callback) {
    this.pool.getConnection(function(err, connection) {
      if (err){
        console.log('skjdksjdksjdksdjskjd');
      }
      callback(err, connection);
    });
  };
}
 
module.exports = new Connection();