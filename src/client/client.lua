local function VerifyAccess()
    TriggerServerEvent("txcl:verifyAccess")
end

RegisterNetEvent("txcl:setPlayerMode", function()
    VerifyAccess()
end)

RegisterNetEvent("txcl:spectate:start", function()
    VerifyAccess()
end)

RegisterNetEvent("txcl:showPlayerIDs", function()
    VerifyAccess()
end)


