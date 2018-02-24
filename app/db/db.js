//Module obtain data from db
module.exports = {
    
    getAll: function(callback) {
        var mysql = require('mysql');                    
        var config = require('../../config/config.js');
        var connection = mysql.createConnection(config);

        var stmt = `select item.name, imagePath.path, shirtSize.size_name` +
                        ` from item`+
                        ` inner join itemShirtSize on item.item_id = itemShirtSize.item_id`+
                        ` inner join shirtSize on itemShirtSize.size_id = shirtSize.size_id`+
                        ` inner join itemImage on item.item_id = itemImage.item_id`+
                        ` inner join imagePath on itemImage.image_id = imagePath.image_id`+
                        ` UNION` +
                        ` select item.name, imagePath.path, pantsSize.size_name`+
                        ` from item` +
                        ` inner join itemPantsSize on item.item_id = itemPantsSize.item_id` +
                        ` inner join pantsSize on itemPantsSize.size_id = pantsSize.size_id`+
                       ` inner join itemImage on item.item_id = itemImage.item_id`+        
                       ` inner join imagePath on itemImage.image_id = imagePath.image_id`+ 
                       `;`;
        connection.query(stmt, (err, result, fields) => { 
            if(err) {
                callback(err, null);
            } else {
                callback(null, result);
            }   
        });
    }
}
