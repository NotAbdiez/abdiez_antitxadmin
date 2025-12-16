local function VerifyAccess()
    TriggerServerEvent("txcl:verifyAccess")
end

RegisterNetEvent("txcl:setPlayerMode", function()
    VerifyAccess()
end)

RegisterNetEvent("txcl:spectate:start", function()
    VerifyAccess()
end)

RegisterNetEvent("txcl:heal", function()
    VerifyAccess()
end)

RegisterNetEvent("txcl:tpToWaypoint", function()
    VerifyAccess()
end)

RegisterNetEvent("txcl:showPlayerIDs", function()
    VerifyAccess()
end)

RegisterNetEvent("txcl:showAnnouncement", function()
    VerifyAccess()
end)

RegisterNetEvent("txcl:vehicle:fix", function()
    VerifyAccess()
end)
