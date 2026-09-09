# Zombie Loading Screen

Eine schöne Loading Screen für FiveM mit Zombie-Animation, Progress-Bar und Musik-Player.

## Features

✅ **Visuelle Effekte**
- Animierter Zombie mit Partikel-Effekten
- Pulsierender Hintergrund
- Glowing Text-Effekte
- Flimmernde Untertitel
- Dark Horror-Theme

✅ **Music Player**
- 5 vorinstallierte Musik-Tracks
- Play/Pause Button
- Previous/Next Button
- Lautstärkeregler
- Musik-Info Display

✅ **Progress Bar**
- Animierte Progress Bar
- Prozent-Anzeige
- Rotes Horror-Design

✅ **Tipps-System**
- Zufällige Tipps während dem Laden
- Automatische Aktualisierung

## Installation

1. In den `resources` Ordner kopieren
2. In `server.cfg` hinzufügen:
   ```
   ensure loadingscreen
   ```
3. Server neustarten

## Konfiguration

Alle Einstellungen befinden sich in `shared/config.lua`:

```lua
-- Loading Screen aktivieren/deaktivieren
Config.LoadingScreen.enabled = true

-- Dauer des Ladevorgangs (ms)
Config.LoadingScreen.duration = 5000

-- Musik-Playlist
Config.LoadingScreenMusic = {
    { id = 1, name = 'Song Name', url = 'https://...', duration = 120, volume = 0.6 }
}

-- Eigene Tipps hinzufügen
Config.LoadingScreenText.tips = {
    'Dein Tipp 1',
    'Dein Tipp 2'
}
```

## Musik URLs ändern

1. Öffne `shared/config.lua`
2. Bearbeite die URLs im `Config.LoadingScreenMusic` Abschnitt
3. Server neu starten

## Lizenz

MIT
