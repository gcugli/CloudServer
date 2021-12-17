

Start server
------------

```bash
docker run -d --name bt -p 5005:3000 -v bt-download:/downloads -e TITLE=DownBot  jpillora/cloud-torrent
```

