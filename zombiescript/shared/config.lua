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
    info = 'zombieinfo'
}

return Config
