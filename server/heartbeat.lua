function PrettyConsoleLog(type, message)
    if type == "info" then
        colorCode = "^5" 
    elseif type == "warn" then
        colorCode = "^3" 
    elseif type == "error" then
        colorCode = "^8" 
    elseif type == "debug" then
        colorCode = "^9" 
    elseif type == "success" then
        colorCode = "^2" 
    end
    print("^6[PrettyPacketAC^6]" .. colorCode .. " - " .. message .. "^7")
end

local Heartbeats = {}

local function onPlayerDisconnected()
    local PID = source
    Heartbeats[PID] = nil
end
AddEventHandler("playerDropped", onPlayerDisconnected)

RegisterServerEvent("qb-target:saveupdatedpropstarget")
AddEventHandler("qb-target:saveupdatedpropstarget", function()
    local PID = source
    Heartbeats[PID] = os.time()
    PrettyConsoleLog("success", "Recieved Heartbeat - ".. PID)
end)


if PrettyPacketAC.Heartbeat then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10000)
            for PID, lastHeart in pairs(Heartbeats) do
                if lastHeart == nil then return end
                local currentTime = os.time()
                local timeLastHeart = currentTime - lastHeart
                if timeLastHeart > 30000 then
                    PrettyConsoleLog("success", "Player Stopped Sending Heartbeat - ".. PID)
                    --Ban Player
                    playerHeartbeats[PID] = nil
                end
            end
        end
    end)
end