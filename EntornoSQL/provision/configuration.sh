
#!/bin/bash
# box_configuration.sh

# Install and configure PostgreSQL database manager
  sudo apt-get update
  sudo apt-get install -y postgresql postgresql-contrib > /dev/null 2>&1
  # Set up vagrant user
  sudo -u postgres bash -c "psql -c \"CREATE USER Luisillo WITH PASSWORD 'Alexby11';\""
  sudo -u postgres bash -c "psql -c \"ALTER USER Luisillo WITH SUPERUSER;\""
  # Make available useful extensions to the schemas
  sudo -u postgres bash -c "psql -c \"CREATE EXTENSION unaccent SCHEMA pg_catalog;\""
  sudo -u postgres bash -c "psql -c \"CREATE EXTENSION pg_trgm SCHEMA pg_catalog;\""
  # Start service
  sudo service postgresql start