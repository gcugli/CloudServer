FROM node:10-alpine

EXPOSE 5000

ENV SHAREDB_SERVER_VERSION=v1.0

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

CMD [ "npm", "run", "server" ]
