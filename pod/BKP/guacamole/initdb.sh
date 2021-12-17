

# Create Guacamole Tables
docker run --rm guacamole/guacamole \
   /opt/guacamole/bin/initdb.sh \
   --mysql | docker exec -i guacdb mysql --verbose \
   -u guacamole_user --password=ChangeMeHere -D guacamole_db

# Verify
docker exec guacdb mysql -u guacamole_user --password=ChangeMeHere -D guacamole_db -e 'show tables'

# Login using user guacadmin with password guacadmin


