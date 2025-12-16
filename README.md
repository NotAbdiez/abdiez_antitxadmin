# txAdmin Access Validator

A small and lightweight FiveM script that validates player access to txAdmin-related functionality using an identifier whitelist.

This script is designed to prevent unauthorized players from triggering sensitive txAdmin events while avoiding conflicts with txAdmin’s built-in permission system.

## Features

- Server-side identifier validation
- Whitelist-based access control
- Lightweight and easy to configure
- Designed to avoid txAdmin join-time conflicts

## Configuration

Edit the allowed identifiers list in the server file:

```lua
local Allowed_People = {
    "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
