const bodyParser = require('body-parser');
const express    = require('express');
const app        = express();
const port       = process.env.PORT || 3000;
const query      = require('./app/query');

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json({type: 'application/json'}));

app.listen(port, () => {
	console.log(`server is running on port ${port}.`);
});

app.get('/', (req, res) => {
	const result = query.create();

	res.json({
		message: 'connection successful',
		created: result
	});
});