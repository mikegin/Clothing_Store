// Module for API Routes (serving JSON)
module.exports = function(app) {
	var mysql = require('mysql');
        var config = require('../../config/config.js');
        var connection = mysql.createConnection(config);

	// Example API route
	app.get('/items', function(req, res) {
            var stmt = `select item.name, shirtSize.size_name from item inner join itemShirtSize on item.item_id = itemShirtSize.item_id inner join shirtSize on itemShirtSize.size_id = shirtSize.size_id UNION select item.name, pantsSize.size_name from item inner join itemPantsSize on item.item_id = itemPantsSize.item_id inner join pantsSize on itemPantsSize.size_id = pantsSize.size_id;`;
            
            connection.query(stmt, (err, result, fields) => {
                console.log(result);
                res.send(result);
            });
	});

	
	
	
	
	
	
	
	

	
	
	
	
	

	
	
	
	
	
	
	
	

	
	
	
	
	
}
