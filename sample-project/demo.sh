#!/bin/sh
# demo.sh — Demonstrates common Valkey operations

HOST="${VALKEY_HOST:-valkey}"
PORT="${VALKEY_PORT:-6379}"
CLI="valkey-cli -h ${HOST} -p ${PORT}"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║        Valkey Sample Project             ║"
echo "║   image: cleanstart/valkey:latest-dev    ║"
echo "╚══════════════════════════════════════════╝"

echo "\n══ PING ══"
$CLI PING

echo "\n══ STRINGS ══"
$CLI SET greeting "Hello from Valkey!"
$CLI GET greeting
$CLI SET counter 0
$CLI INCR counter
$CLI INCR counter
$CLI INCR counter
$CLI GET counter
$CLI SETEX session:user123 300 "active"
$CLI TTL session:user123

echo "\n══ HASHES ══"
$CLI HSET user:1 name "Sanket" role "DevOps" team "Triam Security"
$CLI HGETALL user:1
$CLI HGET user:1 name

echo "\n══ LISTS ══"
$CLI RPUSH jobs "build-image" "scan-image" "push-image" "deploy"
$CLI LLEN jobs
$CLI LRANGE jobs 0 -1
$CLI LPOP jobs

echo "\n══ SETS ══"
$CLI SADD tags "fips" "amd64" "arm64" "alpine"
$CLI SMEMBERS tags
$CLI SISMEMBER tags "fips"
$CLI SCARD tags

echo "\n══ SORTED SETS ══"
$CLI ZADD image:sizes 45 "alpine:3.19"
$CLI ZADD image:sizes 182 "ubuntu:22.04"
$CLI ZADD image:sizes 12 "scratch"
$CLI ZADD image:sizes 310 "debian:bookworm"
$CLI ZRANGE image:sizes 0 -1 WITHSCORES

echo "\n══ KEY MANAGEMENT ══"
$CLI KEYS "*"
$CLI DBSIZE

echo "\n══ CLEANUP ══"
$CLI FLUSHDB
$CLI DBSIZE

echo ""
echo "Done! All operations completed successfully."
echo ""