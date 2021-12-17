# S3QL

## Commands

### Create a S3QL FS
```bash
docker-compose run s3qlab mkfs.s3ql --plain --authfile=/etc/s3ql/authfile2 b2://s3ql-lab
```

### Mount S3QL FS
```bash
docker-compose up -d
```

### Unmount S3QL FS
```bash
media-s3qlstat
docker-compose exec s3ql s3qlctrl dropcache /s3ql
media-s3qlstat
fusermount -u /media/MediaFS/
docker-compose down
```

### Set Cache size
```bash
docker-compose exec s3ql s3qlctrl cachesize /s3ql 10000000
```

### authinfo2 file example
```
[s3ql]
backend-login: 003d037aad99e860000000000
backend-password: K003cyxxxxs+zzzRxxxVnDzxxxxryyy
storage-url: b2://bucketname
```

