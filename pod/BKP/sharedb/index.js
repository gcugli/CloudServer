const http = require('http')
const express = require('express')
const path = require('path')
const ShareDB = require('sharedb')
const ShareDBMingoMemory = require('sharedb-mingo-memory')
const WebSocket = require('ws')
const WebSocketJSONStream = require('@teamwork/websocket-json-stream')

const srvPath = (dir) => path.join(__dirname,dir)

// Start ShareDB
const share = new ShareDB({db: new ShareDBMingoMemory()})

// Create Express instance
const app = express()

//initialize a simple http server
const server = http.createServer(app)

//initialize the WebSocket server instance
const wss = new WebSocket.Server({ server })

// Serve the static files from the React app
app.use(express.static(srvPath('/public')))

app.get('*', (req,res) =>{
    res.sendFile(srvPath('/public/index.html'))
})

// Connect any incoming WebSocket connection with ShareDB
wss.on('connection', function(ws,req) {
  var stream = new WebSocketJSONStream(ws)
  share.listen(stream)
  console.log('WebSocket from',req.connection.remoteAddress)
})

//start server
server.listen(process.env.PORT || 5000, () => {
    console.log(`Server started on port ${server.address().port}.`)
})
