const mongoose = require('mongoose');
const express = require("express");
const app = express();
const db = require('./config/keys').mongoURI;
const expressGraphQL = require('express-graphql')
const bodyParser = require('body-parser')

mongoose
	// .connect(db)
	.connect(db, { useNewUrlParser: true })
	.then(() => console.log("Connected to MongoDB successfully"))
	.catch(err => console.log(err));

app.get("/", (req, res) => res.send("mhello"));

//make form data available in req.body
app.use(bodyParser.json());

app.use(
	"/graphql",
	expressGraphQL({
		graphiql: true
	})
);


app.listen(5000, () => console.log('Server is running on port 5000'));