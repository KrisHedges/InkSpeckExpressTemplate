express = require 'express'
assets = require 'connect-assets'
stylus  = require 'stylus'
fluidity = require 'fluidity'
fs = require 'fs'

publicDir = "./public"

app = express()
app.use assets()
app.use "/phimages", express.static './public/phimages'
app.use "/images", express.static './public/images'
app.set "view engine", "jade"

app.get '/', (req, res) ->
  res.render 'index'

port = process.env.PORT or process.env.VMC_APP_PORT or 3000
app.listen port, ->
  console.log "Listening on #{port}\nPress CTRL-C to stop server."
