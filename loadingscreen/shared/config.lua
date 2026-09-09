-- Loading Screen Configuration

Config = {}

-- ============================================
-- LOADING SCREEN CONFIGURATION
-- ============================================

Config.LoadingScreen = {
    enabled = true,
    duration = 5000, -- milliseconds
    showProgress = true,
    showZombieAnimation = true,
    backgroundColor = { r = 10, g = 10, b = 10, a = 255 },
    progressBarColor = { r = 139, g = 0, b = 0, a = 255 }, -- Dark Red
    textColor = { r = 255, g = 255, b = 255, a = 255 } -- White
}

-- Loading Screen Music Configuration
-- You can add more music files here
Config.LoadingScreenMusic = {
    {
        id = 1,
        name = 'Zombie Apocalypse',
        url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
        duration = 120,
        volume = 0.6
    },
    {
        id = 2,
        name = 'Dark Ambient',
        url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
        duration = 120,
        volume = 0.5
    },
    {
        id = 3,
        name = 'Horror Theme',
        url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
        duration = 120,
        volume = 0.7
    },
    {
        id = 4,
        name = 'Undead Rising',
        url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
        duration = 120,
        volume = 0.55
    },
    {
        id = 5,
        name = 'Survival Horror',
        url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
        duration = 120,
        volume = 0.65
    }
}

-- Currently selected music (1-based index)
Config.SelectedMusic = 1

-- Loading Screen Animation Settings
Config.LoadingScreenAnimation = {
    zombieRotationSpeed = 0.5, -- degrees per frame
    zombieScale = 1.5,
    zombieOpacity = 200,
    particleEffects = true,
    pulseEffect = true,
    pulseSpeed = 0.02
}

-- Loading Screen Text
Config.LoadingScreenText = {
    title = 'ZOMBIE APOCALYPSE',
    subtitle = 'Server is loading...',
    tips = {
        'Stay alive and survive the undead',
        'Adjust music with the player controls',
        'Listen to horror-themed music',
        'Prepare for the zombie invasion',
        'Multiple music tracks available',
        'Control volume with the slider',
        'Skip songs or play your favorite'
    }
}

return Config
