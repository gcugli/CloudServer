# ShareDB Server

[ShareDB](https://github.com/share/sharedb) is a realtime database backend based on [Operational Transformation (OT)](https://en.wikipedia.org/wiki/Operational_transformation) of JSON documents. It is the realtime backend for the [DerbyJS web application framework](http://derbyjs.com/).

## Features

- Realtime synchronization of any JSON document
- Offline change syncing upon reconnection
- Concurrent multi-user collaboration
- Middleware for implementing access control and custom extensions
- Synchronous editing API with asynchronous eventual consistency
- Realtime query subscriptions
- Simple integration with any database - [MongoDB](https://github.com/share/sharedb-mongo)
- Horizontally scalable with [pub/sub integration](#pubsub-adapters)
- Projections to select desired fields from documents and operations
- Ideal for use in browsers or on the server
- In-memory implementations of database and pub/sub for unit testing


### Install dependencies

Make sure you're in the folder where it is the `package.json` located.
```raw
npm install
```

### run server
```raw
npm start
```
### run server with nodemon
```raw
npm run server
```

Finally, open the example app in the browser. It runs on port 5000 by default:
[http://localhost:5000](http://localhost:5000)

### run with Docker
```raw
docker build -t telcosys/sharedb:v1  .

docker run -p 5000:5000 -d \
   --name=sharedb --rm --net=rproxy \
   -l "traefik.enable=true" \
   -l "traefik.backend=sharedb" \
   -l "traefik.port=5000" \
   -l "traefik.frontend.rule=Host:sharedb.cugli.net" \
   telcosys/sharedb:v1
```
### run with docker-compose
```raw
docker-compose up -d
```