#!/usr/bin/env bash
set -e

BASE="$(cd -- "$(dirname "$0")" >/dev/null 2>&1; pwd -P)"
RUST_HOME="${BASE}/Server"

SERVER_NAME="Carbon Codespaces (Test)"
SERVER_MAP_SIZE=1000
SERVER_MAP_SEED=12345
SERVER_PORT=28507
SERVER_QUERY=28505
SERVER_RCON_PORT=28506
SERVER_RCON_PASS=mypasslol
SERVER_LEVEL="CraggyIsland"

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${RUST_HOME}/RustDedicated_Data/Plugins/x86_64"
export TERM=xterm

source "${RUST_HOME}/carbon/tools/environment.sh"
cd ${RUST_HOME}
"${RUST_HOME}/RustDedicated" -batchmode +server.secure 1 +server.tickrate 30 +server.identity carbon \
	+server.port ${SERVER_PORT} +server.queryport ${SERVER_QUERY} +rcon.port ${SERVER_RCON_PORT} \
	+server.hostname "${SERVER_NAME}" +server.seed ${SERVER_MAP_SEED} +server.worldsize ${SERVER_MAP_SIZE} +server.level ${SERVER_LEVEL} \
	+rcon.password "${SERVER_RCON_PASS}" +rcon.web true +server.maxplayers 8 +app.port 1- \