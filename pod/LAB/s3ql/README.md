# S3QL

## Commands

### Unmount S3QL
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


