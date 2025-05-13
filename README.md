# 💖 PrettyPacketAC - Has moved to a premium product💖
You can find out more information in our discord.
👉 [Join our Discord! 💬](https://discord.gg/XFwW3U42rK)











# 💖 PrettyPacketAC - Free Open Source Anticheat for FiveM💖

Hey there, lovelies! 🌸✨ Welcome to **PrettyPacketAC** — the **cutest** and **most fabulous** ✨ FREE ✨ open-source anticheat project on the internet! 🎀

Made with 💕 by [PrettyPackets](https://github.com/PrettyPackets) (that’s me! hehe), **PrettyPacketAC** is here to keep your servers safe and stylish! 🛡️🎀

---

## ✨ Features (more coming soon!) 🌟
- ⚡ Lightweight and powerful detection system
- 🎯 Real-time cheat prevention
- 🔥 Completely open source for everyone to contribute!
- 🛠️ Constant updates and exciting new features planned!

This is just the beginning, sweeties! 🌸 Stay tuned for **tons** of new features that will make your gaming experience safe, secure, and sparkly! 💎

---

## ✨ Features To-Do List 🌸

### ✅ Done Features

| Feature                        | Description                             |
|---------------------------------|-----------------------------------------|
| 💥 Anti-Godmode (3 Methods)     | Prevents players from using godmode.    |
| ✨ Anti-Invisible                | Detects and blocks invisible players.  |
| 🏃‍♂️ Anti-Infinite Stamina (2 Methods) | Stops infinite stamina exploits.    |
| 🏃‍♂️ Anti-RapidFire             | Stops rapid fire cheats.               |
| 💥 Anti-Infinite Ammo           | Prevents players from using infinite ammo. |
| 🦸 Anti-BiggerHitbox            | Prevents changing hitbox sizes.        |
| 🚙 Vehicle-Blacklist            | Blocks vehicles used for cheating.     |
| ⚔️ Weapon-Blacklist            | Blocks Weapons used for cheating.     |
| ❤️ Heartbeat System             | Tracks and manages server health.       |
| 🕳️ Anti-NoClip                 | Detects and blocks NoClip mode.        |
| 🚀 Anti-SuperJump               | Stops superjump exploits.              |
| 🌙 Anti-Nightvision             | Stops players from using night vision cheats. |
| 🌡️ Anti-Thermals               | Blocks thermal vision exploits.        |
| 🏃 Anti-SpeedChanger            | Stops players from changing their speed. |

### 🔜 Pending Features

| Feature                        | Description                             |
|---------------------------------|-----------------------------------------|
| 🛡️ Anti-Armor                  | Detects and blocks armor-related exploits. |
| 👁️ Anti-Spectate               | Stops players from spectating others.  |
| ⚔️ Anti-WeaponSpawn             | Prevents spawning of illegal weapons.  |
| 🎮 Anti-Freecam                 | Blocks freecam exploits.               |
| 🛠️ Anti-PlateChanger           | Prevents altering plates (e.g. vehicles, characters). |
| 🏃‍♀️ Anti-NoRagdoll            | Prevents the removal of ragdoll physics. |
| 🎯 Anti-AimAssist               | Blocks aim assist cheats.              |
| 🔨 Anti-DamageChanger           | Prevents players from changing damage dealt. |
| 🧨 Anti-TriggerSpam             | Stops trigger spam attacks.            |
| ✂️ Anti-ClearPedTasks           | Detects and blocks task clearing exploits. |
| ⚡ Anti-TazePlayers              | Prevents players from being tazed.     |
| 💉 Anti-Injection               | Blocks injections or code alterations. |
| 💥 Anti-Explosion               | Detects and blocks explosion exploits. |
| 🛸 Anti-EntitySpawning          | Prevents illegal entity spawning.      |
| 🔊 Anti-Sound                   | Blocks sound-related cheats.           |
| 🎯 Anti-MagicBullet             | Prevents "magic bullet" exploits.      |
| 👾 Anti-CitizenMods             | Blocks citizen mod exploits.           |
| 💣 Anti-ExplosiveAmmo           | Stops players from using explosive ammo cheats. |
| 🚧 Anti-Teleport (With Temp Bypasses) | Detects teleportation exploits and includes temp bypasses. |
| 🛠️ Anti-NUIDevTools             | Blocks NUI developer tool usage.      |
| ⚙️ Anti-ResourceStop            | Prevents the stopping of resources.    |
| ▶️ Anti-ResourceStart           | Blocks starting of unauthorized resources. |

---

### 🌟 Additional Features

| Feature                        | Description                             |
|---------------------------------|-----------------------------------------|
| 📚 Logging                      | Detailed logs for all activities.      |
| 💫 Bypasses                     | Includes temporary bypasses for certain detections. |
| 🔒 Database Banning             | Blocks cheaters through database bans. |
| 🧐 OCR Detections               | Detects and blocks OCR-based cheats.   |
| 🛡️ Prop-Whitelist               | Whitelist for props to prevent cheating. |
| 🚗 Object-Whitelist             | Whitelist for objects to prevent cheating. |
| 👤 Ped-Blacklist                | Blocks ped (character) based cheats.   |


---


## 📚 How to Use
1. 🌟 Clone the repo
2. 🛠️ Build and set up on your server
3. 🎮 Enjoy cheat-free, magical gameplay!

## 📚 How to Enable Heartbeat
1. 🌟 Add this snippet at the bottom of any client resource file (Not in the anticheat)
```
AddEventHandler('onClientResourceStop', function(resourceName)
    if resourceName == "PrettyPacketAC" then
        CancelEvent()
        TriggerServerEvent('qb-target:saveupdatedpropstarget') -- Event for detecting anticheat stopping on client's side
    end
end)
```

---

## 💬 Stay Connected!
For the latest tea ☕ on updates, sneak peeks 👀, and to hang out with other cuties building PrettyPacketAC, join our **official Discord**! 🎀✨

👉 [Join our Discord! 💬](https://discord.gg/XFwW3U42rK)

---

## 🦄 Contributing
We are open to PRs and suggestions! 🌸💻
If you want to sprinkle a little more magic on PrettyPacketAC, feel free to contribute! 💖

---

## 🌈 License
PrettyPacketAC is open-source under the **MIT License** — because everyone deserves to have a secure and fun server! 🎀✨

---

Made with lots of love and glitter ✨ by PrettyPackets 💖
