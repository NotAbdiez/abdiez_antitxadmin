local Allowed_People = {
    "license:12ad8813805406894e4c90854c992cdd10303f78d"
}

local function IsPlayerAllowed(source)
    for _, identifier in ipairs(GetPlayerIdentifiers(source)) do
        for _, allowed in ipairs(Allowed_People) do
            if identifier == allowed then
                return true
            end
        end
    end
    return false
end

RegisterNetEvent("txcl:verifyAccess", function()
    local src = source

    if not IsPlayerAllowed(src) then
        DropPlayer(src, "You are not allowed to use txAdmin.")
    end
end)
