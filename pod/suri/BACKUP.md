# Suri Backup

## Data Weekly Backup
```bash
sudo -i
cd /data/suri/data/
borg create -spC auto,lzma  /data/BorgBackups/suriNextCloud::data-{now:%Yw%W} */files/
```

## App Monthly Backup

```bash
sudo -i
cd /data/suri/app/
borg create -spC auto,lzma  /data/BorgBackups/suriNextCloud::app-{now:%Yw%W} .
```

TODO copy to BackBlaze 
sudo rclone copy -P /data/BorgBackups/suriNextCloud BackBlaze:/suriBorgBackup


