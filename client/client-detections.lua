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



local AntiRapidFireMelee = {
    ["weapon_unarmed"] = true,
    ["weapon_hammer"] = true,
    ["weapon_dagger"] = true,
    ["weapon_bat"] = true,
    ["weapon_flashlight"] = true,
    ["weapon_poolcue"] = true,
    ["weapon_candycane"] = true,
    ["weapon_stone_hatchet"] = true,
    ["weapon_wrench"] = true,
    ["weapon_knuckle"] = true,
    ["weapon_machete"] = true,
    ["weapon_golfclub"] = true,
    ["weapon_knife"] = true,
    ["weapon_switchblade"] = true,
    ["weapon_ball"] = true,
    ["weapon_snowball"] = true,
    ["weapon_nightstick"] = true,
    ["weapon_battleaxe"] = true,
}


Citizen.CreateThread(function()
    while true do
        Wait(300)
        -- Anti RapidFire
        if PrettyPacketAC.AntiRapidFire.enabled then
            local CurrentWeapons = GetSelectedPedWeapon(PlayerPedId())
            if GetWeaponTimeBetweenShots(CurrentWeapons) == 0.0 and AntiRapidFireMelee[CurrentWeapons] then
                DebugLog("debug", "Rapid Fire Detection")
            end
        end
        if PrettyPacketAC.AntiInfiniteAmmo.enabled then
            SetPedInfiniteAmmoClip(PlayerPedId(), false)
        end
    end
end)


if PrettyPacketAC.AntiHitboxModifier.enabled then
    CreateThread(function()
        while true do
            Wait(10000)
            local Pmodel = GetEntityModel(PlayerPedId())
            local min, max = GetModelDimensions(Pmodel)
            if min.y < -0.29 or max.z > 0.98 then
                DebugLog("debug", "Anti-Hitbox Modification")
            end
        end
    end)
end




CreateThread(function()
    while true do
        Wait(100)
        if PrettyPacketAC.WeaponsBlacklist.enabled then
            Wait(200)
            for WeapName, WeapModel in pairs(PrettyPacketAC.WeaponsBlacklistDict) do
                if HasPedGotWeapon(PlayerPedId(), GetHashKey(weaponmodel), false) == 1 then
                    DebugLog("debug", "Anti-Weapon Detected")
                end
            end
        end
        if PrettyPacketAC.VehicleBlacklist.enabled then
            Wait(100)
            local AntiVehPed = PlayerPedId()
            if IsPedInAnyVehicle(AntiVehPed, false) then
                local Vehicle = GetVehiclePedIsIn(AntiVehPed, false)
                local VehModel = GetEntityModel(Vehicle)
                for k,v in pairs(PrettyPacketAC.VehicleBlacklistDict) do
                    if string.lower(GetDisplayNameFromVehicleModel(VehModel)) == k and v then
                        DeleteEntity(Vehicle)
                        DebugLog("debug", "Anti-Vehicle Detected")
                    end
                end
            end

        end



    end
end)