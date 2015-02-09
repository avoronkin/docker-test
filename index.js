var express = require('express');
var app = express();

console.log('process.env',process.env);

var mongoose = require('mongoose');
mongoose.connect('mongodb://'+process.env.MONGODB_PORT_27017_TCP_ADDR+':'+process.env.MONGODB_PORT_27017_TCP_PORT+'/test');

var Cat = mongoose.model('Cat', { name: String });

app.get('/', function (req, res) {
	var kitty = new Cat({ name: 'Lex' });
	kitty.save(function (err) {
		if (err) console.log('error saving kitty...');
	  	console.log('meow');
	});
	Cat.find(function(err, cats){
		console.log('cat find', cats);
		res.send('Cats:' + cats.length);
	});
	
});

var server = app.listen(3000, function () {
	var host = server.address().address;
	var port = server.address().port;

	console.log('Example app listening at http://%s:%s', host, port);
});
