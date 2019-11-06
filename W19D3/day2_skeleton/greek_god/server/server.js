const express = require("express");
const models = require("./models");
const expressGraphQL = require("express-graphql");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const db = require("../config/keys.js").MONGO_URI;
const schema = require("./schema/schema");

const app = express();

app.use(express.static('public'));

if (!db) {
  throw new Error("You must provide a string to connect to Atlas");
}

mongoose
  .connect(db, { useNewUrlParser: true })
  .then(value => console.log(`Successfully connected to server: ${value.connections[0].host}`))
  .catch(err => console.log(err));

// Recall that we use body-parer in order to be able to parse incoming requests in middleware before they are handled
app.use(bodyParser.json());

app.use(
  "/graphql",
  expressGraphQL({
    schema,
    graphiql: true
  })
);

const webpackMiddleware = require("webpack-dev-middleware");
const webpack = require("webpack");
const webpackConfig = require("../webpack.config.js");

app.use(webpackMiddleware(webpack(webpackConfig)));

module.exports = app;
