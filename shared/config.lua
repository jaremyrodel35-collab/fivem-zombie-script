-- Zombie Script Configuration

Config = {}

-- ============================================
-- ZOMBIE SETTINGS CATEGORY
-- ============================================

Config.ZombieModels = {
    'a_m_m_business_1',
    'a_m_m_business_2',
    'a_m_m_business_3',
    'a_f_m_business_1',
    'a_f_m_business_2',
    'a_m_m_casual_1',
    'a_m_m_casual_2',
    'a_f_m_casual_1'
}

Config.SpawnLocations = {
    { x = 425.5, y = -982.3, z = 29.4 },
    { x = 200.5, y = -850.3, z = 24.2 },
    { x = -500.5, y = -280.3, z = 35.5 },
    { x = 150.5, y = 250.3, z = 108.2 },
    { x = 650.5, y = 120.3, z = 85.4 }
}

Config.Animations = {
    walk = { dict = 'move_m@generic', clip = 'walk', speed = 1.0 },
    run = { dict = 'move_m@generic', clip = 'walk', speed = 2.0 },
    attack = { dict = 'combat@damage@rb_writhe', clip = 'rb_writhe_loop', speed = 1.0 },
    idle = { dict = 'combat@damage@rb_writhe', clip = 'rb_writhe_loop', speed = 0.5 },
    die = { dict = 'combat@damage@rb_writhe', clip = 'rb_writhe_loop', speed = 1.0 }
}

Config.Sounds = {
    growl = 'zombie_growl.wav',
    attack = 'zombie_attack.wav',
    death = 'zombie_death.wav',
    ambient = 'zombie_ambient.wav'
}

Config.ZombieSettings = {
    health = 150,
    speed = 4.5,
    damage = 25,
    attackRange = 2.5,
    detectionRange = 30.0,
    attackCooldown = 2000 -- milliseconds
}

Config.SpawnSettings = {
    maxZombies = 30,
    spawnInterval = 3000, -- milliseconds
    despawnDistance = 200.0,
    maxZombiesPerLocation = 8
}

Config.Commands = {
    spawn = 'spawninzombie',
    despawn = 'despawnzombie',
    clear = 'clearzombies',
    info = 'zombieinfo',
    setmusic = 'setloadingmusic'
}

-- ============================================
-- LOADING SCREEN CATEGORY
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
        'Use /spawninzombie to spawn zombies',
        'Zombies will attack if you get too close',
        'Adjust music with /setloadingmusic',
        'Stay alive and survive the undead',
        'Zombies can be found in multiple locations',
        'Your health determines your survival',
        'Zombies despawn when you are far away'
    }
}

return Config
