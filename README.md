# FiveM Zombie Script

Ein komplettes Zombie-Script für FiveM mit Animationen, Sounds und Spawning-System.

## Features

✅ **Zombie Spawning System**
- Mehrere Spawn-Lokationen
- Konfigurierbare Anzahl von Zombies
- Zufällige Zombie-Modelle

✅ **AI & Verhalten**
- Intelligente Zombie-KI
- Chase-Verhalten bei Spieler-Nähe
- Attack-System mit Cooldown
- Automatisches Despawning bei großer Entfernung

✅ **Animationen**
- Idle-Animation
- Walk-Animation
- Attack-Animation
- Die-Animation

✅ **Sounds**
- Growl-Sounds
- Attack-Sounds
- Death-Sounds
- Ambient-Sounds

✅ **Commands**
- `/spawninzombie [count]` - Zombies spawnen
- `/despawnzombie` - Zombies despawnen
- `/clearzombies` - Alle Zombies löschen
- `/zombieinfo` - Zombie-Informationen

## Installation

1. Script in `resources` Ordner kopieren
2. In `server.cfg` hinzufügen:
   ```
   ensure fivem-zombie-script
   ```
3. Server neustarten

## Konfiguration

Alle Einstellungen befinden sich in `shared/config.lua`:

- **ZombieModels**: Verfügbare Zombie-Modelle
- **SpawnLocations**: Spawn-Lokationen
- **ZombieSettings**: Health, Speed, Damage, etc.
- **SpawnSettings**: Max Zombies, Spawn-Interval
- **Animations**: Animation-Dictionaries und Clips
- **Sounds**: Sound-Dateien

## Verwendung

```lua
-- 5 Zombies spawnen
/spawninzombie 5

-- 10 Zombies spawnen
/spawninzombie 10

-- Zombies despawnen
/despawnzombie

-- Alle Zombies löschen
/clearzombies

-- Zombie-Info anzeigen
/zombieinfo
```

## Anforderungen

- FiveM Server
- OneSync aktiviert

## Lizenz

MIT
