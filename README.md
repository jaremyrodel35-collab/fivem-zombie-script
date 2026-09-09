# FiveM Zombie Script

Ein komplettes Zombie-Script für FiveM mit Animationen, Sounds, Spawning-System und Loading Screen mit Musikplayer.

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

✅ **Loading Screen** (NEU!)
- Schöne Zombie-Animation mit Partikeln
- Animierter Progress-Bar
- Musik-Player mit 5 verschiedenen Songs
- Lautstärkeregler
- Tipps-System
- Dark Theme mit Horror-Vibes

✅ **Music Control**
- Previous/Next Song Buttons
- Play/Pause Button
- Lautstärkeregler
- 5 vorinstallierte Musik-Tracks
- Musik-Wechsel während des Ladens

✅ **Commands**
- `/spawninzombie [count]` - Zombies spawnen
- `/despawnzombie` - Zombies despawnen
- `/clearzombies` - Alle Zombies löschen
- `/zombieinfo` - Zombie-Informationen
- `/setloadingmusic [1-5]` - Loading Screen Musik ändern

## Installation

1. Script in `resources` Ordner kopieren
2. In `server.cfg` hinzufügen:
   ```
   ensure fivem-zombie-script
   ```
3. Server neustarten

## Konfiguration

Alle Einstellungen befinden sich in `shared/config.lua`:

### Zombie Kategorie
- **ZombieModels**: Verfügbare Zombie-Modelle
- **SpawnLocations**: Spawn-Lokationen
- **ZombieSettings**: Health, Speed, Damage, etc.
- **SpawnSettings**: Max Zombies, Spawn-Interval
- **Animations**: Animation-Dictionaries und Clips
- **Sounds**: Sound-Dateien

### Loading Screen Kategorie
- **LoadingScreen.enabled**: Loading Screen aktivieren/deaktivieren
- **LoadingScreen.duration**: Länge des Ladevorgangs (ms)
- **LoadingScreen.showProgress**: Progress Bar anzeigen
- **LoadingScreen.showZombieAnimation**: Zombie-Animation zeigen
- **LoadingScreenMusic**: Musik-Playlist mit URLs
- **LoadingScreenAnimation**: Animations-Einstellungen
- **LoadingScreenText**: Titel, Untertitel und Tipps

## Verwendung

### Zombie Commands
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

### Loading Screen Music
```lua
-- Musik 1: Zombie Apocalypse
/setloadingmusic 1

-- Musik 2: Dark Ambient
/setloadingmusic 2

-- Musik 3: Horror Theme
/setloadingmusic 3

-- Musik 4: Undead Rising
/setloadingmusic 4

-- Musik 5: Survival Horror
/setloadingmusic 5
```

## Loading Screen Features

### Musik-Player
- **Play/Pause Button (▶/⏸)**: Musik starten/pausieren
- **Previous Button (⏮)**: Zu vorherigem Song springen
- **Next Button (⏭)**: Zum nächsten Song springen
- **Volume Slider**: Lautstärke einstellen (0-100%)

### Visuelle Effekte
- Zombie-Emoji mit Rotations-Animation
- Partikel-Effekte um den Zombie
- Pulsierender Hintergrund
- Glowing Text-Effekte
- Flimmernde Untertitel

### Tipps
Das System zeigt zufällige Tipps während des Ladens:
- Spawn-Commands
- Zombie-Verhalten
- Überlebenstipps
- Musik-Einstellungen

## Dateistruktur

```
fivem-zombie-script/
├── fxmanifest.lua           # Script Manifest
├── README.md                # Diese Datei
├── shared/
│   └── config.lua          # Konfigurationsdatei (Zombie + Loading Screen)
├── client/
│   ├── client.lua          # Zombie Client-Logik
│   └── loading.lua         # Loading Screen Client-Logik
├── server/
│   └── server.lua          # Server-Logik
└── html/
    ├── index.html          # Loading Screen HTML
    ├── style.css           # Loading Screen Styles
    └── script.js           # Loading Screen JavaScript
```

## Anforderungen

- FiveM Server
- OneSync aktiviert
- Moderne Browser (Chrome, Firefox, Edge)

## Musik-Quellen

Die Standard-Musik-URLs sind Platzhalter. Du kannst diese durch deine eigenen URLs ersetzen:

1. Öffne `shared/config.lua`
2. Bearbeite die URLs im `Config.LoadingScreenMusic` Abschnitt
3. Server neu starten

## Tipps zur Anpassung

### Eigene Musik hinzufügen
```lua
Config.LoadingScreenMusic = {
    {
        id = 6,
        name = 'Dein Song',
        url = 'https://example.com/song.mp3',
        duration = 120,
        volume = 0.6
    }
}
```

### Loading Screen Farben anpassen
```lua
Config.LoadingScreen.backgroundColor = { r = 10, g = 10, b = 10, a = 255 }
Config.LoadingScreen.progressBarColor = { r = 139, g = 0, b = 0, a = 255 }
Config.LoadingScreen.textColor = { r = 255, g = 255, b = 255, a = 255 }
```

### Zombie-Einstellungen ändern
```lua
Config.ZombieSettings = {
    health = 200,      -- Mehr Health
    speed = 6.0,       -- Schneller
    damage = 35,       -- Mehr Schaden
    attackRange = 3.0, -- Größere Reichweite
    detectionRange = 40.0 -- Weitere Erkennung
}
```

## Lizenz

MIT

## Support

Bei Fragen oder Problemen, schreib einen Issue auf GitHub!
