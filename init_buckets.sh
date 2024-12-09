#!/bin/bash
# Ensure mc is installed
if ! command -v mc &> /dev/null
then
  echo "mc could not be found, installing..."
  wget https://dl.min.io/client/mc/release/linux-amd64/mc
  chmod +x mc
  mv mc /usr/local/bin/
fi
mc alias set myminio http://127.0.0.1:9000 minioadmin minioadmin
mc mb myminio/amgt-alerts
mc mb myminio/loki-blocks
mc mb myminio/loki-ruler
mc mb myminio/mimir-blocks
mc mb myminio/mimir-ruler

# Verify the configuration by listing buckets
mc ls myminio