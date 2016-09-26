var mysql = require("mysql");
 
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
  };
 
  this.acquire = function(callback) {
    this.pool.getConnection(function(err, connection) {
      callback(err, connection);
    });
  };
}
 
module.exports = new Connection();