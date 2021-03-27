const bodyParser = require('body-parser');
const express    = require('express');
const app        = express();
const port       = process.env.PORT || 3000;

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json({type: 'application/json'}));

app.listen(port, () => {
	console.log(`server is running on port ${port}.`);
});

app.use('/api/person', require('./app/routes/mainRoutes'));
