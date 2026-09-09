local Config = require 'shared.config'
local zombies = {}
local zombieCount = 0

-- Load zombie models
local function loadZombieModels()
    for _, model in ipairs(Config.ZombieModels) do
        RequestModel(GetHashKey(model))
        while not HasModelLoaded(GetHashKey(model)) do
            Wait(10)
        end
    end
end

-- Create zombie at location
local function createZombie(x, y, z)
    local model = Config.ZombieModels[math.random(#Config.ZombieModels)]
    local modelHash = GetHashKey(model)
    
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(10)
    end
    
    local zombie = CreatePed(4, modelHash, x, y, z, 0.0, true, false)
    SetEntityAsMissionEntity(zombie, true, true)
    
    -- Zombie settings
    SetPedFleeAttributes(zombie, 0, false)
    SetBlockingOfNonTemporaryEvents(zombie, true)
    TaskStartScenarioInPlace(zombie, 'WORLD_HUMAN_STUPOR', 0, true)
    
    -- Store zombie data
    local zombieData = {
        id = zombie,
        x = x,
        y = y,
        z = z,
        health = Config.ZombieSettings.health,
        lastAttack = GetGameTimer(),
        targetPlayer = nil,
        state = 'idle'
    }
    
    table.insert(zombies, zombieData)
    zombieCount = #zombies
    TriggerServerEvent('zombie:updateCount', zombieCount)
    
    return zombie
end

-- Spawn zombies
local function spawnZombies(count)
    loadZombieModels()
    
    local spawned = 0
    for _, location in ipairs(Config.SpawnLocations) do
        if spawned >= count then break end
        
        for i = 1, Config.SpawnSettings.maxZombiesPerLocation do
            if spawned >= count then break end
            
            local offsetX = math.random(-15, 15)
            local offsetY = math.random(-15, 15)
            
            createZombie(location.x + offsetX, location.y + offsetY, location.z)
            spawned = spawned + 1
            Wait(100)
        end
    end
end

-- Despawn all zombies
local function despawnZombies()
    for _, zombieData in ipairs(zombies) do
        if DoesEntityExist(zombieData.id) then
            DeleteEntity(zombieData.id)
        end
    end
    zombies = {}
    zombieCount = 0
    TriggerServerEvent('zombie:updateCount', zombieCount)
end

-- Zombie AI - Chase nearby players
local function updateZombieAI()
    for i = #zombies, 1, -1 do
        local zombieData = zombies[i]
        if not DoesEntityExist(zombieData.id) then
            table.remove(zombies, i)
        else
            local zx, zy, zz = table.unpack(GetEntityCoords(zombieData.id))
            local playerPed = PlayerPedId()
            local px, py, pz = table.unpack(GetEntityCoords(playerPed))
            
            local distance = #(vector3(zx, zy, zz) - vector3(px, py, pz))
            
            if distance < Config.ZombieSettings.detectionRange then
                zombieData.state = 'chase'
                
                -- Make zombie chase player
                TaskTurnPedToFaceEntity(zombieData.id, playerPed, 3000)
                TaskGoToEntity(zombieData.id, playerPed, -1, Config.ZombieSettings.speed, Config.ZombieSettings.speed, 1073741824, 0)
                
                -- Attack if close enough
                if distance < Config.ZombieSettings.attackRange then
                    if GetGameTimer() - zombieData.lastAttack > Config.ZombieSettings.attackCooldown then
                        attackPlayer(zombieData.id, playerPed)
                        zombieData.lastAttack = GetGameTimer()
                    end
                end
            else
                zombieData.state = 'idle'
            end
            
            -- Despawn if too far
            if distance > Config.SpawnSettings.despawnDistance then
                if DoesEntityExist(zombieData.id) then
                    DeleteEntity(zombieData.id)
                end
                table.remove(zombies, i)
            end
        end
    end
    
    zombieCount = #zombies
    TriggerServerEvent('zombie:updateCount', zombieCount)
end

-- Attack player
local function attackPlayer(zombie, player)
    RequestAnimDict(Config.Animations.attack.dict)
    while not HasAnimDictLoaded(Config.Animations.attack.dict) do
        Wait(10)
    end
    
    TaskPlayAnim(zombie, Config.Animations.attack.dict, Config.Animations.attack.clip, 8.0, -8.0, -1, 1, 0, false, false, false)
    
    -- Apply damage
    ApplyDamageToPed(player, Config.ZombieSettings.damage, false)
end

-- Draw zombie info above head
local function drawZombieInfo()
    for _, zombieData in ipairs(zombies) do
        if DoesEntityExist(zombieData.id) then
            local x, y, z = table.unpack(GetEntityCoords(zombieData.id))
            local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z + 1.2)
            
            if onScreen then
                local health = GetEntityHealth(zombieData.id)
                DrawText3D(x, y, z + 1.2, 'Health: ' .. health, true)
            end
        end
    end
end

-- 3D Text drawing function
function DrawText3D(x, y, z, text, drawBg)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local distance = #(GetGameplayCameraCoord() - vector3(x, y, z))
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCameraFov()) * 75
    local scale = scale * fov
    
    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 0, 0, 215)
        if drawBg then
            SetTextOutline()
        end
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

-- Main loop
Citizen.CreateThread(function()
    loadZombieModels()
    
    while true do
        Wait(0)
        updateZombieAI()
        drawZombieInfo()
    end
end)

-- Spawn event
RegisterNetEvent('zombie:spawn')
AddEventHandler('zombie:spawn', function(count)
    spawnZombies(count)
end)

-- Despawn event
RegisterNetEvent('zombie:despawn')
AddEventHandler('zombie:despawn', function()
    despawnZombies()
end)

-- Clear event
RegisterNetEvent('zombie:clear')
AddEventHandler('zombie:clear', function()
    despawnZombies()
end)

-- Info event
RegisterNetEvent('zombie:info')
AddEventHandler('zombie:info', function(count)
    TriggerEvent('chat:addMessage', {
        args = {'Zombie Info', 'Active Zombies: ' .. count}
    })
end)

print('^2Zombie Script Client Started^7')