express = require 'express'
http = require 'http'
path = require 'path'

app = express()

app.use express.static path.resolve './'
app.use express.bodyParser()

server = http.createServer app

server.listen process.env.PORT || 3000, -> console.log 'Running...'