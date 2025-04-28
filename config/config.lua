PrettyPacketAC = {}

PrettyPacketAC.Debug = true

PrettyPacketAC.Version                  = "0.0.1"


PrettyPacketAC.AntiGodMode = {
    enabled = true,
    action = "WARN",
    maxHealth = 200,
    maxFlags = 10,
}

PrettyPacketAC.AntiInfiniteStamina = {
    enabled = true,
    action = "WARN",
    method2 = true -- More Resource Heavy but more effective
}

PrettyPacketAC.AntiInvisible = {
    enabled = true,
    action = "WARN",
}


PrettyPacketAC.AntiRapidFire = {
    enabled = true,
    action = "WARN",
}

PrettyPacketAC.AntiInfiniteAmmo = {
    enabled = true, -- Does not Ban Just Detects
}

PrettyPacketAC.AntiHitboxModifier = {
    enabled = true,
    action = "WARN",
}

--==============================================================
          -- 🌸🔒 ～～～ WEAPON BLACKLIST ～～～ 🔒🌸
--==============================================================

PrettyPacketAC.WeaponsBlacklist = {
    enabled = true,
    action = "WARN",
}

PrettyPacketAC.WeaponsBlacklistDict = {
    ['Heavy Sniper'] = 'weapon_heavysniper',
    ['Sniper Rifle'] = "weapon_sniperrifle",
}

--==============================================================
       -- 🌸🔒 ～～～ VEHICLE BLACKLIST ～～～ 🔒🌸
--==============================================================

PrettyPacketAC.VehicleBlacklist = {
    enabled = true,
    action = "WARN",
}

PrettyPacketAC.VehicleBlacklistDict = {
    ["oppressor"] = true,
}