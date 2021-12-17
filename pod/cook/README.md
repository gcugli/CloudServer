# Ghost blog

## Admin account

Mail: cgc@cugli.org


## Ghost blog - reset admin password

### Just first time
```
docker-compose exec cook apk add sqlite
```

### Access Ghost Database
```
docker-compose exec cook sqlite3 content/data/ghost.db
```

### Set Admin password to 'Temporal1234' 
```
docker-compose exec cook sqlite3 content/data/ghost.db 'update users set password="$2b$10$yZ2N.0/CG5GO/42PrW6k2e8i7vp8X3NGBr1xzjLzBq1YIkQsE3mIO" where id = 1;'
```

### Links
* https://passwordhashing.com/BCrypt

