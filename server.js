// Dependencies
var express = require('express');
var bodyParser = require('body-parser');
var morgan = require('morgan');

// Initialize the Express App
var app = express();

// To expose public assets to the world
app.use(express.static(__dirname + '/public'));

// log every request to the console
app.use(morgan('dev'));

// For parsing HTTP responses
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
	extended: true
}));

// Express Routes
require('./app/routes/api')(app);
require('./app/routes/routes')(app);

// Start the app with listen and a port number
app.listen(3000, () => {
    console.log('Listening on port 3000');
});
