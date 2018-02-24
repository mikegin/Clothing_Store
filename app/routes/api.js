// Module for API Routes (serving JSON)
module.exports = function(app) {
        var db = require('../db/db.js');  

	// Example API route
	app.get('/items', function(req, res) {
            db.getAll(function(err, data) {
                if(err) {
                    console.log(err);
                } else {
                    res.send(data);
                }
            });
        });                              
                
}
