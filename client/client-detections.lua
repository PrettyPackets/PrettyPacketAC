local playerSpawned = false

function PrettyConsoleLog(type, message)
    if type == "info" then
        colorCode = "^5" 
    elseif type == "warn" then
        colorCode = "^3" 
    elseif type == "error" then
        colorCode = "^8" 
    elseif type == "debug" then
        colorCode = "^4" 
    elseif type == "success" then
        colorCode = "^2" 
    end
    print("^6[PrettyPacketAC^6]" .. colorCode .. " - " .. message .. "^7")
end

function DebugLog(type, message)
    if PrettyPacketAC.Debug then
        PrettyConsoleLog(type, message)
    end
end

AddEventHandler('playerSpawned', function()
    if not playerSpawned then
        playerSpawned = true
    else
        return
    end
end)

--Client Side Detection Thread
Citizen.CreateThread(function()
    local godModeFlagCounter = 0
    while true do
        Citizen.Wait(5000)
        local playerId      = PlayerId()
        local playerPed = PlayerPedId()


        --AntiGodmode Basic Detection Related
        local currentHealth = GetEntityHealth(playerPed)
        --


        --Godmode
        if PrettyPacketAC.AntiGodMode.enabled then
            if (godModeFlagCounter >= PrettyPacketAC.AntiGodMode.maxFlags) then
                DebugLog("debug", "Godmode Flag Detection is Greater than Max flags")
            end
            --Basic Detection
            if currentHealth > (PrettyPacketAC.AntiGodMode.maxHealth) then
                DebugLog("debug", "Basic health Check Godmode Detected")
            else
                DebugLog("debug", "Basic Godmode Detection Clean")
            end
            --Flag Counter For Godmode
            SetPlayerHealthRechargeMultiplier(playerId, 0.0)
            SetEntityHealth(playerPed, currentHealth - 2)
            Citizen.Wait(50)
            if GetEntityHealth(playerPed) > currentHealth - 2 then
                godModeFlagCounter = godModeFlagCounter + 1
                DebugLog("debug", "Medium Godmode Flag Added")
            elseif godModeFlagCounter > 0 then
                godModeFlagCounter = godModeFlagCounter - 1
                DebugLog("debug", "Medium Godmode Flag Removed")
            end
            SetEntityHealth(playerPed, GetEntityHealth(playerPed) + 2)
            if GetPlayerInvincible(PlayerId()) then
                DebugLog("debug", "Godmode - Player Invincible")
            end
            -- Check entity proofs
            local retval, bulletProof, fireProof, explosionProof, collisionProof, meleeProof, steamProof, p7, drownProof = GetEntityProofs(playerPed)
            if bulletProof and fireProof and explosionProof and collisionProof and meleeProof and steamProof and drownProof then
                DebugLog("debug", "Godmode - Entity Proofs Enabled")
            end
        end

        --Stamina
        if PrettyPacketAC.AntiInfiniteStamina.enabled then
            if not (IsPedInAnyVehicle(ped, true) or IsPedRagdoll(ped) or IsPedFalling(ped) or IsPedJumpingOutOfVehicle(ped) or IsPedInParachuteFreeFall(ped)) then
                if GetEntitySpeed(ped) > 7.0 then
                    if math.floor(GetPlayerSprintStaminaRemaining(PlayerId()) + 0.5) == 0 then
                        DebugLog("debug", "Infite Stamina - Infinite Stamina Detected")
                    end
                end
            end

        end

        --Invisible
        if PrettyPacketAC.AntiInvisible.enabled then
            if not IsEntityVisible(PlayerPedId()) and not IsEntityVisibleToScript(PlayerPedId()) or GetEntityAlpha(PlayerPedId()) <= 150 and GetEntityAlpha(PlayerPedId()) ~= 0 and playerSpawned then
                DebugLog("debug", "Invisible - Invisible Player Detected")
            end

        end

    end
end)


--Infinite Stamina Detection
Citizen.CreateThread(function()
    while PrettyPacketAC.AntiInfiniteStamina.enabled and PrettyPacketAC.AntiInfiniteStamina.method2 do
        Citizen.Wait(5000)
        local ped = PlayerPedId()
        if IsPedRunning(ped) or IsPedSprinting(ped) then
            local staminaBefore = GetPlayerSprintStaminaRemaining(PlayerId())
            Citizen.Wait(2000)
            local staminaAfter = GetPlayerSprintStaminaRemaining(PlayerId())
            if staminaAfter >= staminaBefore - 1.0 then
                DebugLog("debug", "Infite Stamina - Infinite Stamina Detected Method 2")
            end
        end
    end
end)
