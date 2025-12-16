# txAdmin Access Validator

A lightweight and secure FiveM server-side script that validates player access to
txAdmin-related functionality using Discord role verification.

The goal of this resource is to prevent unauthorized players from triggering
sensitive txAdmin events, while avoiding conflicts with txAdmin’s own permission
and join flow.

---

## Features

- Server-side Discord role validation
- Uses Discord Bot API (no client-side exposure)
- ConVar-based configuration via server.cfg
- Lightweight role caching for improved performance
- Designed to avoid txAdmin join-time conflicts
- No hardcoded secrets in Lua
- Minimal footprint, easy to integrate

---

## How It Works

1. When a protected txAdmin-related event is triggered:
   - The player’s Discord ID is retrieved
   - The Discord API is queried using a bot token
   - The required role is validated
2. Access is granted or denied server-side
3. Role data is cached temporarily to reduce API calls

This script complements txAdmin and does not interfere with its internal
permission system.

---

## Requirements

- Discord bot with Server Members Intent enabled
- Bot added to your Discord server
- FiveM server with access to server.cfg

---

## Installation

1. Download or clone this repository
2. Place the resource in your FiveM resources folder
3. Ensure it in your server config:

   ensure txadmin-access-validator

---

## Configuration

### server.cfg

Add the following lines to your server.cfg (or any loaded .cfg file):

set Discord_Token "Bot YOUR_DISCORD_BOT_TOKEN_HERE"
set Discord_Guild "YOUR_DISCORD_GUILD_ID"
set Discord_Role  "YOUR_REQUIRED_ROLE_ID"

---

## Configuration Notes

- Discord_Token  
  Must include the `Bot ` prefix and is never exposed to clients

- Discord_Guild  
  Your Discord server (guild) ID

- Discord_Role  
  The role required to access protected txAdmin functionality

---
