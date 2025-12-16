# txAdmin Access Validator

A small and lightweight FiveM script that validates player access to txAdmin-related functionality using Discord role verification.

This script prevents unauthorized players from triggering sensitive txAdmin events while avoiding conflicts with txAdmin’s built-in permission system.

---

## Features

- Server-side Discord role validation
- Uses Discord Bot API (no client exposure)
- ConVar-based configuration via `server.cfg`
- Lightweight role caching for performance
- Designed to avoid txAdmin join-time conflicts
- No hardcoded secrets in Lua

---

## Requirements

- Discord bot with **Server Members Intent** enabled
- Bot added to your Discord server
- FiveM server with access to `server.cfg`

---

## Configuration

### 1. server.cfg

Add the following lines to your `server.cfg` (or any loaded `.cfg` file):
set Discord_Token "Bot YOUR_DISCORD_BOT_TOKEN_HERE"
set Discord_Guild "YOUR_DISCORD_GUILD_ID"
set Discord_Role "YOUR_REQUIRED_ROLE_ID"