local Discord_Token = GetConvar("Discord_Token", "")
local Discord_Guild = GetConvar("Discord_Guild", "")
local Discord_Role  = GetConvar("Discord_Role", "")
local NoAccessMsg   = "You do not have permission to access this."

local RoleCache     = {}

local function GetDiscordId(src)
    for _, identifier in ipairs(GetPlayerIdentifiers(src)) do
        if identifier:sub(1, 8) == "discord:" then
            return identifier:sub(9)
        end
    end
    return nil
end

local function HasDiscordRole(discordId, cb)
    if RoleCache[discordId] ~= nil then
        cb(RoleCache[discordId])
        return
    end

    local url = ("https://discord.com/api/guilds/%s/members/%s"):format(
        Discord_Guild,
        discordId
    )

    PerformHttpRequest(url, function(status, response)
        if status ~= 200 or not response then
            RoleCache[discordId] = false
            cb(false)
            return
        end

        local data = json.decode(response)
        if not data or not data.roles then
            RoleCache[discordId] = false
            cb(false)
            return
        end

        for _, role in ipairs(data.roles) do
            if role == Discord_Role then
                RoleCache[discordId] = true
                cb(true)
                return
            end
        end

        RoleCache[discordId] = false
        cb(false)
    end, "GET", "", {
        ["Authorization"] = Discord_Token,
        ["Content-Type"] = "application/json"
    })
end

RegisterNetEvent("txcl:verifyAccess", function()
    local src = source
    local discordId = GetDiscordId(src)

    if not discordId then
        DropPlayer(src, NoAccessMsg)
        return
    end

    HasDiscordRole(discordId, function(hasRole)
        if not hasRole then
            DropPlayer(src, NoAccessMsg)
        end
    end)
end)

AddEventHandler("playerDropped", function()
    local discordId = GetDiscordId(source)
    if discordId then
        RoleCache[discordId] = nil
    end
end)
