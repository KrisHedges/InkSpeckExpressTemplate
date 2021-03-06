// Generated by CoffeeScript 1.3.3
var app, assets, express, fluidity, fs, port, publicDir, stylus;

express = require('express');

assets = require('connect-assets');

stylus = require('stylus');

fluidity = require('fluidity');

fs = require('fs');

publicDir = "./public";

app = express();

app.use(assets());

app.use("/phimages", express["static"]('./public/phimages'));

app.use("/images", express["static"]('./public/images'));

app.set("view engine", "jade");

app.get('/', function(req, res) {
  return res.render('index');
});

port = process.env.PORT || process.env.VMC_APP_PORT || 3000;

app.listen(port, function() {
  return console.log("Listening on " + port + "\nPress CTRL-C to stop server.");
});
