PrettyPacketAC = {}

PrettyPacketAC.Debug = true

PrettyPacketAC.Version                  = "0.0.1"

PrettyPacketAC.Heartbeat = true

PrettyPacketAC.AntiGodMode = {
    enabled = true,
    action = "WARN",
    maxHealth = 200,
    maxFlags = 10,
}

PrettyPacketAC.AntiInfiniteStamina = {
    enabled = true,
    action = "WARN",
    method2 = true -- Better for some worth for others IDK
}


PrettyPacketAC.AntiFastRun = {
    enabled = true,
    action = "WARN",
    speed_limit = 8
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


PrettyPacketAC.AntiNoClip = {
    enabled = true,
    action = "WARN",
}

PrettyPacketAC.AntiSuperJump = {
    enabled = true,
    action = "WARN",
}

PrettyPacketAC.AntiThermal = {
    enabled = true,
    action = "WARN",
}

PrettyPacketAC.NightVision = {
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
    ["adder"] = true,
}