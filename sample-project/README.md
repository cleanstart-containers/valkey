# Valkey Sample Project

A minimal Valkey setup using `cleanstart/valkey:latest-dev`.

**Requirements: Docker and Docker Compose.**

---

## Project Structure

```
valkey-sample/
├── docker-compose.yml
├── valkey.conf
└── README.md
```

---

## Start the Server

```bash
docker compose up -d valkey
```

---

## Common Commands

```bash
# Interactive CLI
docker exec -it valkey-server valkey-cli

# Ping
docker exec -it valkey-server valkey-cli PING

# Set and get a key
docker exec -it valkey-server valkey-cli SET foo "bar"
docker exec -it valkey-server valkey-cli GET foo

# List all keys
docker exec -it valkey-server valkey-cli KEYS "*"

# Server info
docker exec -it valkey-server valkey-cli INFO server

# Memory usage
docker exec -it valkey-server valkey-cli INFO memory

# Monitor live commands (Ctrl+C to stop)
docker exec -it valkey-server valkey-cli MONITOR

# Flush all data
docker exec -it valkey-server valkey-cli FLUSHALL

# View logs
docker logs valkey-server

# Follow logs
docker logs -f valkey-server

# Restart
docker restart valkey-server

# Stop
docker stop valkey-server

# Remove
docker rm -f valkey-server
```

---

## Configuration

Edit `valkey.conf` and restart the container to apply changes:

```bash
docker restart valkey-server
```

| Setting | Default | Description |
|---|---|---|
| `maxmemory` | `128mb` | Max memory before eviction |
| `maxmemory-policy` | `allkeys-lru` | Eviction strategy |
| `save 60 1` | enabled | Snapshot every 60s if ≥1 write |
| `loglevel` | `notice` | Log verbosity |